# 13. Consolidated Telemetry Export

**Goal:** Combine all Windows and Linux telemetry exports plus the attacker simulation telemetry into a single structured handoff package with normalized timestamps across platforms.

## Context

Module 3 starts with the SOC receiving raw telemetry from endpoints. The handoff package you build here IS that telemetry. It must contain: normal operational events (the bulk), the attacker simulation events (the signal the SOC must find) and the ground truth (so the SOC can validate their detections). Timestamps must be consistent across Windows and Linux (both in UTC ISO 8601).

## Instructions

Write a script `13-consolidated_export.sh` that:

- Reads `windows_events_export.json` (Task 3) and `linux_events_export.json` (Task 7)
- Normalizes all timestamps to UTC ISO 8601 if not already
- Verifies field consistency across platforms (both must have: timestamp, hostname, source_type, event_category)
- Packages the attacker ground truth files (`windows_attack_log.json`, `linux_attack_log.json`) separately
- Produces the handoff directory structure:

```
telemetry_handoff/
  windows_events.json
  linux_events.json
  attack_ground_truth.json   (combined Windows + Linux)
```

## Expected Output

```
$ ./13-consolidated_export.sh
[*] Loading Windows events (2,270)...
[*] Loading Linux events (2,022)...
[*] Normalizing timestamps to UTC...
    Windows: 2,270 events normalized
    Linux: 2,022 events normalized
[*] Verifying field consistency...
    Required fields present in all events    [OK]
[*] Combining ground truth...
    Windows actions: 6 | Linux actions: 6 | Total: 12
[*] Building handoff directory...
telemetry_handoff/
  windows_events.json     (2,270 events, 4.2 MB)
  linux_events.json       (2,022 events, 3.1 MB)
  attack_ground_truth.json (12 actions)
Total: 4,292 events across 2 platforms
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `13-consolidated_export.sh`
