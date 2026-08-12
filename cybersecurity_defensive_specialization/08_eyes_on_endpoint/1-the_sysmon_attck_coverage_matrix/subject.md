# 1. Sysmon ATT&CK Coverage Matrix

**Goal:** Produce a structured coverage matrix that proves which attacker techniques are visible through the current Sysmon configuration and which require tuning.

## Context

The original Sysmon gap task was useful, but it was too narrow. In this project, telemetry is not only a config check. The point is to prove whether endpoint instrumentation produces useful evidence for specific attacker behaviors. This rebuilt task turns the Sysmon configuration into an ATT&CK-aligned coverage matrix that later detection and handoff tasks can use.

Sysmon coverage must be measured in three dimensions:

- Whether the required Event IDs are enabled
- Whether the config filters out the activity
- Whether the resulting event has enough fields to support triage

## Instructions

Write a PowerShell script named `1-sysmon_coverage_matrix.ps1`.

The script must read `sysmonconfig.xml` and generate `sysmon_coverage_matrix.json`.

The script must:

- Parse enabled Sysmon event types from the XML
- Identify include/exclude rules that could suppress relevant events
- Map ATT&CK techniques to required Sysmon Event IDs
- Evaluate each technique as: `covered`, `partial`, `blind`
- Include the reason for the status
- Include a recommended tuning action for every partial or blind item
- Print a summary of coverage

Minimum ATT&CK mappings:

- T1059 Command and Scripting Interpreter — Sysmon EID 1
- T1053 Scheduled Task/Job — Sysmon EID 1
- T1547 Boot or Logon Autostart Execution — Sysmon EID 13
- T1055 Process Injection — Sysmon EID 8, 10
- T1071 Application Layer Protocol — Sysmon EID 3, 22
- T1574.002 DLL Side-Loading — Sysmon EID 7
- T1027 Obfuscated or Compressed Files — Sysmon EID 11, 15

Each matrix row must include:

- `technique_id`
- `technique_name`
- `required_event_ids`
- `enabled_event_ids`
- `filter_conflicts`
- `coverage_status`
- `evidence_fields_expected`
- `recommendation`

## Expected Output

```
PS> .\1-sysmon_coverage_matrix.ps1
[*] Parsing Sysmon config: sysmonconfig.xml
Enabled Event IDs: 1, 3, 7, 11, 12, 13, 22
Techniques assessed: 7
Covered: 5
Partial: 2
Blind: 0
Report saved to: sysmon_coverage_matrix.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `1-sysmon_coverage_matrix.ps1`, `sysmon_coverage_matrix.json`
