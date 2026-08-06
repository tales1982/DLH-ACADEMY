# 16. Lynis Improvement Diff

**Goal:** Compare pre-hardening and post-hardening Lynis results and produce a structured improvement report.

## Context

Sarah Park needs a report that shows which findings disappeared, which remain, and whether hardening introduced new issues.

## Instructions

Write `16-lynis_diff.sh`.

The script must read `lynis_findings.json` and `lynis_post_findings.json` or generate the post-hardening file by running Lynis and parsing it.

The script must write `hardening_improvement.json` with:

- `before_score`
- `after_score`
- `delta`
- `resolved_findings`
- `remaining_findings`
- `new_findings`
- `resolved_count`
- `remaining_count`
- `new_count`
- `residual_risk_summary`

## Expected Output

```
$ sudo ./16-lynis_diff.sh
Before: 52
After: 84
Delta: +32
Findings resolved: 41
Findings remaining: 22
New findings: 4
Report saved to: hardening_improvement.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `16-lynis_diff.sh`
