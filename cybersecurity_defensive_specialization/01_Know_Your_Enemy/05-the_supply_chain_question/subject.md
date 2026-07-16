# 5. The Supply Chain Question

**Goal:** Map and evaluate third-party risk exposure across MedDefense's vendor ecosystem.

## Context

In December 2020, SolarWinds taught the world a lesson that most organizations still have not fully internalized: your security is only as strong as your least secure vendor. MedDefense does not operate in isolation. It depends on a network of technology providers, service contractors and building managers, each with some level of access to MedDefense's environment or data. If any of them is compromised, MedDefense inherits the consequences.

James Chen's question is specific:

> "If MedTech Solutions gets breached tomorrow, what happens to us? They have maintenance access to our EHR server. What exactly can they reach?"

## Instructions

Using your onboarding packet (1x00 T0), vendor contracts and Asset Registry (1x00 T7), map the third-party risk exposure for 5 critical vendors. For each one:

```
Vendor: [Name]
Service: [What they provide]
Access Type: [Network / Data / Physical / Application - be specific]
Access Scope: [What exactly can they reach? Which systems, which data?]
Compromise Scenario: [If this vendor is breached, what is the attack path to MedDefense? Be specific.]
Existing Controls: [What limits this vendor's access? Reference 1x00 Control Matrix]
Risk Assessment: [Critical / High / Medium / Low - justify]
```

### The 5 Vendors to Assess

1. **MedTech Solutions:** EHR maintenance provider (annual contract $145,000, SLA 4hr response, direct server access for maintenance).
2. **Microsoft:** O365 E3 (organization-wide email, SharePoint, OneDrive; manages identity if Entra ID is used).
3. **Sophos:** Endpoint protection (agent installed on all managed endpoints, capability to push updates and configurations).
4. **Siemens:** MRI scanner manufacturer (periodic maintenance of the Windows XP workstation, firmware updates).
5. **Greenfield Building Management:** HQ office building (manages the network infrastructure in the building; MedDefense has a VLAN on their network).

After the 5 individual assessments, produce a **Supply Chain Risk Summary** (one paragraph): Which single vendor compromise would cause the most damage to MedDefense, and why? What is the one control MedDefense should implement first to reduce supply chain risk across all vendors?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `5-supply_chain_assessment.md`
