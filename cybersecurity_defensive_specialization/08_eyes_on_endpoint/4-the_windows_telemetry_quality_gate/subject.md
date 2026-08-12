# 4. Windows Telemetry Quality Gate

**Goal:** Assess whether exported Windows telemetry is complete, continuous, and useful enough for analyst handoff.

## Context

Exported telemetry can still be low quality. It may have missing command lines, empty source IP fields, time gaps, or one noisy event type drowning out everything else. This task is rebuilt as a quality gate that accepts or rejects the Windows export before it enters the final handoff.

## Instructions

Write a PowerShell script named `4-windows_telemetry_quality.ps1`.

The script must read `windows_events_export.json` and produce `windows_telemetry_quality.json`.

The quality report must include:

- Event distribution
  - count per Event ID
  - percentage of total
- Channel distribution
  - Security
  - Sysmon
  - PowerShell
- Time coverage
  - events per hour
  - hours with events
  - hours without events
- Gap detection
  - time periods longer than 30 minutes with no events
- Field completeness
  - required fields populated vs empty/null per event type
  - command line completeness for process events
  - source IP completeness for logon events
  - script block completeness for PowerShell events
- Quality score
  - weighted score from 0–100
  - assessment: good, acceptable, or poor

## Expected Output

```
PS> .\4-windows_telemetry_quality.ps1
[*] Analyzing windows_events_export.json...
Total events: 2270
Hours with events: 23/24
Largest gap: 60 minutes
Command-line completeness: 100%
Source IP completeness: 97%
Script block completeness: 100%
Quality score: 94.2% (good)
Report saved to: windows_telemetry_quality.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `4-windows_telemetry_quality.ps1`, `windows_telemetry_quality.json`
