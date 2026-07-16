# 13. The ATT&CK Mapping

**Goal:** Map realistic attack sequences to MITRE ATT&CK tactics, building fluency with the framework that every SOC uses daily.

## Context

MITRE ATT&CK is the shared language of the security industry. When a SOC analyst says "we detected T1566.001," every security professional in the world knows they are talking about a spear phishing attachment. When an incident report maps an attack to ATT&CK tactics, any team can understand the sequence without reading a narrative.

You do not need to memorize the entire framework. You need to be able to read an attack description and map each step to the correct tactic. The techniques will come with experience. The tactics are what matter now.

**The 14 ATT&CK Enterprise Tactics** (in attack sequence order): Reconnaissance, Resource Development, Initial Access, Execution, Persistence, Privilege Escalation, Defense Evasion, Credential Access, Discovery, Lateral Movement, Collection, Command and Control, Exfiltration, Impact.

**Provided Files:** `attack-scenarios-attck.txt` (2 detailed attack narratives against MedDefense, 9 and 8 steps respectively — Scenario Alpha: "Operation Flatline" ransomware campaign; Scenario Beta: "The Quiet Departure" insider data theft)

## Instructions

For each of the 2 attack scenarios:

1. Read the full narrative.
2. For each numbered step, identify the ATT&CK tactic it maps to.
3. For each step, identify the most likely ATT&CK technique (navigate to attack.mitre.org and find the specific technique ID). If multiple techniques could apply, choose the most specific one and note alternatives.

Format:

```
Scenario [Alpha/Beta]:
Step [N]: [Brief description from narrative]
  Tactic: [ATT&CK tactic name]
  Technique: [Technique name + ID, e.g., "Phishing: Spearphishing Attachment (T1566.001)"]
  MedDefense Factor: [What about MedDefense's environment enables this step?]
```

After both mappings, write an **ATT&CK Coverage Assessment** (one paragraph): Looking at both scenarios, which ATT&CK tactics appear in both attacks? What does this tell you about where MedDefense needs detection capability most urgently?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `13-attck_mapping.md`
