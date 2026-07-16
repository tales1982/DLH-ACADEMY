# 15. The Gap-Threat Correlation

**Goal:** Cross-reference the gaps identified in 1x00 with the threats identified in 1x01 to produce an updated, threat-informed prioritization.

## Context

Your posture assessment in 1x00 ranked gaps by looking inward: how critical is the asset, how exposed is it, what controls are missing. That was necessary but incomplete. Now you have the other half: who would exploit each gap, with what technique and to what end.

A gap on a system that no attacker would target is still a gap, but it is not urgent. A gap on a system that sits on every kill chain you have built is an emergency. This task recalibrates your priorities.

## Instructions

Take your Gap Analysis from 1x00 (Task 12, as updated in Task 13). For each gap, add the threat context:

```
Gap ID: [From 1x00]
Gap Description: [Brief]
Original Risk Level: [From 1x00]
Threat Actors: [Which actor types from T6 would exploit this gap?]
Kill Chains: [Which of the 5 kill chains from T10 pass through this gap?]
Scenarios: [Which of the 3 scenarios from T14 depend on this gap?]
Updated Risk Level: [Same / Upgraded / Downgraded]
Justification: [Why the level changed or stayed the same, referencing threat evidence]
```

After the full correlation, produce:

- **Re-prioritized Gap List:** The gaps ranked by their new threat-informed risk level. Highlight any gaps that moved up or down.
- **The Critical Three:** Identify the 3 gaps that appear most frequently across kill chains and scenarios. These are the gaps whose closure would disrupt the greatest number of attack paths.
- **The Surprise:** Identify at least 1 gap that you rated as Medium or Low in 1x00 but that, after threat analysis, should be upgraded. Explain what changed in your understanding.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `15-gap_threat_correlation.md`
