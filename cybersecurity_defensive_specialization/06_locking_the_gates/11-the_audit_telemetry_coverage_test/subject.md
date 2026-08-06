# 11. Audit Telemetry Coverage Test

**Goal:** Prove that the audit rules deployed in Task 10 actually capture the security events MedDefense cares about.

## Context

The original audit validator encouraged risky system changes. This rebuilt version keeps the operational idea but makes the test safer, controlled, measurable, and usable as final compliance evidence.

## Instructions

Write `11-audit_coverage_test.sh`.

The script must produce `audit_validation.json` and test at least six controlled events:

- privileged command execution through `sudo`
- attempted access to `/etc/shadow`
- execution of `wget` or `curl`
- read or metadata check of `/etc/ssh/sshd_config`
- controlled write to a temporary file under a monitored test path
- cron configuration inspection or controlled test cron file action

For each test, record test name, expected audit key, command executed, timestamp, capture status, and matching event count or excerpt.

The script must include cleanup logic and must not leave unsafe test accounts, files, or cron jobs behind.

## Expected Output

```
$ sudo ./11-audit_coverage_test.sh
[*] Running audit telemetry coverage tests...
[1/6] sudo execution                    [CAPTURED]
[2/6] shadow access                     [CAPTURED]
[3/6] suspicious download tool          [CAPTURED]
[4/6] sshd config read                  [CAPTURED]
[5/6] monitored test file write         [CAPTURED]
[6/6] cron configuration check          [CAPTURED]
[*] Cleaning test artifacts...
Tests executed: 6
Captured: 6
Missed: 0
Report saved to: audit_validation.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `11-audit_coverage_test.sh`
