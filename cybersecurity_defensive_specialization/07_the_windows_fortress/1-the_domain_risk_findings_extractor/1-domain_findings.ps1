<#
    Script Name : 1-domain_findings.ps1
    Purpose     : Audit meddefense.local against the Windows Fortress target
                  state and produce the evidence-based findings inventory
                  that drives Tasks 4+ (2x01) - the Windows equivalent of
                  2x00's 3-remediation_queue.sh.
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory
Import-Module GroupPolicy

$OutJson = Join-Path $PSScriptRoot "domain_security_findings.json"

# --- Windows Fortress target state --------------------------------------------
$TargetMinPasswordLength = 14
$TargetComplexity        = $true
$TargetHistoryCount      = 24
$TargetLockoutThreshold  = 5
$StaleDays               = 90

$findings = [System.Collections.Generic.List[object]]::new()
$script:fid = 0

function New-Finding {
    param(
        [string]$Severity,
        [string]$Category,
        [string]$Asset,
        $Evidence,
        [string]$Risk,
        [string]$Remediation,
        [string]$MappedTask
    )
    $script:fid++
    $script:findings.Add([PSCustomObject]@{
        id                      = "FND-{0:D3}" -f $script:fid
        severity                = $Severity
        category                = $Category
        asset                   = $Asset
        evidence                = $Evidence
        risk                    = $Risk
        recommended_remediation = $Remediation
        mapped_task             = $MappedTask
    })
}

function Get-GroupMembershipNames {
    param([string[]]$MemberOfDNs)
    if (-not $MemberOfDNs) { return @() }
    $MemberOfDNs | ForEach-Object {
        try { (Get-ADGroup -Identity $_).Name } catch { $_ }
    }
}

function Test-ServiceAccount {
    param([string]$SamAccountName, [string]$DistinguishedName)
    return ($SamAccountName -like "*svc*" -or $DistinguishedName -like "*OU=Service Accounts*")
}

# ==============================================================================
# FND-001 / FND-002 (Critical): password and lockout policy gaps
# ==============================================================================
$pwPolicy = Get-ADDefaultDomainPasswordPolicy

$pwGaps = [System.Collections.Generic.List[string]]::new()
if ($pwPolicy.MinPasswordLength -lt $TargetMinPasswordLength) {
    $pwGaps.Add("MinPasswordLength=$($pwPolicy.MinPasswordLength) (target: $TargetMinPasswordLength)")
}
if ($pwPolicy.ComplexityEnabled -ne $TargetComplexity) {
    $pwGaps.Add("ComplexityEnabled=$($pwPolicy.ComplexityEnabled) (target: $TargetComplexity)")
}
if ($pwPolicy.PasswordHistoryCount -lt $TargetHistoryCount) {
    $pwGaps.Add("PasswordHistoryCount=$($pwPolicy.PasswordHistoryCount) (target: $TargetHistoryCount)")
}
if ($pwGaps.Count -gt 0) {
    New-Finding -Severity "Critical" -Category "Password Policy" `
        -Asset "Default Domain Password Policy" `
        -Evidence @($pwGaps) `
        -Risk "Weak, reused and never-rotated passwords are the primary credential-harvesting vector documented in all 5 Crimson Tide breaches (1x05)." `
        -Remediation "Deploy the 'MedDefense - Password and Lockout Policy' GPO enforcing 14-char minimum, complexity, and 24-password history." `
        -MappedTask "4-password_policy.ps1"
}

$lockoutConfigured = $pwPolicy.LockoutThreshold -gt 0
if (-not $lockoutConfigured -or $pwPolicy.LockoutThreshold -gt $TargetLockoutThreshold) {
    New-Finding -Severity "Critical" -Category "Account Lockout" `
        -Asset "Default Domain Password Policy" `
        -Evidence @(
            "LockoutThreshold=$($pwPolicy.LockoutThreshold) (target: $TargetLockoutThreshold)",
            "LockoutDuration=$($pwPolicy.LockoutDuration)",
            "LockoutObservationWindow=$($pwPolicy.LockoutObservationWindow)"
        ) `
        -Risk "No account lockout means unlimited password-spray and brute-force attempts against every one of the 14 domain accounts." `
        -Remediation "Deploy the 'MedDefense - Password and Lockout Policy' GPO with a 5-attempt threshold and 15-minute lockout/reset window." `
        -MappedTask "4-password_policy.ps1"
}

# ==============================================================================
# FND-003 (Critical): weak Kerberos encryption types
# ==============================================================================
$krbtgt = Get-ADUser -Identity "krbtgt" -Properties msDS-SupportedEncryptionTypes
$bitmask = $krbtgt.'msDS-SupportedEncryptionTypes'
$kerberosTypes = if ($null -eq $bitmask -or $bitmask -eq 0) {
    @("DES", "RC4", "AES128", "AES256")
} else {
    $t = @()
    if ($bitmask -band 0x1)  { $t += "DES" }
    if ($bitmask -band 0x2)  { $t += "DES" }
    if ($bitmask -band 0x4)  { $t += "RC4" }
    if ($bitmask -band 0x8)  { $t += "AES128" }
    if ($bitmask -band 0x10) { $t += "AES256" }
    $t | Select-Object -Unique
}
if ($kerberosTypes -contains "DES" -or $kerberosTypes -contains "RC4") {
    New-Finding -Severity "Critical" -Category "Kerberos Hardening" `
        -Asset "Domain Kerberos policy (krbtgt baseline)" `
        -Evidence "Supported encryption types: $($kerberosTypes -join ', ')" `
        -Risk "RC4/DES tickets are trivially crackable offline, enabling Kerberoasting and AS-REP roasting - the exact technique Crimson Tide Phase 3 (Lateral Movement) used for privilege escalation." `
        -Remediation "Restrict 'Network security: Configure encryption types allowed for Kerberos' to AES128/AES256 only via GPO." `
        -MappedTask "pending: Kerberos encryption hardening task (not yet assigned)"
}

# ==============================================================================
# FND-004 (High): accounts with PasswordNeverExpires
# ==============================================================================
$pneUsers = Get-ADUser -Filter { PasswordNeverExpires -eq $true } `
        -Properties Enabled, PasswordLastSet, MemberOf, DistinguishedName |
    ForEach-Object {
        [PSCustomObject]@{
            name              = $_.Name
            samAccountName    = $_.SamAccountName
            enabled           = $_.Enabled
            passwordLastSet   = $_.PasswordLastSet
            groupMemberships  = @(Get-GroupMembershipNames -MemberOfDNs $_.MemberOf)
            isServiceAccount  = Test-ServiceAccount -SamAccountName $_.SamAccountName -DistinguishedName $_.DistinguishedName
        }
    }
if ($pneUsers.Count -gt 0) {
    New-Finding -Severity "High" -Category "Account Lifecycle" `
        -Asset "$($pneUsers.Count) user accounts" `
        -Evidence @($pneUsers) `
        -Risk "Passwords that never expire never rotate - a single leaked credential from any of these accounts stays valid indefinitely." `
        -Remediation "Clear PasswordNeverExpires on every non-service account; move required service-account exceptions under a managed service account (gMSA) or documented compensating control." `
        -MappedTask "pending: account lifecycle remediation task (not yet assigned)"
}

# ==============================================================================
# FND-005 (High): disabled accounts still present in privileged groups
# ==============================================================================
$privilegedGroups = @("Domain Admins", "Enterprise Admins", "G_IT_Admins")
$disabledPrivileged = [System.Collections.Generic.List[object]]::new()
foreach ($groupName in $privilegedGroups) {
    try {
        $members = Get-ADGroupMember -Identity $groupName -Recursive -ErrorAction Stop
    } catch {
        continue
    }
    foreach ($member in $members) {
        if ($member.objectClass -ne "user") { continue }
        $u = Get-ADUser -Identity $member.SID -Properties Enabled
        if (-not $u.Enabled) {
            $disabledPrivileged.Add([PSCustomObject]@{
                name  = $u.Name
                group = $groupName
            })
        }
    }
}
if ($disabledPrivileged.Count -gt 0) {
    New-Finding -Severity "High" -Category "Privileged Access" `
        -Asset "Domain Admins / Enterprise Admins / G_IT_Admins" `
        -Evidence @($disabledPrivileged) `
        -Risk "A disabled account left in a privileged group is a re-enablement target - if the attacker resets its password (or it is re-enabled by mistake), it grants immediate domain-level access." `
        -Remediation "Remove disabled accounts from all privileged groups; disabling an account does not revoke its group memberships." `
        -MappedTask "pending: privileged group cleanup task (not yet assigned)"
}

# ==============================================================================
# FND-006 (High): Advanced Audit Policy visibility gaps
# ==============================================================================
$auditGaps = [System.Collections.Generic.List[string]]::new()
try {
    $auditpolOutput = auditpol /get /category:* /r 2>$null | ConvertFrom-Csv
    $requiredSubcategories = @(
        "Process Creation", "Special Logon", "User Account Management",
        "File System", "Registry"
    )
    foreach ($sub in $requiredSubcategories) {
        $row = $auditpolOutput | Where-Object { $_.Subcategory -eq $sub }
        if (-not $row -or $row.'Inclusion Setting' -eq "No Auditing") {
            $auditGaps.Add("$sub`: not configured")
        }
    }
} catch {
    $auditGaps.Add("auditpol query failed: $($_.Exception.Message)")
}

$scriptBlockLoggingEnabled = $false
try {
    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
    if (Test-Path $regPath) {
        $scriptBlockLoggingEnabled = (Get-ItemProperty -Path $regPath -Name EnableScriptBlockLogging -ErrorAction SilentlyContinue).EnableScriptBlockLogging -eq 1
    }
} catch { }
if (-not $scriptBlockLoggingEnabled) { $auditGaps.Add("PowerShell Script Block Logging: disabled") }

$sysmonPresent = [bool](Get-Service -Name "Sysmon*" -ErrorAction SilentlyContinue)
if (-not $sysmonPresent) { $auditGaps.Add("Sysmon: not installed") }

if ($auditGaps.Count -gt 0) {
    New-Finding -Severity "High" -Category "Audit Visibility" `
        -Asset "Domain-wide audit policy and endpoint telemetry" `
        -Evidence @($auditGaps) `
        -Risk "Without process creation, account management and PowerShell logging, an attacker's actions after initial access generate zero evidence - exactly the blind spot Crimson Tide's affiliates relied on for lateral movement." `
        -Remediation "Deploy the 'MedDefense - Advanced Audit Policy' GPO and roll out Sysmon with a detection-optimized configuration." `
        -MappedTask "5-audit_policy.ps1"
}

# ==============================================================================
# FND-007 (High): service account risk profile
# ==============================================================================
$serviceAccounts = Get-ADUser -Filter * -Properties DistinguishedName, TrustedForDelegation, `
        ServicePrincipalNames, PasswordLastSet, MemberOf, Enabled, LastLogonDate |
    Where-Object { Test-ServiceAccount -SamAccountName $_.SamAccountName -DistinguishedName $_.DistinguishedName }

$serviceAccountRisks = $serviceAccounts | ForEach-Object {
    $groupNames = Get-GroupMembershipNames -MemberOfDNs $_.MemberOf
    [PSCustomObject]@{
        name                    = $_.Name
        samAccountName          = $_.SamAccountName
        unconstrainedDelegation = [bool]$_.TrustedForDelegation
        privilegedMembership    = [bool]($groupNames | Where-Object { $_ -in $privilegedGroups })
        stalePassword           = $_.PasswordLastSet -and ((Get-Date) - $_.PasswordLastSet).TotalDays -gt 365
        passwordAgeDays         = if ($_.PasswordLastSet) { [int]((Get-Date) - $_.PasswordLastSet).TotalDays } else { $null }
        lastLogonDate           = $_.LastLogonDate
    }
}
$unconstrained = @($serviceAccountRisks | Where-Object { $_.unconstrainedDelegation })
if ($unconstrained.Count -gt 0) {
    New-Finding -Severity "High" -Category "Service Account Hardening" `
        -Asset "$($unconstrained.Count) service accounts" `
        -Evidence @($serviceAccountRisks) `
        -Risk "Unconstrained delegation lets any process that compromises this account impersonate ANY domain user to ANY service, including Domain Admins - the single fastest path from a compromised service account to full domain compromise." `
        -Remediation "Convert every service account to constrained delegation (or resource-based constrained delegation); migrate to gMSA where possible." `
        -MappedTask "pending: service account hardening task (not yet assigned)"
}

# ==============================================================================
# FND-008 (Medium): stale computer objects
# ==============================================================================
$staleCutoff = (Get-Date).AddDays(-$StaleDays)
$staleComputers = Get-ADComputer -Filter * -Properties LastLogonDate |
    Where-Object { -not $_.LastLogonDate -or $_.LastLogonDate -lt $staleCutoff } |
    Select-Object Name, DistinguishedName, LastLogonDate

if ($staleComputers.Count -gt 0) {
    New-Finding -Severity "Medium" -Category "Stale Object Cleanup" `
        -Asset "$($staleComputers.Count) computer objects" `
        -Evidence @($staleComputers) `
        -Risk "Stale computer objects are unmonitored, frequently unpatched, and are a common target for AD persistence (resource-based constrained delegation abuse, SPN spoofing)." `
        -Remediation "Disable and, after a grace period, remove computer objects with no authentication activity in $StaleDays+ days." `
        -MappedTask "pending: stale object cleanup task (not yet assigned)"
}

# ==============================================================================
# FND-009 (Medium): weak GPO security posture
# ==============================================================================
$gpos = Get-GPO -All
$hardeningGpos = @($gpos | Where-Object { $_.DisplayName -like "MedDefense*" })
if ($hardeningGpos.Count -eq 0) {
    New-Finding -Severity "Medium" -Category "GPO Hardening" `
        -Asset "$($gpos.Count) GPO(s) linked in the domain" `
        -Evidence @($gpos | Select-Object DisplayName, CreationTime, ModificationTime) `
        -Risk "Default-only GPOs mean nothing enforces password policy, audit policy, or endpoint restrictions domain-wide - and GPO itself is the exact mechanism Crimson Tide used to deploy ransomware to all 280 endpoints in Phase 6." `
        -Remediation "Deploy MedDefense hardening GPOs (Tasks 4, 5 and beyond) and link them at the domain root or targeted OUs." `
        -MappedTask "4-password_policy.ps1, 5-audit_policy.ps1"
}

# ==============================================================================
# Summary and output
# ==============================================================================
$critical = @($findings | Where-Object { $_.severity -eq "Critical" })
$high     = @($findings | Where-Object { $_.severity -eq "High" })
$medium   = @($findings | Where-Object { $_.severity -eq "Medium" })

$report = [PSCustomObject]@{
    generated  = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    domain     = "meddefense.local"
    targetState = [PSCustomObject]@{
        minPasswordLength = $TargetMinPasswordLength
        complexityEnabled = $TargetComplexity
        historyCount      = $TargetHistoryCount
        lockoutThreshold  = $TargetLockoutThreshold
        staleDays         = $StaleDays
    }
    findings = @($findings)
    summary  = [PSCustomObject]@{
        total    = $findings.Count
        critical = $critical.Count
        high     = $high.Count
        medium   = $medium.Count
    }
}

$report | ConvertTo-Json -Depth 8 | Out-File -FilePath $OutJson -Encoding utf8

foreach ($f in $findings) {
    $label = switch ($f.category) {
        "Password Policy"          { "Password policy minimum length: $($pwPolicy.MinPasswordLength)" }
        "Account Lockout"          { "Account lockout: $(if ($lockoutConfigured) { 'configured' } else { 'not configured' })" }
        "Kerberos Hardening"       { "Kerberos DES/RC4 enabled" }
        "Account Lifecycle"        { "$($pneUsers.Count) accounts with PasswordNeverExpires" }
        "Privileged Access"        { "$($disabledPrivileged.Count) disabled account(s) in privileged groups" }
        "Audit Visibility"         { "Advanced Audit Policy: not configured" }
        "Service Account Hardening"{ "$($unconstrained.Count) service accounts with unconstrained delegation" }
        "Stale Object Cleanup"     { "Stale computer objects: $($staleComputers.Count)" }
        "GPO Hardening"            { "No MedDefense hardening GPOs present" }
        default                    { $f.category }
    }
    Write-Output "[$($f.severity.ToUpper())] $label"
}

Write-Output ""
Write-Output "Findings: $($findings.Count)"
Write-Output "Critical: $($critical.Count)"
Write-Output "High: $($high.Count)"
Write-Output "Medium: $($medium.Count)"
Write-Output "Report saved to: $OutJson"
