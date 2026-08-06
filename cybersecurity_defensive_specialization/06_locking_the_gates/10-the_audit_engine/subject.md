# 10. The Audit Engine

**Goal:** Deploy and configure auditd to monitor security-critical events, creating the audit trail that feeds future telemetry export.

## Context

Marcus Webb's notes from the 1x00 incident: "No SIEM or IDS was deployed. Attacker moved undetected for 5 days." `auditd` is the Linux kernel audit framework. It records system calls, file accesses and authentication events at the kernel level. The logs it generates become the primary Linux data source for the analyst work in Module 3. The rules you write here determine what the SOC can see.

## Instructions

Write a script `10-auditd_config.sh` that:

- Installs and enables `auditd`
- Deploys audit rules to `/etc/audit/rules.d/meddefense.rules` covering: identity files, privilege escalation, suspicious tool execution and MedDefense-specific file integrity
- Loads the rules and verifies they are active
- Tests by triggering an auditable event and checking the log

## Expected Output

```
$ sudo ./10-auditd_config.sh
[*] Enabling auditd service...
    auditd.service: active (running)
[*] Deploying MedDefense audit rules...
    -w /etc/passwd -p wa -k identity              [ADDED]
    -w /etc/shadow -p wa -k identity              [ADDED]
    -w /etc/group -p wa -k identity               [ADDED]
    -w /etc/pam.d/ -p wa -k pam_config            [ADDED]
    -w /etc/ssh/sshd_config -p wa -k sshd_config  [ADDED]
    -w /usr/bin/sudo -p x -k priv_esc             [ADDED]
    -w /usr/bin/su -p x -k priv_esc               [ADDED]
    -w /etc/sudoers -p wa -k sudoers              [ADDED]
    -w /usr/bin/wget -p x -k suspicious_download  [ADDED]
    -w /usr/bin/curl -p x -k suspicious_download  [ADDED]
    -w /usr/bin/nc -p x -k suspicious_netcat      [ADDED]
    -w /var/lib/mysql/ -p wa -k meddefense_db     [ADDED]
    -w /etc/apache2/ -p wa -k meddefense_web      [ADDED]
    -w /etc/init.d/ -p wa -k startup_scripts      [ADDED]
[*] Loading rules... augenrules --load: OK
[*] Verifying... auditctl -l: 14 rules loaded
[*] Test: reading /etc/shadow...
    ausearch -ts recent -k identity: 1 event found [PASS]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `10-auditd_config.sh`
