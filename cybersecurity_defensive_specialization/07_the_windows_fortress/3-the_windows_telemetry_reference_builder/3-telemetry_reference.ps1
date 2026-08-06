<#
    Script Name : 3-telemetry_reference.ps1
    Purpose     : Build the machine-readable Windows telemetry reference that
                  connects Security/PowerShell/Sysmon event IDs to MedDefense
                  detection use cases and Crimson Tide phases - the bridge
                  between audit policy (Task 2), Sysmon deployment and the
                  Module 3 detection work (2x01 Task 3).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$OutJson = Join-Path $PSScriptRoot "windows_event_reference.json"

function New-EventEntry {
    param(
        [int]$EventId, [string]$EventName, [string]$LogSource, [string]$Dependency,
        [string]$SecurityMeaning, [string]$NormalFrequency, [string]$TriagePriority,
        [string]$CrimsonTidePhase, [string]$SuspiciousPattern, [string]$ValidationMethod
    )
    [PSCustomObject]@{
        event_id                   = $EventId
        event_name                 = $EventName
        log_source                 = $LogSource
        audit_or_sensor_dependency = $Dependency
        security_meaning           = $SecurityMeaning
        normal_frequency           = $NormalFrequency
        triage_priority            = $TriagePriority
        crimson_tide_phase         = $CrimsonTidePhase
        example_suspicious_pattern = $SuspiciousPattern
        validation_method          = $ValidationMethod
    }
}

# --- Security log --------------------------------------------------------------
$securityEvents = @(
    New-EventEntry -EventId 4624 -EventName "An account was successfully logged on" `
        -LogSource "Security" -Dependency "Logon subcategory (Success) - Advanced Audit Policy" `
        -SecurityMeaning "Baseline authentication record: who logged on, from where, using which logon type." `
        -NormalFrequency "Very high (every interactive/network logon)" `
        -TriagePriority "Low baseline / High for Logon Type 3 or 10 from an unexpected source" `
        -CrimsonTidePhase "Phase 3 - Lateral Movement (RDP/SMB logons using harvested credentials)" `
        -SuspiciousPattern "Logon Type 10 (RDP) to a server from a service account that has never logged on interactively before" `
        -ValidationMethod "Get-WinEvent -FilterHashtable @{LogName='Security';Id=4624}; inspect LogonType and IpAddress"

    New-EventEntry -EventId 4625 -EventName "An account failed to log on" `
        -LogSource "Security" -Dependency "Logon subcategory (Failure) - Advanced Audit Policy" `
        -SecurityMeaning "Authentication failure record - the primary brute-force / password-spray signal." `
        -NormalFrequency "Medium (occasional user typos)" `
        -TriagePriority "High when volume spikes or many distinct accounts fail from one source" `
        -CrimsonTidePhase "Phase 3 - credential stuffing/brute force preceding successful lateral movement" `
        -SuspiciousPattern "10+ failed logons for different target accounts from one source IP within 5 minutes" `
        -ValidationMethod "Get-WinEvent Id 4625; group by TargetUserName and IpAddress, count per window"

    New-EventEntry -EventId 4648 -EventName "A logon was attempted using explicit credentials" `
        -LogSource "Security" -Dependency "Logon subcategory (Success) - Advanced Audit Policy" `
        -SecurityMeaning "A process used alternate, explicitly supplied credentials (runas, mapped drive, PsExec-style tooling)." `
        -NormalFrequency "Low" `
        -TriagePriority "High" `
        -CrimsonTidePhase "Phase 3 - Lateral Movement (pass-the-hash / pass-the-ticket tooling using explicit alternate creds)" `
        -SuspiciousPattern "A workstation account explicitly authenticating as a Domain Admin to a remote host" `
        -ValidationMethod "Get-WinEvent Id 4648; correlate ProcessName with TargetServerName"

    New-EventEntry -EventId 4672 -EventName "Special privileges assigned to new logon" `
        -LogSource "Security" -Dependency "Special Logon subcategory (Success) - Advanced Audit Policy" `
        -SecurityMeaning "An account logged on with admin-equivalent privileges (SeDebugPrivilege, SeBackupPrivilege, etc.)." `
        -NormalFrequency "Low to medium (should correlate only with documented admins)" `
        -TriagePriority "High" `
        -CrimsonTidePhase "Phase 3/6 - flags the exact privileged-logon moment before lateral movement and the GPO ransomware push" `
        -SuspiciousPattern "4672 for an account not on the Task 0 Domain Admins export, or on a workstation that never hosts admin logons" `
        -ValidationMethod "Get-WinEvent Id 4672; cross-reference SubjectUserName against domain_baseline.json domainAdmins"

    New-EventEntry -EventId 4688 -EventName "A new process has been created" `
        -LogSource "Security" -Dependency "Process Creation subcategory (Success) + command-line auditing registry key (Task 5)" `
        -SecurityMeaning "Full process execution telemetry, including parent process and (with Task 5's registry key) command line." `
        -NormalFrequency "Very high" `
        -TriagePriority "Medium baseline / High for suspicious binaries or command lines" `
        -CrimsonTidePhase "Phase 3/6 - core telemetry for Mimikatz, PsExec, encoded PowerShell and ransomware binaries" `
        -SuspiciousPattern "powershell.exe -enc spawned by winword.exe, or a GPO-deployed scheduled task launching an unsigned binary" `
        -ValidationMethod "Get-WinEvent Id 4688; inspect NewProcessName, CommandLine and ParentProcessName"

    New-EventEntry -EventId 4720 -EventName "A user account was created" `
        -LogSource "Security" -Dependency "User Account Management subcategory (Success) - Advanced Audit Policy" `
        -SecurityMeaning "New AD account provisioned - legitimate onboarding or attacker-created persistence." `
        -NormalFrequency "Low" `
        -TriagePriority "High outside a documented change window" `
        -CrimsonTidePhase "Post-Phase 6 persistence - backup accounts created after the attacker gains Domain Admin" `
        -SuspiciousPattern "4720 with no matching HR onboarding ticket, followed immediately by a 4732 into a privileged group" `
        -ValidationMethod "Get-WinEvent Id 4720; correlate SamAccountName against onboarding records"

    New-EventEntry -EventId 4726 -EventName "A user account was deleted" `
        -LogSource "Security" -Dependency "User Account Management subcategory (Success) - Advanced Audit Policy" `
        -SecurityMeaning "Account removal - routine offboarding or attacker anti-forensic cleanup." `
        -NormalFrequency "Low" `
        -TriagePriority "Medium baseline / High if paired with a recent 4720 for the same account" `
        -CrimsonTidePhase "Phase 7 - Extortion/cleanup (removing accounts used during the intrusion)" `
        -SuspiciousPattern "4720 and 4726 for the same account name within a 24-hour window" `
        -ValidationMethod "Get-WinEvent Id 4720 and 4726; correlate SamAccountName and time delta"

    New-EventEntry -EventId 4732 -EventName "A member was added to a security-enabled local group" `
        -LogSource "Security" -Dependency "Security Group Management subcategory (Success) - Advanced Audit Policy" `
        -SecurityMeaning "Group membership change - the step immediately after credential theft succeeds in a privilege-escalation chain." `
        -NormalFrequency "Low" `
        -TriagePriority "Critical when the target group is Domain Admins, Enterprise Admins or G_IT_Admins" `
        -CrimsonTidePhase "Phase 3 - privilege escalation following Kerberoasting/credential theft" `
        -SuspiciousPattern "Any addition to Domain Admins/Enterprise Admins/G_IT_Admins with no matching change ticket" `
        -ValidationMethod "Get-WinEvent Id 4732; filter TargetUserName in {Domain Admins, Enterprise Admins, G_IT_Admins}"

    New-EventEntry -EventId 1102 -EventName "The audit log was cleared" `
        -LogSource "Security" -Dependency "None - always logged by the Security log itself, independent of audit policy" `
        -SecurityMeaning "The Security event log was cleared - an anti-forensic action, not a configuration option." `
        -NormalFrequency "Extremely rare (zero in normal operations)" `
        -TriagePriority "Critical - always" `
        -CrimsonTidePhase "Phase 7 - Extortion/cleanup (erasing evidence before or after ransomware detonation)" `
        -SuspiciousPattern "Any occurrence at all, especially outside a documented maintenance window" `
        -ValidationMethod "Get-WinEvent Id 1102; alert unconditionally, zero acceptable baseline"
)

# --- PowerShell log --------------------------------------------------------------
$powershellEvents = @(
    New-EventEntry -EventId 4103 -EventName "Module Logging" `
        -LogSource "Windows PowerShell / Microsoft-Windows-PowerShell/Operational" `
        -Dependency "PowerShell Module Logging (GPO)" `
        -SecurityMeaning "Records pipeline execution details and the parameters passed to cmdlets." `
        -NormalFrequency "High once enabled" `
        -TriagePriority "Medium baseline" `
        -CrimsonTidePhase "Phase 3/6 - reveals AD/GPO cmdlets (New-GPO, Set-ADAccountControl) run via living-off-the-land PowerShell" `
        -SuspiciousPattern "Get-ADUser -Filter * piped to an export, or New-GPO invoked outside a documented change ticket" `
        -ValidationMethod "Get-WinEvent -LogName 'Windows PowerShell' -FilterXPath for Id 4103"

    New-EventEntry -EventId 4104 -EventName "Script Block Logging" `
        -LogSource "Microsoft-Windows-PowerShell/Operational" `
        -Dependency "PowerShell Script Block Logging (GPO, pending assignment)" `
        -SecurityMeaning "Full de-obfuscated script block text, including scripts assembled dynamically at runtime." `
        -NormalFrequency "High once enabled" `
        -TriagePriority "High - the primary anti-obfuscation control" `
        -CrimsonTidePhase "Phase 3/6 - defeats Base64/obfuscated PowerShell droppers used to stage the GPO ransomware payload" `
        -SuspiciousPattern "Script blocks containing DownloadString, -enc, IEX, or direct New-GPO/Set-GPRegistryValue calls outside a change ticket" `
        -ValidationMethod "Get-WinEvent -LogName 'Microsoft-Windows-PowerShell/Operational' Id 4104; inspect ScriptBlockText"
)

# --- Sysmon log --------------------------------------------------------------------
$sysmonEvents = @(
    New-EventEntry -EventId 1 -EventName "Process creation" `
        -LogSource "Microsoft-Windows-Sysmon/Operational" -Dependency "Sysmon service + process_creation rule group" `
        -SecurityMeaning "Richer process telemetry than 4688: file hash, digital signature status, original filename." `
        -NormalFrequency "Very high" `
        -TriagePriority "Medium baseline / High on hash or signature mismatch" `
        -CrimsonTidePhase "Phase 3/6 - detects unsigned or renamed tooling (renamed PsExec, Mimikatz, GPO-dropped ransomware binary)" `
        -SuspiciousPattern "Unsigned binary named svchost.exe running from a path outside System32" `
        -ValidationMethod "Get-WinEvent -LogName 'Microsoft-Windows-Sysmon/Operational' Id 1; check Hashes and Signed fields"

    New-EventEntry -EventId 3 -EventName "Network connection" `
        -LogSource "Microsoft-Windows-Sysmon/Operational" -Dependency "Sysmon service + network_connection rule group" `
        -SecurityMeaning "Process-level outbound/inbound connection telemetry." `
        -NormalFrequency "High" `
        -TriagePriority "Medium baseline / High for unusual destinations" `
        -CrimsonTidePhase "Phase 4 - Data Exfiltration (Rclone/cloud-storage uploads); Phase 3 SMB/WMI lateral connections" `
        -SuspiciousPattern "rclone.exe or powershell.exe making sustained outbound connections to an unrecognized cloud-storage IP range" `
        -ValidationMethod "Get-WinEvent Id 3; filter DestinationIp/DestinationPort against the approved egress list"

    New-EventEntry -EventId 7 -EventName "Image loaded" `
        -LogSource "Microsoft-Windows-Sysmon/Operational" -Dependency "Sysmon service + image_load rule group (high volume, selectively enabled)" `
        -SecurityMeaning "DLL/module load events - detects DLL side-loading and reflective injection loaders." `
        -NormalFrequency "Very high if broadly enabled (usually scoped to sensitive processes)" `
        -TriagePriority "High for unsigned DLLs loaded into lsass.exe or other trusted processes" `
        -CrimsonTidePhase "Phase 3 - credential-theft tooling (Mimikatz-style DLL injection into lsass.exe)" `
        -SuspiciousPattern "Unsigned DLL loaded into lsass.exe" `
        -ValidationMethod "Get-WinEvent Id 7; filter ImageLoaded targeting lsass.exe with Signed=false"

    New-EventEntry -EventId 11 -EventName "File create" `
        -LogSource "Microsoft-Windows-Sysmon/Operational" -Dependency "Sysmon service + file_create rule group" `
        -SecurityMeaning "File drop telemetry - detects ransomware note drops and staged exfiltration archives." `
        -NormalFrequency "High" `
        -TriagePriority "High for known ransomware extensions or mass creation bursts" `
        -CrimsonTidePhase "Phase 6 - Ransomware Deployment (mass creation of encrypted files and ransom notes)" `
        -SuspiciousPattern "Thousands of files with a new extension created across multiple directories in under 60 seconds" `
        -ValidationMethod "Get-WinEvent Id 11; aggregate file-creation rate per process per minute"

    New-EventEntry -EventId 13 -EventName "Registry value set" `
        -LogSource "Microsoft-Windows-Sysmon/Operational" -Dependency "Sysmon service + registry rule group" `
        -SecurityMeaning "Registry modification telemetry - the primary signal for Run-key and service-based persistence." `
        -NormalFrequency "Medium" `
        -TriagePriority "High for Run/RunOnce key changes by non-installer processes" `
        -CrimsonTidePhase "Post-Phase 6 persistence - Run-key or service creation to survive reboot after ransomware deployment" `
        -SuspiciousPattern "New value under HKLM...\Run pointing to a binary in %TEMP% or %APPDATA%" `
        -ValidationMethod "Get-WinEvent Id 13; filter TargetObject for Run/RunOnce/Services keys"

    New-EventEntry -EventId 22 -EventName "DNS query" `
        -LogSource "Microsoft-Windows-Sysmon/Operational" -Dependency "Sysmon service + dns_query rule group (Sysmon 11+)" `
        -SecurityMeaning "Process-level DNS resolution telemetry - detects C2 beaconing and DGA domain lookups." `
        -NormalFrequency "Very high" `
        -TriagePriority "Medium baseline / High for newly-registered or DGA-pattern domains" `
        -CrimsonTidePhase "Phase 1/3 - C2 beaconing following initial access and during lateral movement" `
        -SuspiciousPattern "svchost.exe or an Office process resolving a newly-registered, high-entropy domain name" `
        -ValidationMethod "Get-WinEvent Id 22; cross-reference QueryName against a domain-reputation threat intel feed"
)

# --- Build and save reference -------------------------------------------------
$reference = [PSCustomObject]@{
    generated = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
    logs      = [PSCustomObject]@{
        security   = @($securityEvents)
        powershell = @($powershellEvents)
        sysmon     = @($sysmonEvents)
    }
    totalEventsDocumented = $securityEvents.Count + $powershellEvents.Count + $sysmonEvents.Count
}

$reference | ConvertTo-Json -Depth 6 | Out-File -FilePath $OutJson -Encoding utf8

Write-Output "Security events mapped: $($securityEvents.Count)"
Write-Output "PowerShell events mapped: $($powershellEvents.Count)"
Write-Output "Sysmon events mapped: $($sysmonEvents.Count)"
Write-Output "Total events documented: $($reference.totalEventsDocumented)"
Write-Output "Reference saved to: $OutJson"
