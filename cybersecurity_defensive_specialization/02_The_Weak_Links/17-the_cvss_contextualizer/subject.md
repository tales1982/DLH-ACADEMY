# 17. The CVSS Contextualizer

**Goal:** Recalculate CVSS scores with environmental metrics to produce threat-informed, business-contextualized priorities.

## Context

This is the keystone task of the project. Everything converges here: CVSS technical scoring, asset criticality from 1x00, kill chain positioning from 1x01 and exploit availability from earlier in this project.

Open the NIST CVSS Calculator one more time.

## Instructions

For the 8 most important "Actionable" findings from your triage (T16), recalculate the priority using 4 contextual factors:

For each finding:

```
Finding [ID] - [CVE or description]
CVSS Base Score: [From scan/NVD]

Factor 1 - Asset Criticality (from 1x00):
  Asset: [Name]
  CIA Rating: [From 1x00 Criticality Matrix]
  Criticality Impact on Priority: [Does the asset's importance raise or lower the urgency?]

Factor 2 - Kill Chain Position (from 1x01):
  Appears in Kill Chain(s): [Which ones from 1x01 T10? Or "None identified"]
  Chain Role: [Is this the initial access point, a lateral movement enabler, or a final target?]
  Kill Chain Impact on Priority: [Does the chain position raise or lower urgency?]

Factor 3 - Exploitability (from T4):
  Exploitability Score: [1-5 from T4]
  CISA KEV: [Yes/No]
  Exploit Impact on Priority: [Does exploit availability raise or lower urgency?]

Factor 4 - Compensating Controls (from 1x00):
  Existing Controls: [From 1x00 Control Matrix - does anything partially mitigate this?]
  Control Impact on Priority: [Do existing controls lower the urgency?]

Environmental CVSS (recalculated):
  Environmental Metrics Applied: [What adjustments did you make on the NIST Calculator?]
  Adjusted Score: [New score]

Final Priority: [Critical/High/Medium/Low]
Final Justification: [One paragraph synthesizing all 4 factors]
```

After all 8, produce a **Priority Comparison Table** showing: Finding | CVSS Base | Adjusted Priority | Change Direction (higher/same/lower). Highlight any finding where the adjusted priority differs significantly from the base CVSS.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `17-cvss_contextualizer.md`
