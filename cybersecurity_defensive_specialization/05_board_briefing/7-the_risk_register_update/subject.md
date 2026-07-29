# 7. The Risk Register Update

**Goal:** Update the MedDefense Risk Register with the Crimson Tide threat, demonstrating that a Risk Register is a living document that responds to new intelligence.

## Context

Your Risk Register from 1x03 T10 had a ransomware entry. Crimson Tide is not just "ransomware." It is a specific campaign with specific TTPs targeting MedDefense's specific profile. The existing entry must be updated, and a new entry for the FortiGate vulnerability must be added.

## Instructions

### Part 1 — Update Existing Entry

Find the ransomware risk entry in your 1x03 Risk Register. Update it with:

- New threat source: Crimson Tide (CT) group
- Updated likelihood: Using the new ARO from T5
- Updated ALE
- Updated treatment justification: Does the current treatment decision still hold?
- New KRI: What specific indicator would signal that Crimson Tide is targeting MedDefense?

### Part 2 — New Entry: FortiGate Vulnerability

Add a new risk entry (`RISK-NEW-001`) for CVE-2023-27997 on the FortiGate:

- Complete all fields from the 1x03 Risk Register template
- Treatment decision: The FortiGate support contract costs $2,400 to renew. The patch requires the contract. Calculate whether the patching cost is justified against the ALE.

### Part 3 — Register Governance Test

The Risk Register governance note from 1x03 defined review triggers. Does the Crimson Tide advisory qualify as an out-of-cycle review trigger? Quote the trigger criteria and explain why this event meets them.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x05_board_briefing`
- **File:** `7-risk_register_update.md`
