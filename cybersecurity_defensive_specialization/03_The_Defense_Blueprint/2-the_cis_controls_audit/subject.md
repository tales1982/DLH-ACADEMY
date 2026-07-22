# 2. The CIS Controls Audit

**Goal:** Score MedDefense against the CIS Top 18 Controls to produce a concrete, actionable security maturity assessment.

## Context

NIST CSF tells you what functions to address. CIS Controls tell you exactly what to implement, in what order. The CIS Controls are organized into three Implementation Groups:

- **IG1 (Essential):** The minimum standard every organization should meet. 56 safeguards. Think of this as "basic hygiene."
- **IG2 (Foundational):** Additional safeguards for organizations with more complex environments. Builds on IG1.
- **IG3 (Organizational):** Advanced safeguards for organizations with dedicated security teams handling sophisticated attacks.

MedDefense, as a healthcare organization handling regulated data with a small security team, should target IG1 fully implemented and IG2 partially implemented within 6 months.

## Provided Files

- `cis-controls-summary.txt` (all 18 controls with IG1/IG2 safeguard descriptions)

## Instructions

Score MedDefense against each of the 18 CIS Controls using a simple 3-level scale:

| Score | Meaning |
|---|---|
| Implemented | The control is in place and functioning |
| Partial | Some elements of the control exist but coverage is incomplete |
| Not Implemented | The control is absent |

For each control:

- **CIS Control [#]:** [Name]
- **Score:** [Implemented / Partial / Not Implemented]
- **Evidence:** [One sentence referencing a specific finding from 1x00, 1x01 or 1x02]

After scoring all 18, produce:

1. **Scorecard Summary:** Count of Implemented / Partial / Not Implemented
2. **Top 5 Priority Controls:** The 5 controls whose implementation would have the greatest impact on MedDefense's security posture. Justify each choice in one sentence.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `2-cis_controls_audit.md`
