<#
    Script Name : 10-sysmon_tune.ps1
    Purpose     : Layer 5 MedDefense/Crimson-Tide-specific detection rules on
                  top of the Task 9 Sysmon baseline (Rclone exfiltration,
                  PsExec service install, encoded PowerShell, shadow-copy
                  deletion, scheduled-task persistence), then trigger and
                  verify each one against a live Sysmon log (2x01 Task 10).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$BaselineConfigPath = Join-Path $PSScriptRoot "..\9-the_sysmon_deployment\sysmonconfig.xml"
$OutConfigPath      = Join-Path $PSScriptRoot "sysmonconfig.xml"
$SysmonExe          = (Get-Command "Sysmon64.exe" -ErrorAction SilentlyContinue).Source
if (-not $SysmonExe) { $SysmonExe = (Get-Command "Sysmon.exe" -ErrorAction SilentlyContinue).Source }

function New-SysmonRule {
    param($Doc, [string]$Name, [string]$GroupRelation, [hashtable[]]$Conditions)
    $rule = $Doc.CreateElement("Rule")
    $rule.SetAttribute("name", $Name)
    $rule.SetAttribute("groupRelation", $GroupRelation)
    foreach ($cond in $Conditions) {
        $el = $Doc.CreateElement($cond.Field)
        $el.SetAttribute("condition", $cond.Condition)
        $el.InnerText = $cond.Value
        $rule.AppendChild($el) | Out-Null
    }
    return $rule
}

# --- Load the current Sysmon configuration -----------------------------------
Write-Host "[*] Loading Sysmon config..." -NoNewline
if (-not (Test-Path $BaselineConfigPath)) {
    Write-Host " FAILED: $BaselineConfigPath not found"
    throw "Run 9-sysmon_deploy.ps1 first to establish the baseline configuration."
}
[xml]$configXml = Get-Content -Path $BaselineConfigPath -Raw
Write-Host " OK"

# --- Add the 5 MedDefense custom detection rules -----------------------------
Write-Host "[*] Adding custom rules..."

$ruleGroup = $configXml.CreateElement("RuleGroup")
$ruleGroup.SetAttribute("name", "MedDefense Custom Detections")
$ruleGroup.SetAttribute("groupRelation", "or")

$processCreate = $configXml.CreateElement("ProcessCreate")
$processCreate.SetAttribute("onmatch", "include")

# Rule 1: Rclone exfiltration (Crimson Tide Phase 4)
$processCreate.AppendChild((New-SysmonRule -Doc $configXml -Name "MedDefense_Rclone_Exfiltration" -GroupRelation "or" -Conditions @(
    @{ Field = "Image"; Condition = "end with"; Value = "\rclone.exe" }
))) | Out-Null
Write-Host "    Rule 1: Rclone detection                [ADDED]"

# Rule 3: Encoded PowerShell execution (Crimson Tide Phase 3)
$processCreate.AppendChild((New-SysmonRule -Doc $configXml -Name "MedDefense_EncodedPowerShell" -GroupRelation "or" -Conditions @(
    @{ Field = "CommandLine"; Condition = "contains"; Value = "-enc" }
))) | Out-Null
Write-Host "    Rule 3: Encoded PowerShell              [ADDED]"

# Rule 4: vssadmin shadow-copy deletion (ransomware pre-encryption step)
$processCreate.AppendChild((New-SysmonRule -Doc $configXml -Name "MedDefense_VssadminShadowDelete" -GroupRelation "and" -Conditions @(
    @{ Field = "Image"; Condition = "end with"; Value = "\vssadmin.exe" }
    @{ Field = "CommandLine"; Condition = "contains"; Value = "delete shadows" }
))) | Out-Null
Write-Host "    Rule 4: Shadow deletion (vssadmin)      [ADDED]"

# Rule 5: New scheduled task creation (persistence)
$processCreate.AppendChild((New-SysmonRule -Doc $configXml -Name "MedDefense_ScheduledTaskPersistence" -GroupRelation "and" -Conditions @(
    @{ Field = "Image"; Condition = "end with"; Value = "\schtasks.exe" }
    @{ Field = "CommandLine"; Condition = "contains"; Value = "/create" }
))) | Out-Null
Write-Host "    Rule 5: Scheduled task persistence      [ADDED]"

$ruleGroup.AppendChild($processCreate) | Out-Null

# Rule 2: PsExec service installation (registry modification)
$registryEvent = $configXml.CreateElement("RegistryEvent")
$registryEvent.SetAttribute("onmatch", "include")
$registryEvent.AppendChild((New-SysmonRule -Doc $configXml -Name "MedDefense_PsExec_ServiceInstall" -GroupRelation "or" -Conditions @(
    @{ Field = "TargetObject"; Condition = "contains"; Value = "\Services\PSEXESVC" }
))) | Out-Null
Write-Host "    Rule 2: PsExec service installation     [ADDED]"

$ruleGroup.AppendChild($registryEvent) | Out-Null
$configXml.Sysmon.EventFiltering.AppendChild($ruleGroup) | Out-Null

# --- Update the Sysmon configuration ------------------------------------------
Write-Host "[*] Updating Sysmon config..." -NoNewline
$configXml.Save($OutConfigPath)
try {
    & $SysmonExe -c $OutConfigPath | Out-Null
    Write-Host " OK"
} catch {
    Write-Host " FAILED: $($_.Exception.Message)"
}

# --- Trigger-and-verify each rule -----------------------------------------------
Write-Host "[*] Trigger-and-Verify..."
$results = [System.Collections.Generic.List[bool]]::new()

function Test-SysmonEvent {
    param([int]$EventId, [datetime]$Since, [string]$Pattern)
    Start-Sleep -Seconds 3
    $evt = Get-WinEvent -FilterHashtable @{ LogName = "Microsoft-Windows-Sysmon/Operational"; Id = $EventId; StartTime = $Since } `
            -ErrorAction SilentlyContinue |
        Where-Object { $_.Message -like $Pattern } | Select-Object -First 1
    return [bool]$evt
}

# Rule 1: run a harmless binary renamed to rclone.exe, safe because it never
# performs any real file transfer - only Sysmon's Image-name match matters.
$t1 = Get-Date
$rcloneStub = Join-Path $env:TEMP "rclone.exe"
Copy-Item -Path "$env:SystemRoot\System32\notepad.exe" -Destination $rcloneStub -Force
$p = Start-Process -FilePath $rcloneStub -PassThru
Start-Sleep -Milliseconds 500
Stop-Process -Id $p.Id -Force -ErrorAction SilentlyContinue
$pass1 = Test-SysmonEvent -EventId 1 -Since $t1 -Pattern "*rclone.exe*"
Write-Host "    Rule 1: rclone.exe detection            $(if ($pass1) { '[PASS]' } else { '[FAIL]' })"
$results.Add($pass1)
Remove-Item -Path $rcloneStub -Force -ErrorAction SilentlyContinue

# Rule 2: create (and immediately remove) the exact registry key PsExec
# creates for its service - no service is actually installed or run.
$t2 = Get-Date
$psexecKey = "HKLM:\SYSTEM\CurrentControlSet\Services\PSEXESVC"
New-Item -Path $psexecKey -Force | Out-Null
Set-ItemProperty -Path $psexecKey -Name "Type" -Value 16 -Type DWord -Force
$pass2 = Test-SysmonEvent -EventId 13 -Since $t2 -Pattern "*PSEXESVC*"
Write-Host "    Rule 2: PsExec registry key             $(if ($pass2) { '[PASS]' } else { '[FAIL]' })"
$results.Add($pass2)
Remove-Item -Path $psexecKey -Recurse -Force -ErrorAction SilentlyContinue

# Rule 3: a harmless encoded command (Write-Host only) - -enc in the command
# line is what the rule matches, not the payload it decodes to.
$t3 = Get-Date
$encoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes("Write-Host 'Test'"))
Start-Process -FilePath "powershell.exe" -ArgumentList @("-NoProfile", "-NonInteractive", "-enc", $encoded) -WindowStyle Hidden -Wait
$pass3 = Test-SysmonEvent -EventId 1 -Since $t3 -Pattern "*-enc*"
Write-Host "    Rule 3: Encoded PowerShell              $(if ($pass3) { '[PASS]' } else { '[FAIL]' })"
$results.Add($pass3)

# Rule 4: target a non-existent shadow copy ID - vssadmin safely reports
# "No items found" without touching any real shadow copy on this host.
$t4 = Get-Date
& vssadmin.exe delete shadows /shadow="{00000000-0000-0000-0000-000000000000}" 2>&1 | Out-Null
$pass4 = Test-SysmonEvent -EventId 1 -Since $t4 -Pattern "*vssadmin.exe*delete*shadows*"
Write-Host "    Rule 4: vssadmin execution              $(if ($pass4) { '[PASS]' } else { '[FAIL]' })"
$results.Add($pass4)

# Rule 5: create a disabled, harmless scheduled task, then delete it.
$t5 = Get-Date
$taskName = "MedDefense_SysmonTest"
& schtasks.exe /create /tn $taskName /tr "cmd.exe /c exit" /sc once /st 23:59 /f | Out-Null
$pass5 = Test-SysmonEvent -EventId 1 -Since $t5 -Pattern "*schtasks.exe*/create*"
Write-Host "    Rule 5: schtasks /create                $(if ($pass5) { '[PASS]' } else { '[FAIL]' })"
$results.Add($pass5)
& schtasks.exe /delete /tn $taskName /f | Out-Null

$passCount = @($results | Where-Object { $_ }).Count
Write-Host "Custom rules: 5 added | Tests: $passCount/5 PASS"
