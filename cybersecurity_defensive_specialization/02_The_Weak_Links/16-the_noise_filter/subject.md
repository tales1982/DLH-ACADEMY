# 16. The Noise Filter

**Goal:** Triage every finding in the scan report into action categories to separate signal from noise.

## Context

Thirty-one findings. You have investigated many of them individually. Now step back and sort the entire report. This is the daily discipline of vulnerability management: every scan produces more findings than you can act on. The triage determines what gets fixed, what gets monitored and what gets filed.

## Instructions

Classify every finding (all 31) from the scan report into one of 4 categories:

| Category | Definition | Action Required |
|---|---|---|
| Actionable Critical | Exploitable, on critical asset, high impact | Immediate remediation (24-48h) |
| Actionable Standard | Real vulnerability, requires planned remediation | Scheduled remediation (7-30 days) |
| Informational | Real observation, low risk or no direct action needed | Document and monitor |
| False Positive | Not a real vulnerability in this context | Document and dismiss |

Format:

```
Finding [ID] | [CVSS or Severity] | [Host] | Category: [AC/AS/I/FP] | Reason: [one sentence]
```

After the full triage, produce:

1. **Triage Summary:** Count per category
2. **Actionable Findings List:** The AC and AS findings, sorted by priority within each category

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `16-triage.md`
