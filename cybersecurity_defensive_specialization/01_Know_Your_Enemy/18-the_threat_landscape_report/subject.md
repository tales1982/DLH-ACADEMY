# 18. The Threat Landscape Report

**Goal:** Produce a professional-grade Threat Landscape Report suitable for executive review and operational use.

## Context

This is the companion document to the Security Posture Assessment you produced in Project 0x00. Together, they form the complete picture: what MedDefense looks like from the inside (posture) and what it looks like from the outside (threats). The Board will read them side by side.

## Instructions

Produce a complete MedDefense Health Systems Threat Landscape Report.

### Required Structure

**1. Executive Summary** (1 page max)
- The threat landscape in 2-3 sentences
- The single most dangerous threat to MedDefense
- Top 3 recommendations
- Written for a non-technical Board

**2. Scope and Methodology**
- Intelligence sources used
- Analytical frameworks applied (STRIDE, ATT&CK, kill chain analysis)
- Connection to the Security Posture Assessment (1x00)

**3. Healthcare Sector Threat Overview**
- Why healthcare is targeted (3-4 key factors)
- Current trends and emerging threats
- Sector statistics that contextualize MedDefense's exposure

**4. MedDefense Threat Actor Profiles**
- The 6 actor types assessed, with likelihood and priority ranking
- Focus on the Top 3 with detailed profiles

**5. Attack Surface Analysis**
- External, internal and human surfaces summarized
- Key exposure points with evidence

**6. Critical Attack Paths**
- The 5 kill chains with break points
- The 3 most connected assets and 3 most versatile vectors

**7. STRIDE Analysis Summary**
- EHR deep analysis (key findings)
- PACS, AD and Network surface analysis (top threats per system)

**8. Threat Scenarios**
- The 3 scenarios in summary form (full detail in appendix)
- Business impact assessment for each

**9. Gap-Threat Correlation**
- How threats recalibrated the gap priorities from 1x00
- The Critical Three gaps and The Surprise

**10. Prioritized Recommendations**
- Top 5 threats with recommended actions
- Strategic 2-initiative recommendation
- Connection to next phase: vulnerability assessment (1x02)

### Quality Criteria

- Every finding traces back to evidence (intelligence sources, 1x00 data, framework analysis)
- Every recommendation connects to a specific threat and a specific gap
- The report is self-contained: a reader who has not seen your task deliverables must understand the conclusions
- Professional tone throughout

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `18-threat_landscape_report.md`
