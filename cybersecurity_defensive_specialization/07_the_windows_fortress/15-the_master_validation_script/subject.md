# 15. Master Validation Script

**Goal:** Produce the comprehensive validation script that checks every hardening setting, serving as the weekly compliance check for the Windows domain.

## Context

James Chen will run this every Friday. It makes no changes to the system. It reads every setting deployed, compares against expected values and produces a compliance dashboard. This is the Windows equivalent of `15-validation.sh` from 2x00.

## Instructions

Write a PowerShell script `15-master_validation.ps1` that checks every hardening setting, reports PASS/WARN/FAIL for each. The script must exit with code 0 if all critical checks pass, code 1 if any critical check fails.

## Expected Output

```
PS> .\15-master_validation.ps1
--- Password & Lockout) ---
[PASS] Minimum length: 14
[PASS] Lockout threshold: 5

--- Audit Policy ---
[PASS] Process Creation: Success
[PASS] Command-line logging: Enabled
[PASS] Security log: 1 GB

--- PowerShell ---
[PASS] Script Block Logging: Enabled
[PASS] Transcription: Enabled

--- Sysmon ---
[PASS] Service: Running
[PASS] Custom rules: 5 present

--- Kerberos ---
[PASS] DES: Disabled
[PASS] RC4: Disabled

--- SMB ---
[PASS] SMBv1: Disabled
[PASS] Signing: Required

--- Firewall ---
[PASS] All profiles: ON, DefaultInbound: Block

--- RDP ---
[PASS] NLA: Required
[PASS] G_IT_Admins only

--- Service Accounts ---
[PASS] Delegation restricted: 3/3
[WARN] svc_backup password age: 235 days
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `15-master_validation.ps1`
