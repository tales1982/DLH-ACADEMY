<#
    Script Name : 5-audit_policy.ps1
    Purpose     : Configure the Advanced Audit Policy for meddefense.local via
                  GPO, closing the visibility gaps quantified in Task 2 and
                  the FND-006 finding from Task 1 (2x01 Task 5). Turns Windows
                  Event Logs from "noise" into evidence: process creation
                  with full command line, privileged logons, account
                  management and object access all become visible.
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory
Import-Module GroupPolicy

$GpoName  = "MedDefense - Advanced Audit Policy"
$Domain   = Get-ADDomain
$DomainDN = $Domain.DistinguishedName

# --- Advanced Audit Policy subcategories to configure ---------------------------
# GUIDs are Microsoft's published Advanced Audit Policy subcategory identifiers
# (stable across Windows versions - the same table `auditpol /list /subcategory:*
# /r` returns on this DC).

# "Setting" is the canonical value used in the audit.csv (must stay
# comma-free - audit.csv is itself a comma-delimited file, so a bare comma
# inside a field corrupts the column layout). "DisplaySetting" is the
# comma-separated form used only for the human-readable console output.
$AuditSettings = @(
    [PSCustomObject]@{ Name = "Credential Validation";    Guid = "{0CCE923F-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "Credential Validation:" }
    [PSCustomObject]@{ Name = "Kerberos Authentication Service"; Guid = "{0CCE9242-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "Kerberos Authentication:" }
    [PSCustomObject]@{ Name = "Logon";                     Guid = "{0CCE9215-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "Logon:" }
    [PSCustomObject]@{ Name = "Logoff";                    Guid = "{0CCE9216-69AE-11D9-BED3-505054503030}"; Setting = "Success";             DisplaySetting = "Success";          Label = "Logoff:" }
    [PSCustomObject]@{ Name = "Special Logon";             Guid = "{0CCE921B-69AE-11D9-BED3-505054503030}"; Setting = "Success";             DisplaySetting = "Success";          Label = "Special Logon:" }
    [PSCustomObject]@{ Name = "User Account Management";   Guid = "{0CCE9235-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "User Account Management:" }
    [PSCustomObject]@{ Name = "Sensitive Privilege Use";   Guid = "{0CCE9228-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "Sensitive Privilege Use:" }
    [PSCustomObject]@{ Name = "File System";               Guid = "{0CCE921D-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "File System:" }
    [PSCustomObject]@{ Name = "Registry";                  Guid = "{0CCE921E-69AE-11D9-BED3-505054503030}"; Setting = "Success and Failure"; DisplaySetting = "Success, Failure"; Label = "Registry:" }
    [PSCustomObject]@{ Name = "Process Creation";          Guid = "{0CCE922B-69AE-11D9-BED3-505054503030}"; Setting = "Success";             DisplaySetting = "Success";          Label = "Process Creation:" }
)

function ConvertTo-AuditpolSetArgs {
    param([string]$Setting)
    switch ($Setting) {
        "Success and Failure" { return @("/success:enable", "/failure:enable") }
        "Success"             { return @("/success:enable", "/failure:disable") }
        "Failure"             { return @("/success:disable", "/failure:enable") }
        default               { return @("/success:disable", "/failure:disable") }
    }
}

function Get-GpoSysvolPath {
    param([guid]$GpoId)
    $sysvolRoot = Join-Path $env:SystemRoot "SYSVOL\sysvol\$($Domain.DNSRoot)\Policies\{$GpoId}"
    return $sysvolRoot
}

function Set-GpoVersionBump {
    # Every direct file write into a GPO's SYSVOL folder (audit.csv, GptTmpl.inf)
    # must be paired with a GPT.INI version bump, or domain controllers and
    # clients will never notice the policy changed and skip re-applying it.
    param([string]$GpoSysvolPath)
    $gptIniPath = Join-Path $GpoSysvolPath "GPT.INI"
    if (Test-Path $gptIniPath) {
        $content = Get-Content $gptIniPath | ForEach-Object {
            if ($_ -match '^(?i)Version=(\d+)$') {
                "Version=$([int]$Matches[1] + 1)"
            } else {
                $_
            }
        }
    } else {
        $content = @("[General]", "Version=1")
    }
    Set-Content -Path $gptIniPath -Value $content -Encoding ASCII
}

# --- Create the GPO (idempotent) ----------------------------------------------
Write-Host "[*] Creating GPO: `"$GpoName`"..." -NoNewline
$gpo = Get-GPO -Name $GpoName -ErrorAction SilentlyContinue
if ($gpo) {
    Write-Host " EXISTS"
} else {
    $gpo = New-GPO -Name $GpoName -Comment "MedDefense hardening: advanced audit policy. Closes FND-006 (2x01 Task 1) - without this, an attacker's actions after initial access generate zero evidence (Crimson Tide advisory 1x05)."
    Write-Host " CREATED"
}

$sysvolPath   = Get-GpoSysvolPath -GpoId $gpo.Id
$auditDir     = Join-Path $sysvolPath "Machine\Microsoft\Windows NT\Audit"
$auditCsvPath = Join-Path $auditDir "audit.csv"
New-Item -ItemType Directory -Path $auditDir -Force | Out-Null

# --- Configure audit categories -----------------------------------------------
Write-Host "[*] Configuring Audit Categories..."

$csvLines = @("Machine Name,Policy Target,Subcategory,Subcategory GUID,Inclusion Setting,Exclusion Setting,Setting Value")
foreach ($item in $AuditSettings) {
    $incl = $item.Setting
    $settingValue = switch ($incl) {
        "Success and Failure" { 3 }
        "Success"             { 1 }
        "Failure"             { 2 }
        default               { 0 }
    }
    $csvLines += "$($env:COMPUTERNAME),System,$($item.Name),$($item.Guid),$incl,,$settingValue"

    # Apply immediately to this DC's effective policy (auditpol) so the
    # verification step below reflects the change without waiting for a full
    # Group Policy replication/refresh cycle.
    $auditpolArgs = @("/set", "/subcategory:$($item.Guid)") + (ConvertTo-AuditpolSetArgs -Setting $incl)
    $null = & auditpol @auditpolArgs 2>&1
    $applied = ($LASTEXITCODE -eq 0)

    "    {0,-26}{1,-22}{2}" -f $item.Label, $item.DisplaySetting, $(if ($applied) { "[SET]" } else { "[FAILED]" })
}

$csvLines | Set-Content -Path $auditCsvPath -Encoding ASCII
Set-GpoVersionBump -GpoSysvolPath $sysvolPath

# --- Command-line logging in process creation events (Event ID 4688) -------------
Write-Host "[*] Enabling command-line in process creation events..." -NoNewline
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit" `
    -ValueName "ProcessCreationIncludeCmdLine_Enabled" -Type DWord -Value 1 | Out-Null
Write-Host "   [SET]"

# --- Restrict Security log clearing to Domain Admins ------------------------------
# Clearing the Security log requires SeSecurityPrivilege ("Manage auditing and
# security log"). Restricting that right to Domain Admins only closes the gap
# that lets any local administrator on a member server erase evidence -
# directly relevant to FND stemming from Event 1102 in 3-telemetry_reference.ps1.
Write-Host "[*] Restricting Security log clearing..." -NoNewline
try {
    $domainAdminsSid = (Get-ADGroup -Identity "Domain Admins").SID.Value
    $secTemplateDir  = Join-Path $sysvolPath "Machine\Microsoft\Windows NT\SecEdit"
    New-Item -ItemType Directory -Path $secTemplateDir -Force | Out-Null
    $gptTmplPath = Join-Path $secTemplateDir "GptTmpl.inf"
    @(
        "[Unicode]"
        "Unicode=yes"
        "[Version]"
        "signature=`"`$CHICAGO`$`""
        "Revision=1"
        "[Privilege Rights]"
        "SeSecurityPrivilege = *$domainAdminsSid"
    ) | Set-Content -Path $gptTmplPath -Encoding Unicode
    Set-GpoVersionBump -GpoSysvolPath $sysvolPath
    Write-Host "   [SET]"
} catch {
    Write-Host "   [FAILED: $($_.Exception.Message)]"
}

# --- Security log maximum size (1 GB) ---------------------------------------------
Write-Host "[*] Setting Security log max size to 1 GB..." -NoNewline
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security" `
    -ValueName "MaxSize" -Type DWord -Value 1048576 | Out-Null   # KB -> 1 GB
Write-Host "              [SET]"

# --- Link the GPO to the domain root (idempotent) and force update ---------------
Write-Host "[*] Linking GPO and forcing update..." -NoNewline
$existingLink = (Get-GPInheritance -Target $DomainDN).GpoLinks |
    Where-Object { $_.DisplayName -eq $GpoName }
if (-not $existingLink) {
    New-GPLink -Guid $gpo.Id -Target $DomainDN -LinkEnabled Yes | Out-Null
}
try {
    Invoke-GPUpdate -Computer $env:COMPUTERNAME -Force -RandomDelayInMinutes 0 | Out-Null
    Write-Host " COMPLETE"
} catch {
    Write-Host " FAILED: $($_.Exception.Message)"
}

# --- Verification -------------------------------------------------------------------
Write-Output ""
Write-Output "Verification (auditpol /get /category:*):"
foreach ($item in $AuditSettings) {
    auditpol /get /subcategory:"$($item.Name)" 2>$null | Select-Object -Skip 2 | ForEach-Object {
        if ($_.Trim()) { Write-Output "  $_" }
    }
}
