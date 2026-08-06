# 15. The Post-Hardening Validator

**Goal:** Write a read-only script that independently verifies every hardening control is in its expected state.

## Context

Hardening is not a one-time event. Configuration drift happens: an admin changes a sysctl setting for debugging and forgets to revert. A software update overwrites `sshd_config`. This script is the continuous validation tool James Chen runs every Monday morning. It makes no changes to the system. It only reads and reports.

## Instructions

Write a script `15-validation.sh` that checks every hardening setting from Tasks 4-13 against its expected value. For each control:

- Read the actual system state
- Compare against the expected value
- Record PASS or FAIL

The script must exit with code 0 if all checks pass, code 1 if any check fails.

## Expected Output

```
$ sudo ./15-validation.sh
[PASS] PermitRootLogin = no
[PASS] PasswordAuthentication = no
[PASS] MaxAuthTries = 3
[PASS] net.ipv4.ip_forward = 0
[PASS] net.ipv4.tcp_syncookies = 1
[PASS] kernel.randomize_va_space = 2
[FAIL] net.ipv4.conf.all.log_martians = 0 (expected: 1)
[PASS] auditd.service = active
[PASS] apparmor.service = active
[PASS] UFW status = active
[PASS] Default incoming = deny
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `15-validation.sh`
