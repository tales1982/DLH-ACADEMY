# 6. The Permission Sweep

**Goal:** Audit and remediate dangerous filesystem permissions that could enable privilege escalation.

## Context

SUID binaries are how an attacker with low-privilege shell access escalates to root. World-writable files are how an attacker modifies scripts that run as root. Both are classic privilege escalation vectors that the Crimson Tide affiliate would use after initial access (Phase 3). The baseline snapshot from Task 0 found 23 SUID binaries and 7 world-writable files. Not all of them are necessary.

## Instructions

Write a script `6-filesystem_hardening.sh` that:

- Finds all SUID binaries, compares against a hardcoded whitelist of known-safe binaries for Ubuntu 22.04, removes SUID from unexpected binaries
- Does the same for SGID binaries
- Finds and remediates world-writable files (excluding `/proc`, `/sys`, `/dev`)
- Checks and configures mount options for `/tmp`, `/var/tmp` and `/dev/shm` (`noexec`, `nosuid`, `nodev`)
- Restricts cron access to authorized users
- Prints a full remediation summary

## Expected Output

```
$ sudo ./6-filesystem_hardening.sh
Found 23 SUID binaries
Whitelisted: 18
Non-whitelisted: 5
  /usr/local/bin/oldtool   [SUID REMOVED]
  /opt/legacy/setuid-app   [SUID REMOVED]
Found 12 SGID binaries
Whitelisted: 11
Non-whitelisted: 1
  /usr/local/bin/shared    [SGID REMOVED]
Found 7 world-writable files
  /tmp/debug.log           [FIXED]
  /var/www/html/uploads/   [FIXED]
/tmp:     noexec,nosuid,nodev  [OK]
/var/tmp: noexec,nosuid,nodev  [APPLIED]
/dev/shm: noexec,nosuid,nodev  [OK]
SUID remediated: 5 | SGID remediated: 1 | World-writable fixed: 7
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `6-filesystem_hardening.sh`
