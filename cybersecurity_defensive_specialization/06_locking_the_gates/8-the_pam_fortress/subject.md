# 8. The PAM Fortress

**Goal:** Configure PAM to enforce password quality requirements and lock accounts after failed authentication attempts.

## Context

The Crimson Tide advisory documented that in 3 of 5 breaches, the attacker used harvested credentials (Phase 2) and Kerberoasting (Phase 3) to move laterally. Weak passwords are the root cause. PAM is where Linux enforces password policy. Currently, MedDefense has no password complexity requirements, no account lockout and no password history enforcement on its Linux servers.

## Instructions

Write a script `8-pam_hardening.sh` that:

- Installs `libpam-pwquality` if not present
- Configures password quality: `minlen 14`, complexity requirements, `reject_username`
- Configures account lockout with `pam_faillock`: 5 attempts, 900 second lockout
- Configures password history: remember 12 passwords
- Validates the PAM configuration by checking the relevant files

## Expected Output

```
$ sudo ./8-pam_hardening.sh
[*] Checking libpam-pwquality...
    Already installed: libpam-pwquality 1.4.2
[*] Configuring password quality (/etc/security/pwquality.conf)...
    minlen = 14                      [SET]
    dcredit = -1                     [SET]
    ucredit = -1                     [SET]
    lcredit = -1                     [SET]
    ocredit = -1                     [SET]
    maxrepeat = 3                    [SET]
    reject_username                  [SET]
[*] Configuring account lockout (pam_faillock)...
    deny = 5                         [SET]
    unlock_time = 900                [SET]
    fail_interval = 900              [SET]
[*] Configuring password history...
    remember = 12                    [SET]
Password minimum length: 14 | Lockout: 5 attempts / 15 min | History: 12
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `8-pam_hardening.sh`
