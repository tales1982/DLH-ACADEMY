# 10. Sysmon Detection Tuning

**Goal:** Write custom Sysmon detection rules targeting MedDefense-specific threats, then validate each rule with a controlled trigger.

## Context

The SwiftOnSecurity config is a solid baseline, but it is generic. MedDefense has specific threats: Crimson Tide uses Rclone for exfiltration (Phase 4), PsExec for lateral movement (Phase 3), and encoded PowerShell for execution (Phase 3). Custom rules that detect THESE tools are more valuable than generic coverage. Adding rules for process creation from unusual paths, network connections to external IPs from server processes, file creation in startup directories and registry modifications to persistence keys makes the instrumentation specific to the MedDefense threat model.

## Instructions

Write a PowerShell script `10-sysmon_tune.ps1` that:

- Loads the current Sysmon configuration
- Adds 5 custom detection rules targeting MedDefense threats:
  - Rule 1: Detect `rclone.exe` execution (exfiltration tool)
  - Rule 2: Detect PsExec service installation (registry modification)
  - Rule 3: Detect encoded PowerShell execution (`-enc` in command line)
  - Rule 4: Detect `vssadmin.exe` delete shadows (ransomware pre-encryption)
  - Rule 5: Detect new scheduled task creation (persistence)
- Updates the Sysmon configuration
- Trigger-and-verify each rule: execute a safe trigger, check the Sysmon log, report PASS/FAIL

Produce the updated `sysmonconfig.xml` as a deliverable.

## Expected Output

```
PS> .\10-sysmon_tune.ps1
[*] Loading Sysmon config... OK
[*] Adding custom rules...
    Rule 1: Rclone detection                [ADDED]
    Rule 2: PsExec service installation     [ADDED]
    Rule 3: Encoded PowerShell              [ADDED]
    Rule 4: Shadow deletion (vssadmin)      [ADDED]
    Rule 5: Scheduled task persistence      [ADDED]
[*] Updating Sysmon config... OK
[*] Trigger-and-Verify...
    Rule 1: rclone.exe detection            [PASS]
    Rule 2: PsExec registry key             [PASS]
    Rule 3: Encoded PowerShell              [PASS]
    Rule 4: vssadmin execution              [PASS]
    Rule 5: schtasks /create                [PASS]
Custom rules: 5 added | Tests: 5/5 PASS
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `10-sysmon_tune.ps1`, `sysmonconfig.xml`
