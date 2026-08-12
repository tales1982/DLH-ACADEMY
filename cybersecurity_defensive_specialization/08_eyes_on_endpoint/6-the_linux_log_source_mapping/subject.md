# 6. Linux Log Source Mapping

**Goal:** Inventory all active log sources on the hardened Linux system, documenting their location, format, rotation policy, security relevance and event rate.

## Context

Linux telemetry comes from multiple sources with different formats: auditd produces structured records, auth.log uses syslog format, application logs vary by service. Before you can export this data in a consistent format, you need to know exactly what you have. This inventory becomes the input specification for your export script.

## Instructions

Write a script `6-log_source_map.sh` that:

- Discovers all active log sources on the system: auth.log, syslog, audit.log, kern.log, dpkg.log, apache2 access/error logs and any other security-relevant sources
- For each source: file path, format type (syslog, JSON, audit, custom), rotation policy (from logrotate config), current file size, estimated events per hour, security relevance rating (critical, high, medium, low)
- Identifies any expected sources that are missing or not generating events

## Expected Output

```
$ ./6-log_source_map.sh
[*] Discovering log sources...
Source             Path                    Format    Rotation   Events/hr  Relevance
------             ----                    ------    --------   ---------  ---------
auth.log           /var/log/auth.log       syslog    90 days    42         critical
audit.log          /var/log/audit/audit.log audit     30 days    187        critical
syslog             /var/log/syslog         syslog    60 days    95         high
kern.log           /var/log/kern.log       syslog    30 days    12         medium
apache2 access     /var/log/apache2/access  combined  14 days    234        high
apache2 error      /var/log/apache2/error   custom    14 days    8          high
dpkg.log           /var/log/dpkg.log       custom    365 days   <1         medium
Sources found: 7 | Missing: 0
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `6-log_source_map.sh`
