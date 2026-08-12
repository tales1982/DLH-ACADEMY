# 9. Windows Attacker Simulation

**Goal:** Execute a controlled sequence of attacker-like actions on the hardened Windows endpoint and record the ground truth of what was executed.

## Context

The telemetry validation in Block 1 tested individual event types in isolation. This task tests them together in a realistic attack sequence. You will run the attacker's playbook from the Crimson Tide advisory against your own hardened endpoint: create a user, escalate privileges, run encoded PowerShell, establish persistence, initiate an outbound connection. Every action is logged with its exact timestamp so you can later prove (in Task 10) that your instrumentation captured each one.

## Instructions

Write a PowerShell script `9-windows_attack_sim.ps1` that executes the following sequence, recording each action with a precise timestamp:

- Create a new local user account (`support_update`)
- Add the user to the Administrators group
- Run an encoded PowerShell command (harmless payload, e.g., `Write-Host "C2 beacon"`)
- Create a scheduled task for persistence (`schtasks /create`)
- Initiate an outbound network connection (`Test-NetConnection` to a safe external IP)
- Drop a file in a startup directory (`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\`)

After execution, produce a ground truth JSON file recording: action number, description, exact timestamp, expected detection source (Sysmon Event ID, Security Event ID), MITRE ATT&CK technique.

Clean up all artifacts after logging.

## Expected Output

```
PS> .\9-windows_attack_sim.ps1
[*] Running Windows attacker simulation...
    [1/6] Creating local user 'support_update'...      2026-03-25T14:30:01Z
    [2/6] Adding to Administrators group...            2026-03-25T14:30:02Z
    [3/6] Running encoded PowerShell...                2026-03-25T14:30:03Z
    [4/6] Creating scheduled task...                   2026-03-25T14:30:04Z
    [5/6] Outbound network connection...                2026-03-25T14:30:05Z
    [6/6] Dropping file in Startup...                   2026-03-25T14:30:06Z
[*] Cleaning up artifacts...
    User removed, task deleted, file removed           [CLEAN]
Actions executed: 6
Ground truth saved to: windows_attack_log.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `9-windows_attack_sim.ps1`
