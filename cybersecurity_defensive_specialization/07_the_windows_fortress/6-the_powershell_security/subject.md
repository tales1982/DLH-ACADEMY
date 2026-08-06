# 6. PowerShell Security

**Goal:** Configure PowerShell logging and execution restrictions to ensure every PowerShell command executed on MedDefense systems is captured, neutralizing the attacker's most powerful post-exploitation tool.

## Context

PowerShell is the most commonly abused legitimate tool in post-exploitation. The Crimson Tide advisory noted `powershell.exe -enc [base64]` in the process creation logs of compromised hospitals (Phase 3). Without Script Block Logging, encoded PowerShell commands are invisible. Without Module Logging, you cannot trace which capabilities the attacker loaded. Without Transcription, you have no complete record of the session.

## Instructions

Write a PowerShell script `6-powershell_security.ps1` that:

- Creates a GPO named "MedDefense - PowerShell Security"
- Enables Script Block Logging (logs the decoded content of every PowerShell script, including encoded commands)
- Enables Module Logging for all modules
- Enables Transcription to `C:\PSTranscripts\`
- Verifies AMSI integration is active
- Tests by running an encoded PowerShell command and verifying it appears decoded in Event ID 4104

## Expected Output

```
PS> .\6-powershell_security.ps1
[*] Creating GPO: "MedDefense - PowerShell Security"... CREATED
[*] Configuring Script Block Logging...
    EnableScriptBlockLogging = 1           [SET]
    -> Event ID 4104 captures decoded scripts
[*] Configuring Module Logging...
    EnableModuleLogging = 1, ModuleNames = *  [SET]
    -> Event ID 4103 captures module invocations
[*] Configuring Transcription...
    OutputDirectory = C:\PSTranscripts     [SET]
[*] Verifying AMSI... AMSI DLL loaded     [OK]
[*] Linking GPO and forcing update... COMPLETE
[*] Testing encoded command...
    Input: powershell -enc VwByAGkAdABlAC0ASABvAHMAdAAgACIAVABlAHMAdAAi
    Event ID 4104 found: "Write-Host 'Test'"  [VERIFIED]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `6-powershell_security.ps1`
