# 2. PowerShell Logging Validation

**Goal:** Verify that PowerShell Script Block Logging, Module Logging and Transcription are correctly capturing commands of varying complexity.

## Context

PowerShell logging was enabled. But "enabled" does not mean "complete." Encoded commands should appear decoded in Script Block Logs. Module imports should appear in Module Logging. Remote operations should generate transcripts. This task proves each logging layer works against the types of PowerShell the Crimson Tide attacker actually used.

## Instructions

Write a PowerShell script `2-powershell_logging_validation.ps1` that:

- Executes a simple command (`Get-Process`) and checks Event ID 4104 (Script Block)
- Executes an encoded command (`powershell -enc [base64 of Write-Host "Test"]`) and checks that the decoded content appears in Event ID 4104
- Executes a module import (`Import-Module ActiveDirectory`) and checks Event ID 4103 (Module Logging)
- Executes a multi-line script block and verifies the full block is captured
- Checks that a transcription file was created in `C:\PSTranscripts\` for the session

For each test: report CAPTURED / MISSED and the detail level (full content vs partial).

## Expected Output

```
PS> .\2-powershell_logging_validation.ps1
[*] Testing PowerShell logging coverage...
    [1/5] Simple command (Get-Process)...
          EID 4104: "Get-Process" captured                     [PASS]
    [2/5] Encoded command...
          Input: -enc VwByAGkAdABlAC0ASABvAHMAdAAgACIAVABlAHMAdAAi
          EID 4104: "Write-Host 'Test'" (decoded) captured     [PASS]
    [3/5] Module import...
          EID 4103: "Import-Module ActiveDirectory" captured   [PASS]
    [4/5] Multi-line script block...
          EID 4104: Full block captured (12 lines)             [PASS]
    [5/5] Transcription file...
          C:\PSTranscripts\*.txt exists, session recorded      [PASS]
Tests: 5 | Captured: 5 | Missed: 0
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `2-powershell_logging_validation.ps1`
