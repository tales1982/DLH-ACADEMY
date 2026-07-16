# 14. The Three Scenarios

**Goal:** Construct 3 complete, realistic threat scenarios integrating all elements produced in this project.

## Context

Everything you have built — actor profiles, vector analysis, surface mapping, kill chains, STRIDE threats, ATT&CK mappings — converges here. You are building the scenarios that the Board will use to understand what could happen to MedDefense if the gaps are not closed.

Each scenario must be specific enough that a reader can follow the attack step by step, realistic enough that it could actually happen and connected enough to your posture assessment that every weakness exploited has a documented gap behind it.

## Instructions

Construct 3 threat scenarios against MedDefense. Each must involve a different threat actor type and a different primary vector.

- **Scenario 1 — External: Ransomware Campaign.** Actor: Organized crime / RaaS group (BlackReef profile from T2). Primary vector: Choose from your Vector-to-Asset Matrix.
- **Scenario 2 — Internal: Insider Data Exfiltration.** Actor: Malicious insider (one of the profiles from T3). Primary vector: Legitimate access abused.
- **Scenario 3 — Third Party: Supply Chain Compromise.** Actor: External attacker using a vendor as a stepping stone (from T5). Primary vector: Vendor access pathway.

For each scenario:

```
Title: [Descriptive name]
Threat Actor: [Type + profile reference from T6]
Motivation: [From Sec+ 2.1 list]
Initial Vector: [From T4/T8]
Attack Surface Exploited: [From T7 - external/internal/human]

Attack Sequence:
  Step 1: [Action + ATT&CK tactic]
  Step 2: [Action + ATT&CK tactic]
  Step 3: [...]
  Step 4: [...]
  Step 5: [...]
  (as many steps as the scenario requires)

STRIDE Categories Triggered: [Which STRIDE threats from T11/T12 does this scenario activate?]
MedDefense Assets Impacted: [From Asset Registry]
Business Impact: [Clinical / Financial / Regulatory / Reputational - be specific]
Gaps Exploited: [List Gap IDs from 1x00 with brief explanation of how each is exploited]
Detection Opportunities: [At which step(s) COULD MedDefense detect this attack if it had the right controls? What would those controls be?]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `14-threat_scenarios.md`
