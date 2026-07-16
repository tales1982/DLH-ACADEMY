# 17. The What-If

**Goal:** Demonstrate deep understanding of threat landscape dynamics by analyzing how specific business changes would reshape MedDefense's threat profile.

## Context

A threat landscape is not static. It shifts with every business decision, every technology change, every public event. The ability to anticipate how threats evolve, before they materialize, separates reactive security from proactive security.

## Instructions

Analyze 3 hypothetical changes to MedDefense's business or environment. For each, produce a structured impact assessment.

**Scenario A:** MedDefense partners with a university to launch a clinical trial for an experimental cardiac treatment. The trial involves 500 patients, proprietary research protocols and collaboration with 3 international research institutions. Trial data is stored on a new dedicated server at MedDefense Central.

**Scenario B:** MedDefense migrates its EHR system from on-premises (`ehr-srv-01` / `ehr-db-01`) to a cloud-hosted SaaS model provided by MedTech Solutions. The on-premises servers are decommissioned. All EHR access goes through the cloud.

**Scenario C:** A regional news outlet publishes an investigative article revealing that MedDefense was the victim of the January ransomware attack on `billing-srv-01`. The article includes quotes from former patients expressing concern about their data. The story is picked up by national healthcare media.

For each scenario, answer:

- **New Threat Actors:** Does this change attract new types of adversaries? Which ones and why?
- **Changed Vectors:** Which attack vectors become more or less relevant?
- **Shifted Priorities:** How do the Top 5 threats from T16 change? Do any move up or down?
- **New Gaps:** Does this create any new security gaps that did not exist before?
- **Net Assessment:** Does MedDefense's overall threat exposure increase, decrease or shift? (One sentence verdict with reasoning.)

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `17-threat_evolution.md`
