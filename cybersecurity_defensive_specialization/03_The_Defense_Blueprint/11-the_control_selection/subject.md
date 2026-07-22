# 11. The Control Selection

**Goal:** Select and justify specific security controls for each risk in the register, mapping every choice to CIS Controls and NIST CSF.

## Context

The Risk Register tells you WHAT risks exist. Now you decide WHAT to do about each one. Every control you select must satisfy three criteria: it must reduce the specific risk it targets (effectiveness), it must be affordable within the budget (efficiency) and it must map to a recognized framework so auditors can verify it (traceability).

## Instructions

For each of the 10 risks in your Risk Register that has a treatment of "Mitigate," select one or more specific controls. For each control:

```
Risk: [RISK-ID from T10]
Selected Control: [Specific name/description]
CIS Control Mapping: [Control number and safeguard ID]
NIST CSF Mapping: [Function.Category, e.g., PR.AC]
Control Type: [Preventive / Detective / Corrective / Compensating]
Control Category: [Technical / Administrative / Operational / Physical]
Implementation Cost: [From T7 analysis]
Expected Risk Reduction: [Quantified where possible]
Dependencies: [Does this control require another control to be in place first?]
```

After the individual selections, produce a **Control Dependency Map**: a text diagram showing which controls must be implemented before others. For example, network segmentation must precede medical device isolation. SIEM must precede 24/7 monitoring.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `11-control_selection.md`
