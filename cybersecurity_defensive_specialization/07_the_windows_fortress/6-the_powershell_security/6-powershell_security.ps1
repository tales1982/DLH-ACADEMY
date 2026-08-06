<#
    Script Name : 6-powershell_security.ps1
    Purpose     : Configure PowerShell Script Block Logging, Module Logging
                  and Transcription via GPO, and verify AMSI is active -
                  neutralizing the attacker's most abused post-exploitation
                  tool (2x01 Task 6). Crimson Tide Phase 3 processes showed
                  powershell.exe -enc [base64]; this closes that blind spot.
    Author      : MedDefense Security Engineering
    Date        : 2026-08-05
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory
Import-Module GroupPolicy

$GpoName          = "MedDefense - PowerShell Security"
$Domain           = Get-ADDomain
$DomainDN         = $Domain.DistinguishedName
$TranscriptDir    = "C:\PSTranscripts"

# --- Create the GPO (idempotent) ----------------------------------------------
Write-Host "[*] Creating GPO: `"$GpoName`"..." -NoNewline
$gpo = Get-GPO -Name $GpoName -ErrorAction SilentlyContinue
if ($gpo) {
    Write-Host " EXISTS"
} else {
    $gpo = New-GPO -Name $GpoName -Comment "MedDefense hardening: PowerShell logging. Crimson Tide Phase 3 processes showed powershell.exe -enc [base64]; without Script Block Logging that payload is invisible."
    Write-Host " CREATED"
}

# --- Script Block Logging ------------------------------------------------------
Write-Host "[*] Configuring Script Block Logging..."
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" `
    -ValueName "EnableScriptBlockLogging" -Type DWord -Value 1 | Out-Null
Write-Host "    EnableScriptBlockLogging = 1           [SET]"
Write-Host "    -> Event ID 4104 captures decoded scripts"

# --- Module Logging --------------------------------------------------------------
Write-Host "[*] Configuring Module Logging..."
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" `
    -ValueName "EnableModuleLogging" -Type DWord -Value 1 | Out-Null
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames" `
    -ValueName "*" -Type String -Value "*" | Out-Null
Write-Host "    EnableModuleLogging = 1, ModuleNames = *  [SET]"
Write-Host "    -> Event ID 4103 captures module invocations"

# --- Transcription -----------------------------------------------------------------
Write-Host "[*] Configuring Transcription..."
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" `
    -ValueName "EnableTranscripting" -Type DWord -Value 1 | Out-Null
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" `
    -ValueName "EnableInvocationHeader" -Type DWord -Value 1 | Out-Null
Set-GPRegistryValue -Name $GpoName `
    -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" `
    -ValueName "OutputDirectory" -Type String -Value $TranscriptDir | Out-Null
Write-Host "    OutputDirectory = $TranscriptDir     [SET]"

# --- AMSI verification ---------------------------------------------------------------
# amsiInitFailed is the exact non-public field that AMSI-bypass proof-of-concepts
# flip to $true to blind AMSI for the rest of the session. Reading it here is
# read-only and diagnostic: $false means AMSI initialized successfully and is
# actively scanning script content in this session.
Write-Host "[*] Verifying AMSI..." -NoNewline
try {
    $amsiUtils = [Ref].Assembly.GetType('System.Management.Automation.AmsiUtils')
    $field = $amsiUtils.GetField('amsiInitFailed', [System.Reflection.BindingFlags]'NonPublic,Static')
    $amsiInitFailed = $field.GetValue($null)
    if (-not $amsiInitFailed) {
        Write-Host " AMSI DLL loaded     [OK]"
    } else {
        Write-Host " AMSI initialization FAILED     [FAIL]"
    }
} catch {
    Write-Host " Could not query AMSI state: $($_.Exception.Message)     [FAIL]"
}

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

# --- Test: run an encoded command and confirm it decodes in Event ID 4104 --------
Write-Host "[*] Testing encoded command..."
$testCommand = "Write-Host 'Test'"
$encodedCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($testCommand))
Write-Host "    Input: powershell -enc $encodedCommand"

$testStart = (Get-Date).AddSeconds(-1)
Start-Process -FilePath "powershell.exe" -ArgumentList @("-NoProfile", "-NonInteractive", "-EncodedCommand", $encodedCommand) `
    -WindowStyle Hidden -Wait

Start-Sleep -Seconds 2
$decodedEvent = Get-WinEvent -FilterHashtable @{ LogName = "Microsoft-Windows-PowerShell/Operational"; Id = 4104; StartTime = $testStart } `
        -ErrorAction SilentlyContinue |
    Where-Object { $_.Message -like "*Write-Host*Test*" } |
    Select-Object -First 1

if ($decodedEvent) {
    Write-Host "    Event ID 4104 found: `"$testCommand`"  [VERIFIED]"
} else {
    Write-Host "    Event ID 4104 NOT found yet - Script Block Logging may need a policy refresh cycle to take effect  [PENDING]"
}
