# 12. The Gap Analysis

**Goal:** Perform a formal gap analysis by systematically cross-referencing asset criticality, control coverage and identified weaknesses to produce a prioritized list of security gaps.

## Context

You have built three foundational documents: an Asset Registry with criticality ratings, a Data Map with protection gaps, and a Complete Control Matrix with coverage assessments. Now you must bring them together.

> "This is the analysis that matters," says James Chen. "Everything you've done so far is building blocks. This is where it becomes a story the Board can act on."

A gap analysis is not a list of problems. It is a structured assessment that connects what you need to protect (critical assets and data) with what protections exist (controls) and identifies where the distance between the two is unacceptable.

## Instructions

Cross-reference your Asset Criticality Assessment (Task 8), Data Map (Task 9), Complete Control Matrix (Task 10) and Shadow IT findings (Task 11) to produce a **Prioritized Gap Analysis**.

Identify a minimum of **10 gaps**. For each gap, document:

```
Gap ID: [GAP-001, etc.]
Title: [One-line description]
Affected Asset(s): [From Asset Registry, with criticality rating]
Data at Risk: [From Data Map, with classification level]
Current Control Status: [What exists -- reference Control Matrix]
What is Missing: [Specific control category/function absent or inadequate]
Risk Level: [Critical / High / Medium / Low]
Risk Justification: [Why this level -- connect asset criticality, data sensitivity and control absence]
Potential Impact: [What happens if this gap is exploited -- be specific to MedDefense]
```

### Prioritization Rules

- **Critical:** Gap affects a Critical-rated asset or Restricted data AND has no detective or corrective control.
- **High:** Gap affects a High-rated asset or Confidential data AND has incomplete control coverage.
- **Medium:** Gap affects a Medium-rated asset OR has partial controls that reduce but do not eliminate risk.
- **Low:** Gap affects a Low-rated asset AND has partial compensating measures.

After the gap list, produce a **Gap Distribution Summary** showing:

1. How many gaps fall in each risk level.
2. Which asset categories have the most gaps.
3. Whether the gaps are concentrated in a specific control category or function.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `12-gap_analysis.md`
