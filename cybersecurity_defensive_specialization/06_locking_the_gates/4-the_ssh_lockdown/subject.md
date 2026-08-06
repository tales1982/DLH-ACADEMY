# 4. The SSH Lockdown

**Goal:** Harden SSH to eliminate password-based authentication and reduce the attack surface to the minimum required for MedDefense operations.

## Context

Finding 009 from your vulnerability assessment (1x02): "SSH on billing-srv-01 allows password-based authentication. Combined with no account lockout policy, this permits brute-force attacks." The Crimson Tide advisory confirmed: in 3 of 5 hospital breaches, the attacker used harvested credentials for SSH lateral movement (Phase 3). This is the first thing you fix.

## Instructions

Write a script `4-ssh_hardening.sh` that:

- Backs up the current `sshd_config` to `/etc/ssh/sshd_config.bak`
- Applies the following SSH hardening settings (each with a comment referencing the threat it addresses):
  - `PermitRootLogin no`
  - `PasswordAuthentication no`
  - `PermitEmptyPasswords no`
  - `X11Forwarding no`
  - `MaxAuthTries 3`
  - `ClientAliveInterval 300` and `ClientAliveCountMax 2` (idle timeout: 10 min)
  - `AllowUsers medadmin sysadmin`
  - `Protocol 2`
  - `LoginGraceTime 60`
  - `Banner /etc/issue.net`
- Creates the `/etc/issue.net` banner file
- Validates the configuration syntax with `sshd -t`
- If validation passes, restarts SSH. If it fails, restores the backup.

## Expected Output

```
$ sudo ./4-ssh_hardening.sh
[*] Backing up /etc/ssh/sshd_config
[*] Applying SSH hardening settings...
    PermitRootLogin no
    PasswordAuthentication no
    PermitEmptyPasswords no
    X11Forwarding no
    MaxAuthTries 3
    ClientAliveInterval 300
    ClientAliveCountMax 2
    AllowUsers medadmin sysadmin
    Protocol 2
    LoginGraceTime 60
    Banner /etc/issue.net
[*] Validating SSH configuration...
    sshd -t: OK
[*] Restarting SSH service...
    ssh.service: active (running)
Settings applied: 11
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `4-ssh_hardening.sh`
