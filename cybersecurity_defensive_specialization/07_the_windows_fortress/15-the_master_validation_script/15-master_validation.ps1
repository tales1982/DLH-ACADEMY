<#
    Script Name : 15-master_validation.ps1
    Purpose     : Read-only weekly compliance check for every hardening
                  setting deployed by Tasks 4-14 - the Windows equivalent of
                  2x00's 15-validation.sh. Makes no changes. Run every Friday
                  by James Chen (2x01 Task 15).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-06
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

$script:CriticalFailure = $false

function Write-Check {
    param([string]$Status, [string]$Label)
    Write-Output "[$Status] $Label"
    if ($Status -eq "FAIL") { $script:CriticalFailure = $true }
}

function Invoke-CheckBlock {
    param([string]$Title, [scriptblock]$Block)
    Write-Output "--- $Title ---"
    try {
        & $Block
    } catch {
        Write-Check -Status "FAIL" -Label "$Title check errored: $($_.Exception.Message)"
    }
    Write-Output ""
}

# --- Password & Lockout -------------------------------------------------------------
Invoke-CheckBlock -Title "Password & Lockout" -Block {
    $pw = Get-ADDefaultDomainPasswordPolicy
    Write-Check -Status $(if ($pw.MinPasswordLength -ge 14) { "PASS" } else { "FAIL" }) `
        -Label "Minimum length: $($pw.MinPasswordLength)"
    Write-Check -Status $(if ($pw.LockoutThreshold -gt 0 -and $pw.LockoutThreshold -le 5) { "PASS" } else { "FAIL" }) `
        -Label "Lockout threshold: $($pw.LockoutThreshold)"
}

# --- Audit Policy --------------------------------------------------------------------
Invoke-CheckBlock -Title "Audit Policy" -Block {
    $auditRows = auditpol /get /category:* /r 2>$null | ConvertFrom-Csv
    $processCreation = $auditRows | Where-Object { $_.Subcategory -eq "Process Creation" }
    $pcConfigured = $processCreation -and $processCreation.'Inclusion Setting' -ne "No Auditing"
    Write-Check -Status $(if ($pcConfigured) { "PASS" } else { "FAIL" }) -Label "Process Creation: Success"

    $cmdLine = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" `
        -Name "ProcessCreationIncludeCmdLine_Enabled" -ErrorAction SilentlyContinue).ProcessCreationIncludeCmdLine_Enabled
    Write-Check -Status $(if ($cmdLine -eq 1) { "PASS" } else { "FAIL" }) -Label "Command-line logging: Enabled"

    $logSize = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" `
        -Name "MaxSize" -ErrorAction SilentlyContinue).MaxSize
    Write-Check -Status $(if ($logSize -eq 1048576) { "PASS" } else { "FAIL" }) -Label "Security log: 1 GB"
}

# --- PowerShell ------------------------------------------------------------------------
Invoke-CheckBlock -Title "PowerShell" -Block {
    $sbl = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" `
        -Name "EnableScriptBlockLogging" -ErrorAction SilentlyContinue).EnableScriptBlockLogging
    Write-Check -Status $(if ($sbl -eq 1) { "PASS" } else { "FAIL" }) -Label "Script Block Logging: Enabled"

    $transcript = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" `
        -Name "EnableTranscripting" -ErrorAction SilentlyContinue).EnableTranscripting
    Write-Check -Status $(if ($transcript -eq 1) { "PASS" } else { "FAIL" }) -Label "Transcription: Enabled"
}

# --- Sysmon -------------------------------------------------------------------------------
Invoke-CheckBlock -Title "Sysmon" -Block {
    $svc = Get-Service -Name "Sysmon64" -ErrorAction SilentlyContinue
    if (-not $svc) { $svc = Get-Service -Name "Sysmon" -ErrorAction SilentlyContinue }
    Write-Check -Status $(if ($svc -and $svc.Status -eq "Running") { "PASS" } else { "FAIL" }) -Label "Service: Running"

    $sysmonExe = (Get-Command "Sysmon64.exe" -ErrorAction SilentlyContinue).Source
    if (-not $sysmonExe) { $sysmonExe = (Get-Command "Sysmon.exe" -ErrorAction SilentlyContinue).Source }
    $customRuleCount = 0
    if ($sysmonExe) {
        $currentConfig = & $sysmonExe -c 2>$null
        $customRuleCount = @($currentConfig | Select-String -Pattern "MedDefense_" -SimpleMatch).Count
    }
    Write-Check -Status $(if ($customRuleCount -ge 5) { "PASS" } elseif ($customRuleCount -gt 0) { "WARN" } else { "FAIL" }) `
        -Label "Custom rules: $customRuleCount present"
}

# --- Kerberos ------------------------------------------------------------------------------
Invoke-CheckBlock -Title "Kerberos" -Block {
    $encTypes = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters" `
        -Name "SupportedEncryptionTypes" -ErrorAction SilentlyContinue).SupportedEncryptionTypes
    $desDisabled = ($null -ne $encTypes) -and (-not ($encTypes -band 0x3))
    $rc4Disabled = ($null -ne $encTypes) -and (-not ($encTypes -band 0x4))
    Write-Check -Status $(if ($desDisabled) { "PASS" } else { "FAIL" }) -Label "DES: Disabled"
    Write-Check -Status $(if ($rc4Disabled) { "PASS" } else { "FAIL" }) -Label "RC4: Disabled"
}

# --- SMB -----------------------------------------------------------------------------------
Invoke-CheckBlock -Title "SMB" -Block {
    $smb = Get-SmbServerConfiguration
    Write-Check -Status $(if (-not $smb.EnableSMB1Protocol) { "PASS" } else { "FAIL" }) -Label "SMBv1: Disabled"
    Write-Check -Status $(if ($smb.RequireSecuritySignature) { "PASS" } else { "FAIL" }) -Label "Signing: Required"
}

# --- Firewall -----------------------------------------------------------------------------
Invoke-CheckBlock -Title "Firewall" -Block {
    $profiles = Get-NetFirewallProfile -All
    $allBlocking = -not @($profiles | Where-Object { -not $_.Enabled -or $_.DefaultInboundAction -ne "Block" }).Count
    Write-Check -Status $(if ($allBlocking) { "PASS" } else { "FAIL" }) -Label "All profiles: ON, DefaultInbound: Block"
}

# --- RDP -----------------------------------------------------------------------------------
Invoke-CheckBlock -Title "RDP" -Block {
    $nla = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" `
        -Name "UserAuthentication" -ErrorAction SilentlyContinue).UserAuthentication
    Write-Check -Status $(if ($nla -eq 1) { "PASS" } else { "FAIL" }) -Label "NLA: Required"

    $rdpMembers = @(Get-ADGroupMember -Identity "Remote Desktop Users" -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Name)
    $onlyItAdmins = ($rdpMembers.Count -gt 0) -and (-not ($rdpMembers | Where-Object { $_ -eq "Domain Users" }))
    Write-Check -Status $(if ($onlyItAdmins) { "PASS" } else { "FAIL" }) -Label "G_IT_Admins only"
}

# --- Service Accounts ----------------------------------------------------------------------
Invoke-CheckBlock -Title "Service Accounts" -Block {
    $svcAccounts = Get-ADUser -Filter * -Properties DistinguishedName, PasswordLastSet, `
            AccountNotDelegated, SamAccountName |
        Where-Object { $_.SamAccountName -like "*svc*" -or $_.DistinguishedName -like "*OU=Service Accounts*" }

    $restricted = @($svcAccounts | Where-Object { $_.AccountNotDelegated })
    Write-Check -Status $(if ($restricted.Count -eq $svcAccounts.Count -and $svcAccounts.Count -gt 0) { "PASS" } else { "FAIL" }) `
        -Label "Delegation restricted: $($restricted.Count)/$($svcAccounts.Count)"

    foreach ($acct in $svcAccounts) {
        if (-not $acct.PasswordLastSet) { continue }
        $ageDays = [int]((Get-Date) - $acct.PasswordLastSet).TotalDays
        if ($ageDays -gt 180) {
            Write-Check -Status "WARN" -Label "$($acct.SamAccountName) password age: $ageDays days"
        }
    }
}

# --- Exit code ------------------------------------------------------------------------------
if ($script:CriticalFailure) {
    exit 1
} else {
    exit 0
}
