# 14. Cross-Platform Coverage Assessment

**Goal:** Produce the final telemetry coverage assessment that explains what the SOC can detect, what remains partially visible, and what is still blind.

## Context

The original coverage assessment task was too broad. This rebuilt task makes the output precise and operational. It must combine the handoff package, detection matrices, and quality reports into a final metadata file that travels with the telemetry package.

The SOC should be able to read this file and immediately understand the strengths and limits of the dataset.

## Instructions

Write a Bash script named `14-coverage_assessment.sh`.

The script must read:

- `telemetry_handoff/windows_events.json`
- `telemetry_handoff/linux_events.json`
- `telemetry_handoff/attack_ground_truth.json`
- `windows_detection_matrix.json`
- `linux_detection_matrix.json`
- `windows_telemetry_quality.json`
- `linux_telemetry_quality.json`
- `sysmon_coverage_matrix.json`

The script must produce `telemetry_coverage_assessment.json`.

The assessment must include:

- Total events
  - by platform
  - by source type
  - by event category
- Detection matrix summary
  - total simulated actions
  - captured actions
  - missed actions
  - multi-source detections
- ATT&CK coverage
  - covered techniques
  - partially covered techniques
  - blind techniques
  - source responsible for coverage
- Known gaps
  - description
  - impacted platform
  - impacted technique
  - reason
  - recommended instrumentation improvement
- Quality summary
  - Windows score
  - Linux score
  - final handoff confidence rating

The script must use `jq`.

## Expected Output

```
$ ./14-coverage_assessment.sh
[*] Loading telemetry handoff package...
Windows events: 2270
Linux events: 2022
Ground truth actions: 12
Detection matrix: 11/12 captured
ATT&CK covered: 9
ATT&CK partial: 2
ATT&CK blind: 1
Windows quality: 94.2
Linux quality: 96.1
Confidence: acceptable
Report saved to: telemetry_coverage_assessment.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `14-coverage_assessment.sh`, `telemetry_coverage_assessment.json`
