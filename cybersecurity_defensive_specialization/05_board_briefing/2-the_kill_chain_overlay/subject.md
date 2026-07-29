# 2. The Kill Chain Overlay

**Goal:** Overlay the Crimson Tide attack chain onto the kill chains you built in 1x01, identifying where they converge and where MedDefense's planned controls would intercept.

## Context

You built 5 kill chains for MedDefense in Project 1x01. Crimson Tide's attack chain is a real-world instance of those theoretical models. How accurately did your threat modeling predict this attack? Where does the Crimson Tide chain match your kill chains, and where does it diverge?

## Instructions

### Part 1 — The Overlay

Take your Kill Chain #1 (ransomware) from 1x01 T10. Lay it alongside the Crimson Tide 7-phase attack chain. For each step, identify:

- Whether your predicted step matches the Crimson Tide step
- Where your prediction was accurate
- Where Crimson Tide does something your model did not anticipate

### Part 2 — Control Interception Map

From your Security Strategy (1x03), identify which planned controls would intercept the Crimson Tide chain and at which phase:

```
Phase [N] | Planned Control [from 1x03] | Status [Funded/Not Deployed, Deployed, Not Funded] | Would It Stop This Phase? [Yes/Partially/No]
```

### Part 3 — The Gap Between Plan and Reality

In one paragraph, assess: If MedDefense had fully implemented the Security Strategy from 1x03, how many of the 7 Crimson Tide phases would have been blocked? How many would still succeed? What does this tell you about the residual risk even after full strategy implementation?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x05_board_briefing`
- **File:** `2-kill_chain_overlay.md`
