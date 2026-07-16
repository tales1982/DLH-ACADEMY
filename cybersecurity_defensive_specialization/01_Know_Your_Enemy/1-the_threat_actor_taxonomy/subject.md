# 1. The Threat Actor Taxonomy

**Goal:** Classify threat actors by type, attributes and motivation from observed behavior alone.

## Context

Intelligence analysts rarely know who attacked an organization at the time of investigation. What they have is behavior: what the attacker did, how they did it, what they targeted and what they left behind. From behavior, you infer the actor type. From the actor type, you predict their next move.

Frameworks define six threat actor categories: nation-state, organized crime, hacktivist, insider threat, unskilled attacker and shadow IT. Each has characteristic attributes:

- **Internal vs External:** Does the actor operate from inside or outside the organization?
- **Resources and Funding:** Does the actor have significant financial backing, or are they working with freely available tools?
- **Sophistication:** Does the actor develop custom tools and techniques, or rely on publicly available exploits?

Motivations vary: data exfiltration, espionage, service disruption, blackmail, financial gain, philosophical or political beliefs, ethical motivations, revenge, chaos, war.

## Provided Files

- `threat-actor-reports.txt` (8 anonymized intelligence reports, each 3-4 sentences describing an attack)

## Instructions

For each of the 8 reports, produce a structured classification:

```
Report [Letter]:
  Actor Type: [One of the 6 categories]
  Internal/External: [Internal / External / Could be either - justify]
  Resources: [High / Medium / Low - justify]
  Sophistication: [High / Medium / Low - justify]
  Primary Motivation: [One from the Sec+ motivation list - justify]
  Confidence Level: [How certain are you? High/Medium/Low and why]
```

For **Report G**, which is deliberately ambiguous, explain why multiple actor types could fit and which evidence would help you distinguish between them.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `1-threat_actor_taxonomy.md`
