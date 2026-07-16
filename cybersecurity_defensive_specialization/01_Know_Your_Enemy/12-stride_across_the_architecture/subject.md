# 12. STRIDE Across the Architecture

**Goal:** Apply STRIDE at surface level to three additional critical systems to build a broad threat awareness across the MedDefense environment.

## Context

The EHR is the crown jewel, but it is not the only system an attacker cares about. Active Directory controls authentication for every user and service. The PACS server stores medical images that are essential for diagnosis. The network infrastructure is the fabric that connects everything.

A quick STRIDE pass on each of these systems identifies the most critical threats without the full depth of the EHR analysis. Think of it as triage: identify the most dangerous threat in each STRIDE category, then move on.

## Instructions

Apply STRIDE to 3 additional systems. For each system, identify one threat per STRIDE category (the most critical one). Format:

```
System: [Name]
Architecture Notes: [Brief: what components, what connections, from 1x00]
```

| STRIDE | Threat | Impact | Severity |
|---|---|---|---|
| S | ... | ... | C/H/M/L |
| T | ... | ... | C/H/M/L |
| R | ... | ... | C/H/M/L |
| I | ... | ... | C/H/M/L |
| D | ... | ... | C/H/M/L |
| E | ... | ... | C/H/M/L |

`Top Threat: [Which one is most dangerous for this system and why?]`

### The 3 Systems

1. **PACS / Medical Imaging** (`pacs-srv-01` + MRI workstation running Windows XP + network path to radiology workstations). Consider: shared credentials, legacy OS, unencrypted image data, flat network access.

2. **Active Directory** (`ad-dc-01` + `ad-dc-02`). Consider: it controls authentication for the entire organization, password policy weaknesses, no MFA, what happens if a DC is compromised.

3. **Network Infrastructure** (FortiGate firewall + core switch + Westside consumer router + VPN tunnels). Consider: the FortiGate is the only perimeter defense, the Westside router is consumer-grade, the VPN rules are too permissive, there is no internal segmentation.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `12-stride_architecture.md`
