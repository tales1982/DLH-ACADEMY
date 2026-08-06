<#
    Script Name : 9-sysmon_deploy.ps1
    Purpose     : Download, install and verify Sysmon with a detection-
                  optimized configuration - the single highest-value endpoint
                  detection tool on Windows, closing the visibility gap that
                  would otherwise make Crimson Tide's lateral movement
                  (PsExec, WMI) and exfiltration (Rclone) nearly invisible
                  (2x01 Task 9).
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$WorkDir       = Join-Path $PSScriptRoot "sysmon_install"
$SysmonZipUrl  = "https://download.sysinternals.com/files/Sysmon.zip"
$SwiftConfigUrl = "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml"
$LocalConfig   = Join-Path $PSScriptRoot "sysmonconfig.xml"

New-Item -ItemType Directory -Path $WorkDir -Force | Out-Null

# --- Download Sysmon --------------------------------------------------------------
Write-Host "[*] Downloading Sysmon..." -NoNewline
$sysmonZip = Join-Path $WorkDir "Sysmon.zip"
try {
    Invoke-WebRequest -Uri $SysmonZipUrl -OutFile $sysmonZip -UseBasicParsing
    Expand-Archive -Path $sysmonZip -DestinationPath $WorkDir -Force
    Write-Host " OK"
} catch {
    Write-Host " FAILED: $($_.Exception.Message)"
    throw "Sysmon download failed - check internet egress from this host before continuing."
}

$sysmonExe = Get-ChildItem -Path $WorkDir -Filter "Sysmon64.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $sysmonExe) {
    $sysmonExe = Get-ChildItem -Path $WorkDir -Filter "Sysmon.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
}

# --- Download the SwiftOnSecurity baseline config ---------------------------------
# If this DC has no internet egress (common in an isolated AD lab), fall back
# to the MedDefense sysmonconfig.xml already checked into this repo rather
# than failing the whole deployment over a config file.
Write-Host "[*] Downloading SwiftOnSecurity config..." -NoNewline
$configPath = Join-Path $WorkDir "sysmonconfig.xml"
try {
    Invoke-WebRequest -Uri $SwiftConfigUrl -OutFile $configPath -UseBasicParsing
    Write-Host " OK"
} catch {
    Write-Host " FAILED (no egress) - using bundled sysmonconfig.xml baseline"
    Copy-Item -Path $LocalConfig -Destination $configPath -Force
}

# --- Install Sysmon with the configuration ----------------------------------------
Write-Host "[*] Installing Sysmon with config..."
Write-Host "    $($sysmonExe.Name) -accepteula -i sysmonconfig.xml"
& $sysmonExe.FullName -accepteula -i $configPath | Out-Null

Start-Sleep -Seconds 3

$service = Get-Service -Name "Sysmon64" -ErrorAction SilentlyContinue
if (-not $service) { $service = Get-Service -Name "Sysmon" -ErrorAction SilentlyContinue }
$serviceStatus = if ($service -and $service.Status -eq "Running") { "[OK]" } else { "[FAIL]" }
Write-Host "    Service: $($service.Name) - $($service.Status)            $serviceStatus"

$driver = Get-CimInstance -ClassName Win32_SystemDriver -Filter "Name='SysmonDrv'" -ErrorAction SilentlyContinue
$driverStatus = if ($driver -and $driver.State -eq "Running") { "[OK]" } else { "[FAIL]" }
Write-Host "    Driver: SysmonDrv - $($driver.State)              $driverStatus"

# --- Verify event generation --------------------------------------------------------
Write-Host "[*] Verifying event generation..."
Start-Sleep -Seconds 60
$recentEvents = @(Get-WinEvent -FilterHashtable @{
    LogName   = "Microsoft-Windows-Sysmon/Operational"
    StartTime = (Get-Date).AddSeconds(-60)
} -ErrorAction SilentlyContinue)
$eventStatus = if ($recentEvents.Count -gt 0) { "[OK]" } else { "[FAIL]" }
Write-Host "    Events in last 60 seconds: $($recentEvents.Count)          $eventStatus"

# --- Test FileCreate detection (Event ID 11) ----------------------------------------
Write-Host "[*] Testing FileCreate detection..."
$testFile = "C:\Windows\Temp\sysmon_test.txt"
$testStart = Get-Date
"MedDefense Sysmon FileCreate test - $(Get-Date -Format o)" | Out-File -FilePath $testFile -Encoding utf8 -Force
Write-Host "    Created: $testFile"

Start-Sleep -Seconds 3
$fileCreateEvent = Get-WinEvent -FilterHashtable @{
    LogName   = "Microsoft-Windows-Sysmon/Operational"
    Id        = 11
    StartTime = $testStart
} -ErrorAction SilentlyContinue | Where-Object { $_.Message -like "*$testFile*" } | Select-Object -First 1

if ($fileCreateEvent) {
    Write-Host "    Event ID 11 captured                   [VERIFIED]"
} else {
    Write-Host "    Event ID 11 NOT found                   [FAILED]"
}

Remove-Item -Path $testFile -Force -ErrorAction SilentlyContinue
