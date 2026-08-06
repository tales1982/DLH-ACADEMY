# 2. Windows Event Log Assessment

**Goal:** Assess the current event logging capability by checking which critical Event IDs the domain is actually generating and identifying the visibility gaps.

## Context

You need to know what the domain is currently capable of seeing. If Event ID 4688 (process creation) is not being generated, then every process the attacker runs is invisible. If Event ID 4672 (special logon) is not logged, you cannot detect when someone uses admin privileges. This task quantifies the gap between what the domain sees now and what it needs to see.

## Instructions

Write a PowerShell script `2-eventlog_assessment.ps1` that:

- Checks the current audit policy configuration using `auditpol /get /category:*`
- For each critical Event ID (4624, 4625, 4648, 4688, 4720, 4726, 4732, 4672, 1102), checks whether the required audit subcategory is enabled
- Queries the Security log to confirm which Event IDs have actually been generated in the last 24 hours

## Expected Output

```
PS> .\2-eventlog_assessment.ps1
Event ID  Description               Audit Subcategory     Status
--------  -----------               -----------------     ------
4624      Successful Logon          Logon                 [GENERATING]
4625      Failed Logon              Logon                 [GENERATING]
4648      Explicit Credentials      Logon                 [NOT CONFIGURED]
4688      Process Creation          Process Tracking      [NOT CONFIGURED]
4720      Account Created           Account Management     [NOT CONFIGURED]
4726      Account Deleted           Account Management     [NOT CONFIGURED]
4732      Member Added to Group     Account Management     [NOT CONFIGURED]
4672      Special Logon             Special Logon         [NOT CONFIGURED]
1102      Audit Log Cleared         System Integrity      [GENERATING]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `2-eventlog_assessment.ps1`
