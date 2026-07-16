# 3. The Insider File

**Goal:** Distinguish malicious from negligent insider threats, identify behavioral indicators and connect each scenario to existing control gaps.

## Context

Not every threat comes through the firewall. James Chen brings this up over coffee:

> "When the Board hears 'cybersecurity,' they picture a hoodie-wearing hacker in a dark room. They do not picture a billing clerk who copies patient records to a USB drive because she's angry about being passed over for a promotion. But our incident log from last year tells a different story."

The insider threat is particularly dangerous in healthcare because clinical staff need broad access to patient data to do their jobs. The challenge is not restricting access — it is detecting when legitimate access becomes illegitimate use.

## Instructions

You are given 5 insider scenarios drawn directly from the MedDefense environment. For each one, produce a structured analysis.

### The Scenarios

**Scenario 1 — The Shared Login:** The Radiology department uses a shared account ("raduser/radiology1") for the PACS workstation. Multiple technicians use the same credentials throughout the day. Nobody logs out between patients.

**Scenario 2 — The Ghost Account:** An IT support contractor's VPN account remained active for 47 days after their contract ended. Network logs show the account authenticated 3 times during off-hours in the weeks after termination. *(Reference: this mirrors Incident F from your 1x00 incident analysis.)*

**Scenario 3 — The Personal NAS:** Dr. Patel in Cardiology connected a personal NAS device to his office network port. He stores research data and "convenience copies" of patient files he consults frequently. The NAS is not encrypted, not backed up and not visible to IT. *(Reference: the shadow IT finding from 1x00 Task 11.)*

**Scenario 4 — The Curious Employee:** A registration clerk at the front desk accesses the EHR records of a local politician who was treated at MedDefense Central. She does not modify anything. She tells a friend about the visit. The friend posts it on social media.

**Scenario 5 — The Overworked Admin:** A sysadmin, overwhelmed by tickets, writes a script to automate password resets. The script stores Active Directory admin credentials in plaintext in a file on his desktop. He shares the script with a colleague via email so they can "help with the backlog."

### For Each Scenario, Deliver

```
Scenario [N]:
  Classification: [Malicious / Negligent - justify]
  Behavioral Indicators: [What observable signs could have flagged this before damage occurred? List 2-3]
  Existing Control (from 1x00): [Which control from your Control Matrix covers or should cover this? If none, say so]
  Gap Exploited (from 1x00): [Which gap from your Gap Analysis enabled this scenario? Reference Gap ID if possible]
  Recommended Mitigation: [One specific control - Technical or Administrative - that would reduce this risk]
```

After the 5 individual analyses, write a **Pattern Assessment** (one paragraph): What systemic weakness at MedDefense makes insider threats particularly dangerous? Connect your answer to at least 2 findings from Project 1x00.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `3-insider_assessment.md`
