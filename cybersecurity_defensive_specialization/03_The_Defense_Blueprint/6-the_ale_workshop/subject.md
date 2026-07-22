# 6. The ALE Workshop

**Goal:** Calculate ALE for MedDefense's top 5 real risks and use the results to connect risk analysis to control investment.

## Context

The risk scenarios in Task 5 were exercises with provided data. Now you build the real ALE calculations for MedDefense, using the risks YOU identified across three projects, the asset values YOU assessed and the threat frequencies from the intelligence YOU gathered.

This is the point where your entire body of work converts into numbers that drive decisions.

## Instructions

Select the 5 highest-priority risks from your work (combining gaps, vulnerabilities and threats from all three prior projects). For each risk, produce a complete ALE calculation:

```
Risk: [Descriptive name, e.g., "Ransomware encrypts EHR system"]
Source: [Gap ID + Vulnerability Finding + Threat Actor from prior projects]

Asset: [Name, from 1x00 Asset Registry]
Asset Value (AV): [$ amount, with reasoning]
  Replacement/recovery cost: [$]
  Revenue loss during downtime: [$ per day × estimated days]
  Regulatory penalties: [$]
  Reputation/patient trust impact: [$, estimated]

Exposure Factor (EF): [%]
  Reasoning: [Why this percentage?]

SLE: AV × EF = [$]

ARO: [Frequency]
  Reasoning: [Based on sector data from 1x01 + MedDefense-specific factors]

ALE: SLE × ARO = [$]

Proposed Control: [What would mitigate this risk?]
Control Annual Cost: [$]
Estimated ALE After Control: [$, with new ARO or EF]
Net Benefit: (ALE Before) - (ALE After) - (Control Cost) = [$]
```

After all 5, produce a **Risk Prioritization by ALE table** ranking the risks from highest to lowest ALE.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `6-ale_workshop.md`
