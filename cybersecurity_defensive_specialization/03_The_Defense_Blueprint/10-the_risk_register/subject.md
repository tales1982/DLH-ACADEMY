# 10. The Risk Register

**Goal:** Build the formal Risk Register that will serve as the operational backbone of MedDefense's security program.

## Context

Every deliverable you have produced so far — the gap analysis, the threat landscape, the vulnerability assessment, the ALE calculations — feeds into one master document: the Risk Register. This is not a summary. It is the living governance instrument that tracks every identified risk through its lifecycle: identification, scoring, treatment, monitoring and review.

A professional Risk Register is the document the CISO opens when the Board asks, "What keeps you up at night?" It is reviewed monthly, updated when new threats emerge and when controls are deployed. It is the single source of truth for the security program's risk posture.

## Instructions

Build a MedDefense Risk Register containing your top 10 risks. Use the following fields for each entry:

| Field | Description |
|---|---|
| Risk ID | Sequential identifier (RISK-001, RISK-002, etc.) |
| Risk Description | One sentence describing the risk event |
| Risk Category | Strategic / Operational / Compliance / Financial |
| Threat Source | Actor type from 1x01 |
| Vulnerability | Finding ID from 1x02 |
| Affected Asset(s) | From 1x00 Asset Registry |
| Likelihood | 1-5 scale with definition |
| Impact | 1-5 scale with definition |
| Inherent Risk Score | Likelihood × Impact |
| ALE | From T5/T6 calculations (where available) |
| Risk Owner | Specific person/role at MedDefense |
| Treatment Decision | Mitigate / Transfer / Accept / Avoid |
| Treatment Justification | Why this decision, in one sentence |
| Planned Control(s) | Specific controls from T7 |
| Residual Risk | After planned controls are applied |
| KRI | Key Risk Indicator that would signal this risk is increasing |
| Review Date | When this risk entry will be reassessed |

After the register, write a **Risk Register Governance Note** (one paragraph): Who maintains this register at MedDefense? How often is it reviewed? What triggers an out-of-cycle review? What happens when a KRI threshold is breached?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `10-risk_register.md`
