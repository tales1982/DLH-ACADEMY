# 11. STRIDE on the EHR

**Goal:** Apply the STRIDE threat model in depth to MedDefense's most critical system to systematically identify every category of threat.

## Context

STRIDE is a structured approach to threat identification. Instead of brainstorming threats randomly, you walk through six categories systematically, ensuring nothing is missed. Applied to a specific system with a known architecture, it produces a comprehensive threat inventory that no amount of ad-hoc thinking would match.

The EHR system is MedDefense's most critical asset. It consists of `ehr-srv-01` (application server), `ehr-db-01` (PostgreSQL database), the clinical workstations that access it and the network paths between all of them. You know the architecture from your 1x00 work. Now stress-test it.

**STRIDE categories:**

- **Spoofing:** Pretending to be someone or something else
- **Tampering:** Modifying data or code without authorization
- **Repudiation:** Denying an action occurred when it did
- **Information Disclosure:** Exposing data to unauthorized parties
- **Denial of Service:** Making a resource unavailable
- **Elevation of Privilege:** Gaining capabilities beyond what was authorized

## Instructions

Apply STRIDE to the MedDefense EHR System (`ehr-srv-01` + `ehr-db-01` + clinical workstations + network connections). For each STRIDE category, identify at least 2 specific, concrete threats unique to this system in this environment.

For each threat:

```
Category: [S/T/R/I/D/E]
Threat ID: [EHR-S1, EHR-T1, etc.]
Description: [What specifically could happen, not generic, MedDefense-specific]
Attack Vector: [How would this threat be realized? Reference vectors from T8]
Impact: [What is the consequence in a clinical context?]
Existing Control: [Does anything from 1x00 Control Matrix address this? Reference Control ID]
Gap: [If no control exists, reference Gap ID from 1x00]
```

You should produce a minimum of 12 threats across the 6 categories (at least 2 per category).

After the threat inventory, write a **STRIDE Summary for EHR** (one paragraph): Which STRIDE category represents the greatest risk for this specific system and why? What makes it particularly dangerous in a healthcare context?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `11-stride_ehr.md`
