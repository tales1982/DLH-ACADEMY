# 9. The Data Map

**Goal:** Identify, classify and trace the flow of sensitive data across its lifecycle states to identify protection gaps.

## Context

James Chen comes back from a meeting with the hospital's legal counsel:

> "Legal just reminded me that we handle protected health information for over 50,000 patients, plus financial data, plus employee records. They want to know: where exactly does our sensitive data live, how does it move, and is it protected at every step?"

Data does not stay in one place. A patient's medical record is **at rest** in the EHR database, **in transit** when a physician accesses it from the nurse station over the network, and **in use** when it is displayed on the screen. Each state requires different protections, and a gap in any state is a gap in the entire chain.

## Data Classification Levels

| Level | Definition | Example |
|---|---|---|
| **Restricted** | Highest sensitivity. Unauthorized access causes severe harm. Regulatory penalties. | Patient medical records, SSNs, credit card numbers |
| **Confidential** | Sensitive internal information. Unauthorized access causes significant harm. | Employee salaries, strategic plans, vendor contracts |
| **Internal** | Not for public disclosure but limited impact if exposed. | Internal memos, org charts, meeting notes |
| **Public** | Intended for public consumption. No harm if disclosed. | Website content, public phone numbers |

## Instructions

Identify the major data categories present at MedDefense. For each, document:

```
Data Category | Classification | At Rest (where) | In Transit (how) | In Use (by whom, on what) | Current Protection | Protection Gaps
```

Cover a minimum of **7 data categories** (examples: patient medical records, medical imaging data, financial/billing data, employee HR records, system credentials, audit logs, research/clinical trial data).

For the **Protection Gaps** column, identify specific weaknesses in how data is protected in each state. Reference your earlier findings where relevant (e.g., the nurse station with the unlocked EHR session from Task 3 is a gap in "data in use" protection for patient records).

After the table, write a **Data Risk Summary** (one paragraph) answering: What is MedDefense's most significant data protection weakness? Consider which data category, in which state, has the widest protection gap relative to its classification level.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `9-data_map.md`
