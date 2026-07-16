# 2. The Ransomware Dossier

**Goal:** Analyze the operational model of a ransomware-as-a-service group and evaluate its specific threat to MedDefense.

## Context

Three regional hospitals within 200 miles of MedDefense have been hit by ransomware in the past 8 months. Two paid. The third lost 3 weeks of data and diverted ambulances for 11 days. James Chen is not sleeping well.

Ransomware is not a monolithic threat. It is an industry. Developers build the tools. Affiliates deploy them. Initial access brokers sell the entry points. Negotiators handle the extortion. Understanding this ecosystem is the difference between a generic "ransomware is bad" slide and a specific, actionable assessment of MedDefense's exposure.

## Provided Files

- `blackreef-ransomware-profile.txt` (a detailed profile of a fictional but realistic RaaS group)

## Instructions

Read the BlackReef profile. Then produce a **Ransomware Threat Assessment for MedDefense** with four sections:

1. **Operational Model Summary:** Describe how BlackReef operates. Cover: the RaaS model (developer vs affiliate roles), the attack lifecycle (from initial access to extortion), and the double extortion mechanism. Keep it factual and concise.
2. **Healthcare Targeting Logic:** Using the BlackReef profile AND the intelligence dossier from Task 0, explain in one substantive paragraph why hospitals are structurally ideal targets for ransomware groups. Identify at least 3 specific factors.
3. **MedDefense Exposure Assessment:** Reference your Gap Analysis from Project 0x00 directly. Identify the 4 gaps that a BlackReef-style group would exploit, in order of their likely attack sequence. For each gap: name the gap (with Gap ID if possible), explain how it enables the next step in the attack chain, and assess what happens if that gap is not closed.
4. **Likelihood Assessment:** On a scale of Critical / High / Medium / Low, how likely is it that MedDefense faces a ransomware attack within the next 12 months? Justify your assessment using sector statistics (from the dossier) and MedDefense-specific factors (from your posture assessment).

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `2-ransomware_assessment.md`
