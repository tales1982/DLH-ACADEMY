# 10. The Kill Chains

**Goal:** Construct complete attack chains from initial access to final impact for the 5 most critical threat paths against MedDefense.

## Context

An attack is never a single event. It is a sequence: an entry, a foothold, a progression, an objective. Each step exploits a different weakness. Each step is also a point where the chain can be broken. Understanding kill chains is how you stop thinking about threats as abstract categories and start thinking about them as operational sequences with specific intervention points.

## Instructions

Select the 5 most critical paths from your Vector-to-Asset Matrix (Task 9). For each, construct a complete kill chain:

```
Kill Chain #[N]: [Descriptive title]
Threat Actor: [Type from T6, with profile reference]
Target Asset: [From 1x00 Asset Registry]
Expected Impact: [Business consequence + CIA pillar]

Step 1 - Initial Access:
  Vector: [Specific vector]
  Surface: [External / Internal / Human]
  Detail: [How the attacker gets their first foothold]

Step 2 - Establish Foothold:
  Action: [What the attacker does to maintain access]
  MedDefense Weakness: [What enables this step]

Step 3 - Lateral Movement / Escalation:
  Action: [How the attacker moves toward their target]
  MedDefense Weakness: [What enables this step, the flat network will appear often]

Step 4 - Objective Execution:
  Action: [What the attacker does when they reach the target]
  Data/System Affected: [Specific]

Step 5 - Impact:
  Business Impact: [Clinical, financial, regulatory, reputational]
  CIA Pillars: [Which are affected and how]

Gaps Exploited: [List specific Gap IDs from 1x00]
Break Points: [At which step(s) could a control have interrupted this chain? What control?]
```

The **Break Points** section is critical. It connects the threat analysis to defensive action. For each kill chain, identify at least 2 steps where a control (existing or missing) could interrupt the sequence.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `10-kill_chains.md`
