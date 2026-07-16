# 5. The Missing Pieces

**Goal:** Identify systemic gaps in a control framework by analyzing what is absent, not just what is present.

## Context

You step back and look at your Control Summary Matrix from Task 4. Some cells are populated. Others are empty. The empty cells are not accidents. They represent systematic blind spots in MedDefense's security posture.

James Chen looks over your shoulder at the matrix:

> "See those gaps? That's what keeps me up at night. We have locks on some doors but no cameras to see who's walking through. We have a firewall but nothing that tells us if someone gets past it. We have a backup process but no tested recovery procedure."

## Instructions

Analyze your Control Summary Matrix (Task 4) and identify at minimum **6 significant control gaps**. A gap is significant when:

- A critical asset has no control of a specific function (e.g., the EHR server has preventive controls but no detective controls).
- An entire function is absent from a category (e.g., no Administrative Corrective controls exist).
- A control exists but does not cover a critical asset (e.g., antivirus is deployed on servers but not on workstations).

For each gap, document:

```
Gap ID: [G-001, G-002, etc.]
Gap Description: [What is missing -- be specific]
Category x Function Missing: [e.g., "Technical Detective"]
Affected Asset(s) or Zone: [What is left unprotected]
Risk if Unaddressed: [What could happen -- connect to CIA pillars]
Evidence: [Why you know this is missing -- reference your matrix, artifacts or observations]
```

At the end, answer this question in 2-3 sentences:

> Looking at your gaps as a whole, what pattern do you see? Is MedDefense's security posture more prevention-oriented or detection-oriented? What does this imply about their ability to respond to an incident that bypasses preventive controls?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `5-control_gaps.md`
