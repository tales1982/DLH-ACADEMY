# 3. Windows Telemetry Reference Builder

**Goal:** Build a machine-readable Windows event reference that connects security events to MedDefense detection use cases.

## Context

A findings list tells you what is broken. A telemetry reference tells you what "good" looks like once it is fixed - the operational bridge between audit policy configuration (Task 2), Sysmon deployment, PowerShell logging, and the Module 3 detection work that consumes this exact telemetry. This becomes the reference every future detection rule and every SOC runbook cites.

## Instructions

Write `3-telemetry_reference.ps1`.

The script must generate `windows_event_reference.json`.

The reference must include:

- Security log: 4624, 4625, 4648, 4672, 4688, 4720, 4726, 4732, 1102.
- PowerShell log: 4103, 4104.
- Sysmon log: 1, 3, 7, 11, 13, 22.

For each event include `event_id`, `event_name`, `log_source`, `audit_or_sensor_dependency`, `security_meaning`, `normal_frequency`, `triage_priority`, `crimson_tide_phase`, `example_suspicious_pattern`, and `validation_method`.

## Expected Output

```
PS> .\3-telemetry_reference.ps1
Security events mapped: 9
PowerShell events mapped: 2
Sysmon events mapped: 6
Total events documented: 17
Reference saved to: windows_event_reference.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `3-telemetry_reference.ps1`
