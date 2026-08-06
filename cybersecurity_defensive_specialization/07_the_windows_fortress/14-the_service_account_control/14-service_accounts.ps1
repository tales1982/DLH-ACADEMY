<#
    Script Name : 14-service_accounts.ps1
    Purpose     : Audit every MedDefense service account's security posture
                  and remediate the specific weaknesses (unconstrained
                  delegation, interactive logon, excessive privilege) that
                  would have let a compromised svc_ehr-style account become
                  a domain-wide incident (2x01 Task 14).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-06
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$UF_USE_DES_KEY_ONLY = 0x200000
$PasswordAgeThresholdDays = 90
$SuspiciousHourStart = 0   # 00:00
$SuspiciousHourEnd   = 5   # 05:00 - outside normal business/maintenance hours
$PrivilegedGroups = @("Domain Admins", "Enterprise Admins", "Schema Admins", "G_IT_Admins", "Administrators")

function Test-ServiceAccount {
    param([string]$SamAccountName, [string]$DistinguishedName)
    return ($SamAccountName -like "*svc*" -or $DistinguishedName -like "*OU=Service Accounts*")
}

function Get-GroupMembershipNames {
    param([string[]]$MemberOfDNs)
    if (-not $MemberOfDNs) { return @() }
    $MemberOfDNs | ForEach-Object {
        try { (Get-ADGroup -Identity $_).Name } catch { $_ }
    }
}

$serviceAccounts = Get-ADUser -Filter * -Properties MemberOf, PasswordLastSet, TrustedForDelegation, `
        ServicePrincipalNames, LastLogonDate, UserAccountControl, DistinguishedName, Enabled |
    Where-Object { Test-ServiceAccount -SamAccountName $_.SamAccountName -DistinguishedName $_.DistinguishedName }

# --- Audit: list every account's posture and flag findings ------------------------
$flaggedAccounts = [System.Collections.Generic.List[object]]::new()

foreach ($acct in $serviceAccounts) {
    $groupNames = Get-GroupMembershipNames -MemberOfDNs $acct.MemberOf
    $passwordAgeDays = if ($acct.PasswordLastSet) { [int]((Get-Date) - $acct.PasswordLastSet).TotalDays } else { $null }
    $unconstrainedDelegation = [bool]$acct.TrustedForDelegation
    $useDesKeyOnly = [bool]($acct.UserAccountControl -band $UF_USE_DES_KEY_ONLY)
    $privilegedMembership = @($groupNames | Where-Object { $_ -in $PrivilegedGroups })
    $suspiciousLogon = $acct.LastLogonDate -and
        ($acct.LastLogonDate.Hour -ge $SuspiciousHourStart -and $acct.LastLogonDate.Hour -lt $SuspiciousHourEnd)

    Write-Output "$($acct.SamAccountName):"

    if ($null -ne $passwordAgeDays -and $passwordAgeDays -ge $PasswordAgeThresholdDays) {
        Write-Output "  Password age: $passwordAgeDays days                  [!]"
    }
    if ($unconstrainedDelegation) {
        Write-Output "  Delegation: Unconstrained               [!]"
    }
    if ($suspiciousLogon) {
        Write-Output "  Last logon: $($acct.LastLogonDate.ToString('hh:mm tt'))                    [!!!]"
    }
    if ($useDesKeyOnly) {
        Write-Output "  UseDESKeyOnly: True                     [!]"
    }
    if ($privilegedMembership.Count -gt 0) {
        Write-Output "  Privileged membership: $($privilegedMembership -join ', ')     [!]"
    }

    $flaggedAccounts.Add([PSCustomObject]@{
        Account                 = $acct
        PasswordAgeDays         = $passwordAgeDays
        UnconstrainedDelegation = $unconstrainedDelegation
        UseDesKeyOnly           = $useDesKeyOnly
        SuspiciousLogon         = $suspiciousLogon
        PrivilegedMembership    = $privilegedMembership
    })
}

# --- Remediation ---------------------------------------------------------------------
Write-Output ""
Write-Output "[*] Remediating..."

foreach ($item in $flaggedAccounts) {
    $acct = $item.Account

    # "Account is sensitive and cannot be delegated" - the single strongest
    # per-account control against impersonation: even if the account is
    # compromised, its Kerberos ticket cannot be used to impersonate it to
    # another service via delegation.
    Set-ADAccountControl -Identity $acct.DistinguishedName -AccountNotDelegated $true
    if ($item.UnconstrainedDelegation) {
        Set-ADAccountControl -Identity $acct.DistinguishedName -TrustedForDelegation $false
    }
    Write-Output "    $($acct.SamAccountName): AccountNotDelegated=True, TrustedForDelegation=False   [DONE]"

    if ($item.PrivilegedMembership.Count -gt 0) {
        foreach ($group in $item.PrivilegedMembership) {
            try {
                Remove-ADGroupMember -Identity $group -Members $acct.DistinguishedName -Confirm:$false
                Write-Output "    $($acct.SamAccountName): removed from $group   [DONE]"
            } catch {
                Write-Warning "Could not remove $($acct.SamAccountName) from $group`: $($_.Exception.Message)"
            }
        }
    }
}

# --- Deny interactive logon rights for all service accounts ------------------------
# SeDenyInteractiveLogonRight blocks console/RDP-style interactive logon
# outright - a service account authenticating a person at a keyboard is
# itself a red flag (this is exactly what svc_ehr's 3:17 AM logon looked
# like). Applied directly via secedit against the local security policy.
Write-Host "[*] Denying interactive logon rights..." -NoNewline
try {
    $sids = $flaggedAccounts | ForEach-Object { "*$($_.Account.SID.Value)" }
    $sidList = $sids -join ","

    $seceditExport = Join-Path $env:TEMP "meddef_secpol_export.inf"
    $seceditImport = Join-Path $env:TEMP "meddef_secpol_import.inf"
    $seceditDb     = Join-Path $env:TEMP "meddef_secedit.sdb"

    secedit /export /cfg $seceditExport /quiet

    $lines = Get-Content $seceditExport
    $found = $false
    $newLines = foreach ($line in $lines) {
        if ($line -match '^SeDenyInteractiveLogonRight\s*=\s*(.*)$') {
            $found = $true
            $existing = $Matches[1].Trim()
            if ($existing) { "SeDenyInteractiveLogonRight = $existing,$sidList" }
            else { "SeDenyInteractiveLogonRight = $sidList" }
        } else {
            $line
        }
    }
    if (-not $found) {
        $newLines = $newLines -replace '(\[Privilege Rights\])', "`$1`nSeDenyInteractiveLogonRight = $sidList"
    }
    $newLines | Set-Content -Path $seceditImport -Encoding Unicode

    secedit /configure /db $seceditDb /cfg $seceditImport /areas USER_RIGHTS /quiet
    Write-Host " [SET]"
} catch {
    Write-Host " FAILED: $($_.Exception.Message)"
}

Write-Output "Service accounts audited: $($serviceAccounts.Count) | Remediated: $($flaggedAccounts.Count)"
