# 8. Linux Telemetry Quality Gate

**Goal:** Assess Linux telemetry quality using the same standard applied to Windows telemetry.

## Context

This project is cross-platform. If Windows telemetry is measured strictly but Linux telemetry is only exported, the handoff becomes uneven. This rebuilt task makes Linux telemetry quality comparable to Windows telemetry quality by measuring distribution, field completeness, timestamp coverage, and visibility gaps.

## Instructions

Write a Bash script named `8-linux_telemetry_quality.sh`.

The script must read `linux_events_export.json` and produce `linux_telemetry_quality.json`.

The quality report must include:

- Event distribution
  - count per event category
  - count per source type
  - percentage of total
- Time coverage
  - events per hour
  - hours with events
  - hours without events
- Gap detection
  - any period longer than 30 minutes with no events
- Field completeness
  - timestamp
  - hostname
  - source_type
  - event_category
  - command line for execve
  - source IP/user for SSH events
  - path/operation/key for auditd file events
- Quality score
  - weighted score from 0–100
  - assessment: good, acceptable, or poor

The script must use `jq` for JSON parsing.

## Expected Output

```
$ ./8-linux_telemetry_quality.sh
[*] Analyzing linux_events_export.json...
Total events: 2022
Hours with events: 24/24
No gaps detected
execve command_line completeness: 100%
SSH source_ip completeness: 100%
auditd file path completeness: 100%
Quality score: 96.1% (good)
Report saved to: linux_telemetry_quality.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `8-linux_telemetry_quality.sh`
