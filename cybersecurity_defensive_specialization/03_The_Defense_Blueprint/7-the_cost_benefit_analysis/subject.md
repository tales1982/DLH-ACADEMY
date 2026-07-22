# 7. The Cost-Benefit Analysis

**Goal:** Evaluate 8 proposed security controls using formal cost-benefit analysis to determine which investments are financially justified.

## Context

Security controls cost money. Some are worth every cent. Some cost more than the risk they mitigate. The CFO does not care about "best practices." The CFO cares about return on investment.

A control is financially justified when: **(ALE before control) minus (ALE after control) is greater than (annual cost of the control).**

If the control costs more than the risk reduction it provides, the rational decision is to accept the risk or find a cheaper control. This is not an opinion. It is math.

## Instructions

Evaluate the following 8 proposed controls for MedDefense. Some are straightforward wins. Some are borderline. At least one is not cost-justified at all.

For each control, you will need to estimate costs and ALE impacts. Use your ALE calculations from Task 6 where applicable, and make reasonable estimates with stated assumptions for the rest.

```
Control [N]: [Name]
CIS Control Reference: [Number]
Annual Cost: [$ estimate with breakdown: license + labor + maintenance]
Risk(s) Addressed: [Which risk(s) from T6]
ALE Reduction: [$ estimate: ALE before - ALE after]
Net Value: ALE Reduction - Annual Cost = [$]
Verdict: [Justified / Marginal / Not Justified]
Recommendation: [Implement / Defer / Reject, with one-sentence reasoning]
```

**The 8 proposed controls:**

1. Network segmentation (VLAN implementation for server, workstation, medical device and guest zones)
2. MFA deployment on VPN and administrative accounts (using existing O365 E3 licenses)
3. Enterprise SIEM deployment (Wazuh, open-source, labor cost only)
4. Offsite backup replication (cloud immutable storage, AWS S3 Glacier)
5. Endpoint Detection and Response upgrade (from Sophos basic to Sophos Intercept X, all endpoints including servers)
6. Dedicated firewall for Westside Clinic (replacing the consumer router)
7. 24/7 Security Operations Center staffing (outsourced managed SOC)
8. Full medical device network isolation with dedicated monitoring

After all 8, produce a **Cost-Benefit Summary Table** ranked by Net Value (highest first) and identify which controls fit within the $120,000 annual budget.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `7-cost_benefit_analysis.md`
