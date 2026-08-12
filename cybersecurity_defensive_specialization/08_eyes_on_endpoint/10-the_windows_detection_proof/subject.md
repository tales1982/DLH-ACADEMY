# 10. Windows Detection Proof

**Goal:** Correlate the Windows attack simulation log against captured telemetry to produce a detection matrix proving which actions were captured, by which source and with what detail.

## Context

You now have two datasets: the ground truth (Task 9) and the captured telemetry (Sysmon, Security, PowerShell logs). This task maps one to the other. For every action the attacker took, was it captured? By which source? With what Event ID? With what detail level? This detection matrix is the proof that your instrumentation works under realistic conditions.

## Instructions

Write a PowerShell script `10-windows_detection_proof.ps1` that:

- Reads `windows_attack_log.json` (ground truth from Task 9)
- For each simulated action, searches the Windows Event Logs (Security, Sysmon, PowerShell) within a 30-second window around the recorded timestamp
- Records: which source captured it, the Event ID, the detail level (full/partial/missed), the key fields present

## Expected Output

```
PS> .\10-windows_detection_proof.ps1
[*] Loading ground truth (6 actions)...
[*] Searching telemetry for each action...
Action                     Source         Event ID   Detail    Status
------                     ------         --------   ------    ------
Create user                Security       4720       Full      [CAPTURED]
Add to Administrators      Security       4732       Full      [CAPTURED]
Encoded PowerShell         PS ScriptBlock 4104       Full      [CAPTURED]
                           Sysmon         1          Full      [CAPTURED]
Scheduled task             Sysmon         1          Full      [CAPTURED]
Outbound connection        Sysmon         3          Full      [CAPTURED]
Startup file drop          Sysmon         11         Full      [CAPTURED]
Actions: 6 | Captured: 6/6 (100%) | Multi-source: 1
Report saved to: windows_detection_matrix.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `10-windows_detection_proof.ps1`
