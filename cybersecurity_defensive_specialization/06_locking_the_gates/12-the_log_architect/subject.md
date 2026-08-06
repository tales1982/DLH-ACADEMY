# 12. The Log Architect

**Goal:** Configure rsyslog for structured logging and set log rotation policies that ensure logs are preserved and exportable.

## Context

`auditd` handles kernel-level events, but authentication logs (`auth.log`), system logs (`syslog`) and service logs are handled by `rsyslog`. If rsyslog is misconfigured, SSH login attempts, PAM events and service failures disappear into `/dev/null`. If log rotation is too aggressive, evidence is destroyed before analysts can examine it. This task ensures that every log source on the hardened server is properly configured, retained and ready for the telemetry export you will build in 2x02.

## Instructions

Write a script `12-log_config.sh` that:

- Configures rsyslog to write auth events to `/var/log/auth.log` with structured formatting
- Configures syslog facility routing for security-relevant sources
- Sets log rotation policies: `auth.log` retained 90 days, `syslog` retained 60 days, compressed after 7 days
- Verifies that `auth.log` and `syslog` are actively receiving events
- Ensures log file permissions restrict access to root only

## Expected Output

```
$ sudo ./12-log_config.sh
[*] Configuring rsyslog...
    auth,authpriv.* -> /var/log/auth.log     [CONFIGURED]
    *.info;auth.none -> /var/log/syslog      [CONFIGURED]
[*] Setting log rotation policies...
    /var/log/auth.log: rotate 90, compress after 7d  [SET]
    /var/log/syslog: rotate 60, compress after 7d    [SET]
[*] Verifying log activity...
    /var/log/auth.log: receiving events       [OK]
    /var/log/syslog: receiving events         [OK]
[*] Securing log file permissions...
    /var/log/auth.log: 640 root:adm          [OK]
    /var/log/syslog: 640 root:adm            [OK]
Log sources configured: 2 | Rotation policies: 2 | Permissions: secured
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `12-log_config.sh`
