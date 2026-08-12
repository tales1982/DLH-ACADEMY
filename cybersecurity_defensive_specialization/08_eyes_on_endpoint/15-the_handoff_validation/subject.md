# 15. Handoff Validation

**Goal:** Validate the telemetry handoff package against quality gates to ensure it is ready for analyst consumption in future.

## Context

This is the quality gate. If the handoff package is malformed, incomplete or inconsistent. This script is a meta-validator: it checks file existence, JSON validity, required field presence, minimum event counts per source, timestamp consistency across platforms and ground truth completeness. It is the final script you run before crossing from the builder role, into the analyst role.

## Instructions

Write a script `15-handoff_validation.sh` that validates the `telemetry_handoff/` directory:

- File existence: all 3 expected files present
- JSON validity: each file parses without errors
- Required fields: every event has `timestamp`, `hostname`, `sourcetype`, `eventcategory`
- Minimum event counts: Windows >= 1000 events, Linux >= 500 events, ground truth >= 10 actions
- Timestamp consistency: all timestamps are valid ISO 8601, all within a reasonable range, no future timestamps
- Cross-platform alignment: timestamp ranges overlap (both platforms cover the same period)
- Ground truth completeness: every action has a corresponding detection matrix entry

Report PASS/FAIL per check with a final verdict.

## Expected Output

```
$ ./15-handoff_validation.sh
[*] Validating telemetry_handoff/ ...
=== File Existence ===
[PASS] windows_events.json exists (4.2 MB)
[PASS] linux_events.json exists (3.1 MB)
[PASS] attack_ground_truth.json exists (12 KB)
=== JSON Validity ===
[PASS] windows_events.json: valid JSON, 2270 objects
[PASS] linux_events.json: valid JSON, 2022 objects
[PASS] attack_ground_truth.json: valid JSON, 12 objects
=== Required Fields ===
[PASS] All events have timestamp, hostname, source_type, event_category
=== Minimum Event Counts ===
[PASS] Windows: 2,270 >= 1,000
[PASS] Linux: 2,022 >= 500
[PASS] Ground truth: 12 >= 10
=== Timestamp Consistency ===
[PASS] All timestamps valid ISO 8601
[PASS] No future timestamps
[PASS] Range: 2026-03-25T00:00:00Z to 2026-03-25T23:59:59Z
=== Cross-Platform Alignment ===
[PASS] Windows and Linux time ranges overlap (23.5 hours shared)
=== Ground Truth Completeness ===
[PASS] 12/12 actions have detection matrix entries
VERDICT: PASS (14/14 checks)
Handoff package is ready for Module 3.
Report saved to: handoff_validation.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `15-handoff_validation.sh`, `handoff_validation.json`
