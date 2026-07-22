# 3. The Gap-to-Framework Bridge

**Goal:** Connect every significant gap from prior projects to a specific framework control, transforming raw findings into structured, framework-aligned action items.

## Context

You have gaps from 1x00, threats from 1x01, vulnerabilities from 1x02, and framework scores from T1 and T2. Right now, they exist in separate documents. This task connects them into a single traceability chain: **Gap → Vulnerability → Threat → Framework Control → Recommended Action.**

This bridge is what makes a strategy credible. When the Board asks, "Why should we implement network segmentation?", the answer is not "because it is a best practice." The answer is: "Because Gap GAP-003 (flat network) enables Kill Chain #1 (ransomware), is exploited by Vulnerability Finding 003 (PostgreSQL unrestricted access), maps to CIS Control 12 (Network Infrastructure Management) at IG1, and closing it reduces our ransomware ALE by an estimated $180,000 per year."

## Instructions

Select the 8 highest-priority gaps from your prior work (use the re-prioritized list from 1x01 T15 and 1x02 findings). For each:

- **Gap Reference:** [ID from 1x00/1x02]
- **Description:** [One line]
- **Vulnerability Evidence:** [Finding ID(s) from 1x02]
- **Threat Context:** [Actor type + kill chain from 1x01]
- **NIST CSF Function:** [Which function does this gap fall under?]
- **CIS Control:** [Which CIS Control addresses this gap? Include the control number.]
- **Recommended Action:** [One sentence: what MedDefense should do]

After all 8, produce a **Traceability Summary Table** showing the full chain in a single view.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `3-gap_framework_bridge.md`
