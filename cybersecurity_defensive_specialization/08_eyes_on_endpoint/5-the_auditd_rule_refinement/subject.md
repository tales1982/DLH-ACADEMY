# 5. auditd Rule Refinement

**Goal:** Refine the auditd configuration from 2x00 by adding detection-focused rules for process execution, network socket creation and additional sensitive file access, then validate every rule fires correctly.

## Context

The auditd rules from 2x00 Task 10 covered identity files, privilege escalation and suspicious tool execution. But they missed critical categories: process execution via `execve` (the Linux equivalent of Sysmon Event ID 1), network socket creation, SSH key file access and modifications to cron directories. This task fills those gaps to bring Linux telemetry closer to the visibility level Sysmon provides on Windows.

## Instructions

Write a script `5-auditd_refine.sh` that:

- Loads the current auditd rules and reports the count
- Adds detection-focused rules:
  - Process execution via execve (`-a always,exit -F arch=b64 -S execve -k process_exec`)
  - Network socket creation (`-a always,exit -F arch=b64 -S socket -S connect -k network_connect`)
  - SSH key file access (`-w /home/*/.ssh/ -p rwa -k ssh_keys`)
  - Cron directory modifications (`-w /etc/cron.d/ -p wa -k cron_persist` and `/var/spool/cron/`)
  - sudo configuration access (`-w /etc/sudoers.d/ -p wa -k sudoers`)
- Loads the updated rules
- Validates each new rule fires by triggering a test action and searching with `ausearch`

## Expected Output

```
$ sudo ./5-auditd_refine.sh
[*] Current auditd rules: 14
[*] Adding detection-focused rules...
    execve syscall tracking               [ADDED]
    socket/connect syscall tracking       [ADDED]
    SSH key file monitoring               [ADDED]
    Cron directory monitoring             [ADDED]
    sudoers.d monitoring                  [ADDED]
[*] Loading rules... augenrules --load: OK
[*] Total rules: 19
[*] Validating new rules...
    execve: ran /usr/bin/id -> ausearch -k process_exec    [CAPTURED]
    socket: curl localhost -> ausearch -k network_connect  [CAPTURED]
    ssh_keys: touch ~/.ssh/test -> ausearch -k ssh_keys    [CAPTURED]
    cron: touch /etc/cron.d/test -> ausearch -k cron_persist [CAPTURED]
    sudoers: touch /etc/sudoers.d/test -> ausearch -k sudoers [CAPTURED]
Rules added: 5 | Validation: 5/5 PASS
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `5-auditd_refine.sh`
