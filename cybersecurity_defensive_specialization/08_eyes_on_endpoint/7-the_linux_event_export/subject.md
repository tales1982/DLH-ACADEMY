# 7. Linux Event Export

**Goal:** Export security-relevant Linux logs from a defined time window to structured JSON with normalized fields, parallel to the Windows export in Task 3.

## Context

The analyst in Module 3 needs Linux telemetry in the same structured format as Windows telemetry. auth.log records SSH logins and sudo usage. auditd records syscall-level events. syslog captures service activity. This script parses each format and produces consistent JSON that can be queried with `jq` alongside the Windows export.

## Instructions

Write a script `7-linux_export.sh` that:

- Parses auth.log to extract SSH events (login success/failure, source IP, user), sudo events (user, command) and su events
- Parses auditd logs to extract syscall events (execve with command line, file access with path, network socket creation with destination)
- Parses syslog to extract service start/stop events and error conditions
- For each event: normalizes timestamp to ISO 8601 UTC, extracts hostname, source_type, event_category and key fields

## Expected Output

```
$ ./7-linux_export.sh
[*] Parsing auth.log... 523 events
    SSH logins: 47 | sudo: 312 | su: 8 | PAM: 156
[*] Parsing audit.log... 1,187 events
    execve: 478 | file_access: 423 | network: 156 | other: 130
[*] Parsing syslog... 312 events
    service: 89 | error: 23 | other: 200
Total events: 2,022
Time range: 2026-03-25T00:00:00Z to 2026-03-25T23:59:59Z
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `7-linux_export.sh`
