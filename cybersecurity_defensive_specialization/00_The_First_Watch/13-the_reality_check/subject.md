# 13. The Reality Check

**Goal:** Validate internal gap analysis findings against real-world healthcare breach data to calibrate risk priorities and identify blind spots.

## Context

James Chen sends you a message:

> "Before we finalize the report for the Board, I want you to sanity-check our findings against what's actually happening in the real world. Are our priorities right? Are we missing something that's taking down other hospitals?"

## Provided Files

- `healthcare-breach-summaries.txt` (contains 3 anonymized summaries of real healthcare breaches from the past 2 years, each 2-3 paragraphs describing the attack vector, exploited weaknesses, impact and lessons learned)

## Instructions

Read the three breach summaries carefully. For each breach:

1. **Attack Vector Identification:** What was the initial entry point? What weaknesses were exploited?
2. **MedDefense Correlation:** Review your Gap Analysis (Task 12). Identify which of your documented gaps would have allowed this same type of attack against MedDefense. Reference specific Gap IDs.
3. **Blind Spot Check:** Does this breach reveal a weakness that you did NOT identify in your gap analysis? If yes, add it as a new gap (with full documentation matching the Task 12 format). If no, explain which existing gap covers it.

After analyzing all three breaches, produce:

### Priority Reassessment

Based on the real-world data, do any of your gap priorities need to change? Identify any gaps you would upgrade or downgrade in risk level and justify each change.

### Pattern Analysis (one paragraph)

Across the three breaches, what common factors do you see? What does this tell you about where MedDefense should focus its limited security budget?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `13-reality_check.md`
