# 3. Windows Telemetry Normalizer

**Goal:** Export Windows telemetry into analyst-ready JSON with normalized timestamps, consistent field names, and event-specific enrichment.

## Context

The original Windows export task focused on exporting logs. This rebuilt task focuses on producing data that can actually be consumed by the SOC. Raw EVTX data is not enough. The analyst needs consistent JSON records with standard fields across Security, Sysmon, and PowerShell logs.

This script becomes the Windows half of the final telemetry handoff package.

## Instructions

Write a PowerShell script named `3-windows_telemetry_export.ps1`.

The script must export telemetry from a configurable time window. The default window must be the last 24 hours.

The script must read from:

- Windows Security log
- Sysmon Operational log
- PowerShell Operational log

The script must generate `windows_events_export.json`.

Each exported event must include normalized common fields:

- `timestamp`
- `hostname`
- `platform`
- `source_type`
- `channel`
- `event_id`
- `event_category`
- `provider`
- `raw_message`

For key event types, extract enriched fields:

- 4624: target user, logon type, source IP, workstation
- 4625: target user, failure reason, source IP
- 4672: privileged account
- 4688: process name, command line, parent process if present
- 4104: decoded script block text
- Sysmon 1: image, command line, parent image, hashes
- Sysmon 3: destination IP, destination port, process
- Sysmon 11: target filename, creating process
- Sysmon 13: registry key, value name
- Sysmon 22: query name, query results

The script must print counts per channel and top Event IDs.

## Expected Output

```
PS> .\3-windows_telemetry_export.ps1
[*] Exporting Windows telemetry from last 24 hours...
Security events: 847
Sysmon events: 1234
PowerShell events: 189
Total events: 2270
Top Event IDs: 4624, Sysmon-1, 4104, 4625
Output: windows_events_export.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `3-windows_telemetry_export.ps1`, `windows_events_export.json`
