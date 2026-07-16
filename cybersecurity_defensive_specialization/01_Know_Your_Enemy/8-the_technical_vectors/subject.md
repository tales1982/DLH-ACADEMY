# 8. The Technical Vectors

**Goal:** Identify and analyze the technical (non-human) attack vectors specific to MedDefense using concrete evidence from the network scan and posture assessment.

## Context

Social engineering gets you in the door. Technical vectors keep you in the building. The network scan from Project 1x00 revealed a landscape of exposed services, outdated software and absent controls that constitute a catalog of technical entry points and lateral movement opportunities.

The Sec+ framework (2.2) defines technical vectors as: vulnerable software, unsupported systems, unsecure networks (wireless, wired, Bluetooth), open service ports, default credentials and removable devices. Each of these exists in the MedDefense environment.

## Instructions

Using the Network Scan Summary and your posture assessment artifacts from Project 1x00, produce a Technical Vector Assessment covering 6 vector categories. For each:

```
Vector Category: [Sec+ 2.2 term]
MedDefense Evidence: [Specific system, port, configuration or gap that creates this vector. Reference network scan data or 1x00 findings.]
Affected Asset(s): [Which systems are exposed through this vector?]
Actor Most Likely to Exploit: [Reference Threat Actor Matrix from T6]
Exploitation Scenario: [In 2-3 sentences, how would an attacker use this vector against MedDefense?]
Current Protection: [What control from 1x00 partially addresses this, if any?]
Gap Reference: [Which gap from 1x00 enables this vector?]
```

### The 6 Categories to Cover

1. **Vulnerable Software:** Apache 2.4.29 on `billing-srv-01`, Ubuntu 18.04 LTS EOL, any other identified outdated software
2. **Unsupported Systems:** Windows XP on MRI workstation, Windows Server 2012 R2 on `print-srv-01`
3. **Open Service Ports:** MySQL 3306 and PostgreSQL 5432 accessible network-wide, RDP on select workstations, medical IoT web interfaces
4. **Default Credentials:** PACS shared account, BD Alaris pump interfaces, any other identified default or shared credentials
5. **Unsecure Networks:** Flat network (no segmentation), Westside consumer router, WiFi isolation uncertainty
6. **Removable Devices / Unmanaged Endpoints:** No USB restriction GPO, unmanaged iPads, shadow IT devices

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `8-technical_vectors.md`
