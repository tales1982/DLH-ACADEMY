# 20. The Priority Matrix

**Goal:** Produce the definitive vulnerability remediation timeline organized by urgency.

## Context

This is the document that goes on the IT Director's desk Monday morning. It tells her: fix this today, this by Friday, this by month-end and this by quarter-end. No ambiguity. No "it depends." Clear actions, clear timelines, clear owners.

## Instructions

Organize ALL "Actionable" findings (Critical and Standard from T16) into a Priority Matrix with 4 time horizons:

| Horizon | Timeline | Criteria |
|---|---|---|
| Immediate | 24-48 hours | Weaponized exploit + critical asset + active threat |
| Short-term | 7 days | Critical/High CVE with PoC + important asset |
| Medium-term | 30 days | High/Medium CVE or significant misconfiguration |
| Long-term | 90 days | Architecture changes, EOL migrations, systemic fixes |

For each entry: Finding ID, description (one line), remediation action (one line), owner and estimated cost.

End with a **Budget Summary**: What is the total estimated cost of all remediations? How does this compare to the $120,000 annual security budget from 1x00? What must be deferred and why?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `20-priority_matrix.md`
