# 3. Evidence-Based Remediation Queue

**Goal:** Convert the CIS control profile and Lynis findings into a prioritized, evidence-backed remediation queue.

## Context

This task becomes the decision engine that explains why Tasks 4-13 are performed and in what order. Every remediation item must be backed by evidence, mapped to a later hardening script, and ordered by risk.

## Instructions

Write `3-remediation_queue.sh`.

The script must read `cis_profile.json` and `lynis_findings.json`, then produce `gap_analysis.json` and `remediation_queue.json`.

For each CIS control, determine one status: `compliant`, `non_compliant`, `partially_compliant`, or `not_assessed`.

For every non-compliant or partially compliant control, include:

- matching Lynis finding IDs or messages
- affected asset
- remediation script to run
- severity
- priority score from 1-100
- operational risk if left unresolved
- expected validation check

The queue must be sorted by priority score descending.

## Expected Output

```
$ ./3-remediation_queue.sh
Controls assessed: 15
Compliant: 2
Non-compliant: 10
Partially compliant: 2
Not assessed: 1
Remediation actions queued: 12
Report saved to: gap_analysis.json
Queue saved to: remediation_queue.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `3-remediation_queue.sh`, `gap_analysis.json`, `remediation_queue.json`
