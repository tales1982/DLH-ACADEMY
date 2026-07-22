# 14. The Network Posture

**Goal:** Quantify how the flat network architecture amplifies the effective risk of every individual vulnerability.

## Context

The flat network is not a finding in the scan report. It is the finding underneath every finding. Every vulnerability in the scan is more dangerous because of the flat network. A SQL injection on `billing-srv-01` would be contained to the billing segment in a segmented network. In MedDefense's flat network, it is a stepping stone to the EHR, the domain controller and the medical devices.

## Instructions

Select 3 CVEs from the scan that affect different systems. For each one, perform a segmentation impact analysis:

```
CVE: [ID]
Host: [Affected system]
CVSS Base Score: [From scan]

Scenario A: Current (flat network):
  Who can reach this vulnerability: [All 10.10.0.0/16 - describe the scope]
  What the attacker can reach AFTER exploitation: [All other systems, describe the impact radius]
  Effective Risk: [Your assessment]

Scenario B: Hypothetical (segmented network):
  Who can reach this vulnerability: [Only systems in the same VLAN]
  What the attacker can reach AFTER exploitation: [Only systems in the same VLAN, unless they can pivot through a firewall]
  Effective Risk: [Your assessment]

Risk Amplification Factor: [How much does the flat network increase the real-world risk of this specific CVE?]
```

After the 3 analyses, produce a **Network Posture Summary** (one paragraph): What is the aggregate risk amplification effect of the flat network across the entire scan report? Why is network segmentation arguably more impactful than patching any single CVE?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `14-network_posture.md`
