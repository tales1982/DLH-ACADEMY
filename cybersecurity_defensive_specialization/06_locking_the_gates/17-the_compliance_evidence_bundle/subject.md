# 17. Machine-Readable Compliance Evidence Bundle

**Goal:** Generate the final compliance artifact that proves what was selected, remediated, validated, and intentionally left unresolved.

## Context

This should not be a narrative report. It is an auditor-ready JSON artifact assembled from the outputs created throughout the project.

## Instructions

Write `17-compliance_bundle.sh`.

The script must read:

- `cis_profile.json`
- `gap_analysis.json`
- `remediation_queue.json`
- `audit_validation.json`
- `validation_results.json`
- `hardening_improvement.json`

The script must produce `compliance_report.json` with system identity, hardening date, selected/remediated/verified/unresolved controls, deviations, compensating controls, residual Lynis findings, final compliance percentage, and evidence files used.

Every deviation must include control ID, reason, risk accepted, compensating control, and owner.

## Expected Output

```
$ ./17-compliance_bundle.sh
Evidence files loaded: 6
Controls selected: 15
Controls remediated: 13
Controls verified: 13
Deviations documented: 2
Overall compliance: 86.7%
Residual findings: 22
Report saved to: compliance_report.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `17-compliance_bundle.sh`
