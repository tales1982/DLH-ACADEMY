<#
    Script Name : 0-domain_baseline.ps1
    Purpose     : Capture the complete, unhardened security baseline of the
                  meddefense.local Active Directory domain before any GPO
                  hardening work begins (2x01 Task 0) - the Windows
                  equivalent of 2x00's 0-baseline_snapshot.sh. Every number
                  recorded here is what Tasks 4+ are measured against.
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory
Import-Module GroupPolicy

$OutJson = Join-Path $PSScriptRoot "domain_baseline.json"

function ConvertTo-EncryptionTypeList {
    param([Nullable[int]]$Bitmask)
    # msDS-SupportedEncryptionTypes bitmask (MS-KILE 2.2.7): 1=DES-CRC,
    # 2=DES-MD5, 4=RC4, 8=AES128, 16=AES256. A null/unset value (the default
    # on an unhardened domain) means the account has never been restricted -
    # every type the DC itself still accepts remains usable, which on this
    # domain is all four families the CIS benchmark flags as weak (DES, RC4)
    # or acceptable (AES128, AES256).
    if ($null -eq $Bitmask -or $Bitmask -eq 0) {
        return @("DES", "RC4", "AES128", "AES256")
    }
    $types = @()
    if ($Bitmask -band 0x1)  { $types += "DES" }
    if ($Bitmask -band 0x2)  { $types += "DES" }
    if ($Bitmask -band 0x4)  { $types += "RC4" }
    if ($Bitmask -band 0x8)  { $types += "AES128" }
    if ($Bitmask -band 0x10) { $types += "AES256" }
    return ($types | Select-Object -Unique)
}

# --- Domain information ------------------------------------------------------
$domain = Get-ADDomain
$forest = Get-ADForest
$dcs    = @(Get-ADDomainController -Filter * | Select-Object -ExpandProperty HostName)

# --- User accounts -------------------------------------------------------------
# Finding source for 1x02-style "PasswordNeverExpires" and stale-account
# findings that Task 1 turns into a full remediation queue.
$users = Get-ADUser -Filter * -Properties Enabled, LastLogonDate, PasswordLastSet, `
            PasswordNeverExpires, DistinguishedName |
    Select-Object Name, SamAccountName, Enabled, LastLogonDate, PasswordLastSet, `
        PasswordNeverExpires, DistinguishedName

$passwordNeverExpiresUsers = $users | Where-Object { $_.PasswordNeverExpires }

# --- Groups and membership ----------------------------------------------------
$groups = Get-ADGroup -Filter * | ForEach-Object {
    [PSCustomObject]@{
        name    = $_.Name
        sid     = $_.SID.Value
        members = @(Get-ADGroupMember -Identity $_ -ErrorAction SilentlyContinue |
                    Select-Object -ExpandProperty Name)
    }
}

# --- Service accounts ---------------------------------------------------------
# Matches the module's definition: "svc" in the name, or parked in the
# Service Accounts OU. Unconstrained delegation on any of these is a direct
# path to domain compromise (the account's TGT can be replayed as anyone).
$serviceAccounts = Get-ADUser -Filter * -Properties DistinguishedName, TrustedForDelegation, `
        ServicePrincipalNames, PasswordLastSet |
    Where-Object {
        $_.SamAccountName -like "*svc*" -or $_.DistinguishedName -like "*OU=Service Accounts*"
    } |
    Select-Object Name, SamAccountName, DistinguishedName, TrustedForDelegation, PasswordLastSet, `
        @{ Name = "HasSPN"; Expression = { [bool]$_.ServicePrincipalNames.Count } }

$unconstrainedDelegationAccounts = @($serviceAccounts | Where-Object { $_.TrustedForDelegation })

# --- Group Policy Objects ------------------------------------------------------
$gpos = Get-GPO -All | Select-Object DisplayName, Id, CreationTime, ModificationTime
$hardeningGpos = @($gpos | Where-Object { $_.DisplayName -like "MedDefense*" })

# --- Password and lockout policy ----------------------------------------------
$pwPolicy = Get-ADDefaultDomainPasswordPolicy
$lockoutConfigured = $pwPolicy.LockoutThreshold -gt 0

# --- Kerberos supported encryption types (krbtgt as the domain-wide proxy) ---
$krbtgt = Get-ADUser -Identity "krbtgt" -Properties msDS-SupportedEncryptionTypes
$kerberosTypes = ConvertTo-EncryptionTypeList -Bitmask $krbtgt.'msDS-SupportedEncryptionTypes'

# --- Privileged accounts -------------------------------------------------------
$domainAdmins = @(Get-ADGroupMember -Identity "Domain Admins" -Recursive |
    Select-Object -ExpandProperty Name)
$enterpriseAdmins = @(Get-ADGroupMember -Identity "Enterprise Admins" -Recursive -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Name)

# --- SMBv1 exposure on the DC itself -------------------------------------------
$smb1Enabled = $false
try {
    $smb1Enabled = [bool](Get-SmbServerConfiguration).EnableSMB1Protocol
} catch {
    Write-Warning "Could not query SMB server configuration: $($_.Exception.Message)"
}

# --- Findings ------------------------------------------------------------------
# Same three-tier severity model as the 2x00 CIS gap analysis: critical items
# are exploitable domain-wide today, high items expand an attacker's reach
# once they land, medium items raise the noise floor for later work. Task 1
# rebuilds this into a full evidence-based findings engine - this is the
# lightweight version that belongs in the baseline itself.
$findings = [System.Collections.Generic.List[object]]::new()

if ($pwPolicy.MinPasswordLength -lt 14) {
    $findings.Add([PSCustomObject]@{ severity = "Critical"; finding = "Password policy minimum length is $($pwPolicy.MinPasswordLength) (target: 14)" })
}
if (-not $lockoutConfigured) {
    $findings.Add([PSCustomObject]@{ severity = "Critical"; finding = "Account lockout policy is not configured (threshold: 0)" })
}
if ($kerberosTypes -contains "DES" -or $kerberosTypes -contains "RC4") {
    $findings.Add([PSCustomObject]@{ severity = "Critical"; finding = "Weak Kerberos encryption types accepted: $($kerberosTypes -join ', ')" })
}
if ($passwordNeverExpiresUsers.Count -gt 0) {
    $findings.Add([PSCustomObject]@{ severity = "High"; finding = "$($passwordNeverExpiresUsers.Count) accounts have PasswordNeverExpires set" })
}
if ($unconstrainedDelegationAccounts.Count -gt 0) {
    $findings.Add([PSCustomObject]@{ severity = "High"; finding = "$($unconstrainedDelegationAccounts.Count) service accounts trusted for unconstrained delegation" })
}
if ($hardeningGpos.Count -eq 0) {
    $findings.Add([PSCustomObject]@{ severity = "High"; finding = "No MedDefense hardening GPOs present ($($gpos.Count) default GPO(s) only)" })
}
if ($domainAdmins -contains "Administrator") {
    $findings.Add([PSCustomObject]@{ severity = "High"; finding = "Built-in Administrator account is an active member of Domain Admins" })
}
if ($pwPolicy.MaxPasswordAge.TotalDays -eq 0) {
    $findings.Add([PSCustomObject]@{ severity = "Medium"; finding = "Maximum password age is 0 (passwords never expire domain-wide)" })
}
if ($smb1Enabled) {
    $findings.Add([PSCustomObject]@{ severity = "Medium"; finding = "SMBv1 protocol is enabled on $($env:COMPUTERNAME)" })
}

$critical = @($findings | Where-Object { $_.severity -eq "Critical" }).Count
$high     = @($findings | Where-Object { $_.severity -eq "High" }).Count
$medium   = @($findings | Where-Object { $_.severity -eq "Medium" }).Count

# --- Structured report ----------------------------------------------------------
$report = [PSCustomObject]@{
    generated = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    domain    = [PSCustomObject]@{
        name              = $domain.DNSRoot
        forestLevel       = $forest.ForestMode.ToString()
        domainControllers = @($dcs)
    }
    userAccounts                 = @($users)
    groups                       = @($groups)
    serviceAccounts              = @($serviceAccounts)
    unconstrainedDelegationCount = $unconstrainedDelegationAccounts.Count
    gpos                         = @($gpos)
    passwordPolicy               = [PSCustomObject]@{
        minLength  = $pwPolicy.MinPasswordLength
        complexity = $pwPolicy.ComplexityEnabled
        history    = $pwPolicy.PasswordHistoryCount
        maxAgeDays = $pwPolicy.MaxPasswordAge.TotalDays
    }
    lockoutPolicy = [PSCustomObject]@{
        threshold = $pwPolicy.LockoutThreshold
        status    = if ($lockoutConfigured) { "CONFIGURED" } else { "NOT CONFIGURED" }
    }
    kerberosEncryptionTypes = @($kerberosTypes)
    domainAdmins            = @($domainAdmins)
    enterpriseAdmins        = @($enterpriseAdmins)
    findings                = @($findings)
    findingsSummary         = [PSCustomObject]@{
        total    = $findings.Count
        critical = $critical
        high     = $high
        medium   = $medium
    }
}

$report | ConvertTo-Json -Depth 6 | Out-File -FilePath $OutJson -Encoding utf8

# --- Human-readable summary -----------------------------------------------------
Write-Output "Domain: $($domain.DNSRoot)"
Write-Output "DC: $($dcs[0])"
Write-Output "User Accounts: $($users.Count)"
Write-Output "  Password Never Expires: $($passwordNeverExpiresUsers.Count)"
Write-Output "Service Accounts: $($serviceAccounts.Count)"
Write-Output "  Unconstrained delegation: $($unconstrainedDelegationAccounts.Count)"
Write-Output "GPOs: $($gpos.Count)$(if ($hardeningGpos.Count -eq 0) { ' (Default only)' })"
Write-Output "Password Minimum Length: $($pwPolicy.MinPasswordLength)"
Write-Output "Complexity: $(if ($pwPolicy.ComplexityEnabled) { 'Enabled' } else { 'Disabled' })"
Write-Output "Lockout Threshold: $($pwPolicy.LockoutThreshold)"
Write-Output "Kerberos: $($kerberosTypes -join ', ')"
Write-Output "Domain Admins: $($domainAdmins -join ', ')"
Write-Output "Findings: $($findings.Count) (Critical: $critical, High: $high, Medium: $medium)"
Write-Output "Baseline saved to: $OutJson"
