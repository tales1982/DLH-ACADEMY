# 7. The Service Minimizer

**Goal:** Identify and disable unnecessary services to reduce the attack surface to only what MedDefense operations require.

## Context

CIS Benchmark Section 2 covers service configuration. The principle: every running service is a potential entry point. A billing server does not need `avahi-daemon`, `cups` or `rpcbind`. The 1x02 scan found billing-srv-01 with unnecessary services exposed network-wide (Finding 006: MySQL on 0.0.0.0). The baseline snapshot counted 24 enabled services. A production billing server needs fewer than 10.

## Instructions

Write a script `7-service_minimization.sh` that:

- Lists all enabled services
- Compares against a whitelist of services required for MedDefense (defined as an array with comments explaining why each is needed)
- Stops and disables services not on the whitelist
- Verifies required services are running
- Reports the before/after count

## Expected Output

```
$ sudo ./7-service_minimization.sh
[*] Scanning enabled services...
    Enabled services found: 24
[*] Comparing against MedDefense whitelist (9 required services)...
  avahi-daemon.service     [STOPPED] [DISABLED]
  cups.service             [STOPPED] [DISABLED]
  ModemManager.service     [STOPPED] [DISABLED]
  bluetooth.service        [STOPPED] [DISABLED]
  ssh.service              [ACTIVE]
  apache2.service          [ACTIVE]
  mysql.service            [ACTIVE]
  ufw.service              [ACTIVE]
  auditd.service           [ACTIVE]
  apparmor.service         [ACTIVE]
  cron.service             [ACTIVE]
  rsyslog.service          [ACTIVE]
  systemd-timesyncd.service [ACTIVE]
Before: 24 | After: 9 | Disabled: 15
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `7-service_minimization.sh`
