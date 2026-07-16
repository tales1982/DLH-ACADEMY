# 9. The Vector-to-Asset Matrix

**Goal:** Produce a systematic cross-reference showing which attack vectors can reach which critical assets, creating a complete threat exposure map.

## Context

Individual vectors are data points. Cross-referenced vectors are intelligence. A phishing email alone is a nuisance. A phishing email that delivers credentials for the flat network that reaches the EHR database that contains 50,000 patient records — that is a kill chain waiting to happen.

## Instructions

Produce a Vector-to-Asset Matrix that crosses attack vectors (rows) with critical assets (columns).

**Columns (Assets):** Use your Top 5 Critical Assets from 1x00 Task 8, plus Medical IoT and Active Directory (7 columns total).

**Rows (Vectors):** Use at minimum these 8 vectors:

1. Phishing / Spear Phishing
2. VPN Exploit
3. Default / Shared Credentials
4. Vulnerable Software Exploit
5. Supply Chain Compromise
6. Insider (Malicious)
7. Insider (Negligent)
8. Physical Access

For each cell where a viable path exists, write a one-sentence attack path describing how that vector reaches that asset. Example: *"Phishing → clinician credentials → flat network → PostgreSQL 5432 open → ehr-db-01 patient data."*

Leave cells empty where no viable direct or indirect path exists. You should fill a minimum of 20 cells.

After the matrix, identify the **3 most connected assets** (assets reachable by the most vectors) and the **3 most versatile vectors** (vectors that reach the most assets). Explain in one sentence each why these represent the highest-priority intersections for MedDefense.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `9-vector_asset_matrix.md`
