# 8. The Criticality Assessment

**Goal:** Evaluate the criticality of each asset category using CIA-based analysis, calibrated to the specific operational context of a healthcare organization.

## Context

> "Not all assets are equal," says James Chen. "If the cafeteria's digital menu board goes down, nobody dies. If the EHR goes down, physicians are prescribing blind. I need you to tell me which assets matter most and why, in terms the Board will understand."

## Instructions

Using your Asset Registry (Task 7), group assets into logical categories (e.g., EHR System, PACS/Imaging, Billing Infrastructure, Network Core, Medical IoT, Endpoints Clinical, Endpoints Administrative, Physical Security Systems). You should have 8-10 categories.

For each category, evaluate criticality on each CIA pillar using a 4-level scale:

| Level | Definition |
|---|---|
| **Critical** | Compromise directly threatens patient safety, causes regulatory violation or halts clinical operations |
| **High** | Compromise causes significant operational disruption, financial loss or data exposure |
| **Medium** | Compromise causes moderate disruption, recoverable within standard procedures |
| **Low** | Compromise has minimal operational or security impact |

Produce an **Asset Criticality Matrix**:

```
Asset Category | Confidentiality | Integrity | Availability | Overall Criticality | Justification
```

The **Overall Criticality** is the highest rating across the three pillars. The **Justification** must explain the rating in the context of MedDefense's operations. Generic justifications score zero.

> "Contains patient data" is not enough. "Contains protected health information for 50,000 active patients; a breach triggers mandatory regulatory notification, potential litigation and reputational damage estimated in the millions" is what a Board needs to hear.

After the matrix, identify and rank the **Top 5 Most Critical Assets** with a brief paragraph for each explaining why it holds that position.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `8-criticality_assessment.md`
