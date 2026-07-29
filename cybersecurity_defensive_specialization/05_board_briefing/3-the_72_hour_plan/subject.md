# 3. The 72-Hour Plan

**Goal:** Design an emergency response plan prioritizing the actions MedDefense must take in the next 72 hours to reduce exposure to Crimson Tide.

## Context

The Security Strategy was a 6-month roadmap. Crimson Tide has compressed the timeline to 72 hours. You cannot implement the full strategy overnight. You must choose the actions that provide the maximum risk reduction in the minimum time, with the resources available right now.

The constraints are real:

- Sarah Park has 2 IT staff available tonight (plus herself)
- FortiGate firmware requires a support contract renewal ($2,400) before download
- The segmentation project requires new switch configurations (2-3 days minimum)
- Backup isolation can be done tonight (physical disconnect of NAS from network)
- AD Kerberos configuration changes require a maintenance window (risk of breaking authentication)

## Instructions

Produce a **72-Hour Emergency Response Plan** organized into 3 tiers:

- **Tier 1 — Tonight (0-12 hours):** Actions that can be taken immediately with no budget approval, no procurement and minimal risk of service disruption. These are the things you do before you sleep.
- **Tier 2 — Tomorrow (12-36 hours):** Actions that require some coordination, possibly a brief service window, and may need emergency budget approval from the Board meeting.
- **Tier 3 — This Week (36-72 hours):** Actions that require procurement, vendor involvement or configuration changes that need testing.

For each action:

```
Action: [Specific description]
Phase Blocked: [Which Crimson Tide phase does this address?]
Owner: [James / Sarah / You / External vendor]
Prerequisites: [What must happen first?]
Risk of Action: [What could go wrong?]
Risk of Inaction: [What happens if this is not done?]
```

End with a **Resource Conflict Assessment**: Are any Tier 1 and Tier 2 actions in conflict (same person needed for multiple tasks, same system needing multiple changes)? How do you resolve the conflicts?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x05_board_briefing`
- **File:** `3-emergency_plan.md`
