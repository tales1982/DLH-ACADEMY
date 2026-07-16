# 4. The Control Landscape

**Goal:** Identify, classify and document existing security controls using the professional dual-axis taxonomy: category (Technical / Administrative / Physical) and function (Preventive / Detective / Corrective).

## Context

James Chen sends you an email after the walk-through:

> "Good observations today. Now I need you to do the other half: document what we DO have, not just what's wrong. I've asked Sarah Park to give you access to our existing documentation. She's sending over config extracts, policy documents and anything else she can find. Put together a complete picture of our current security controls."

Security controls are the mechanisms an organization uses to protect its assets. They are classified along two axes.

### Category (what the control is made of)

- **Technical:** Implemented through technology. Firewalls, encryption, access control lists, antivirus, log monitoring.
- **Administrative:** Implemented through policies, procedures and human processes. Security training, background checks, acceptable use policies, incident response plans.
- **Physical:** Implemented in the physical world. Locks, cameras, fences, fire suppression, badge readers.

### Function (what the control does)

- **Preventive:** Stops an incident from occurring. A firewall blocking unauthorized traffic.
- **Detective:** Identifies an incident during or after it occurs. An IDS alerting on suspicious traffic.
- **Corrective:** Repairs damage or restores operations after an incident. A backup restoration procedure.

Two additional functions you will encounter:

- **Deterrent:** Discourages an attacker from attempting an action. A "Premises Under Surveillance" sign.
- **Compensating:** An alternative control used when the ideal control is not feasible. Network isolation for a system that cannot be patched.

## Provided Files

- `meddefense-controls-artifacts.txt` (contains extracts from firewall rules, SSH configuration, password policy document, antivirus status report, backup configuration, physical security contract and staff training records)

## Instructions

Review all provided artifacts. For every security control you can identify, document it in the following format:

```
Control ID: [C-001, C-002, etc.]
Control Name: [Descriptive name]
Description: [What it does, specifically]
Category: [Technical / Administrative / Physical]
Function: [Preventive / Detective / Corrective / Compensating / Deterrent]
Asset(s) Protected: [What asset or zone this control protects]
Source: [Which artifact you identified it from]
```

You must identify a minimum of 12 distinct controls from the provided artifacts. Include controls from all three categories. Do not invent controls that are not evidenced in the artifacts.

After listing all controls, produce a **Control Summary Matrix** in table format, placing the Control ID of each control in the appropriate cell. Cells that remain empty after your inventory represent potential gaps.

| | Preventive | Detective | Corrective | Compensating | Deterrent |
|---|---|---|---|---|---|
| **Technical** | | | | | |
| **Administrative** | | | | | |
| **Physical** | | | | | |

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `4-control_inventory.md`
