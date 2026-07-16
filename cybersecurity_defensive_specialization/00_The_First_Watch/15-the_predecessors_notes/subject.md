# 15. The Predecessor's Notes

**Goal:** Critically evaluate a third-party analysis, reconcile it with your own findings, validate or challenge its conclusions and use it to identify forward-looking security priorities.

## Context

While cleaning out the last of Marcus's desk drawers to make the workspace yours, you find a sealed envelope at the back. Inside is a document titled "MedDefense Security Assessment, DRAFT v0.3, Marcus Webb." It is dated three months ago, the week before Marcus left.

The document is incomplete. Marcus clearly intended to finish it but ran out of time or patience. However, it contains observations, analysis and partial conclusions. Some align with your own findings. Some do not. And the final page contains something you did not expect.

## Provided Files

- `marcus-draft-assessment.txt`

## Instructions

### Part 1: Comparative Analysis

Read Marcus's draft assessment. Compare his findings to your own work. Produce a comparison table:

```
Finding | Marcus's Assessment | Your Assessment | Agree/Disagree | Resolution
```

- For findings where you **agree**, briefly confirm why.
- For findings where you **disagree**, provide specific evidence from your own analysis that supports your position. Reference your Gap IDs, Control IDs or Asset Registry entries.
- For findings Marcus identified that **you missed**, evaluate whether they are valid. If valid, add them to your gap analysis with proper documentation. If invalid (outdated, incorrect or based on incomplete information), explain why.
- For findings **you** identified that Marcus missed, list them and hypothesize why he might have missed them (limited access? different scope? time pressure?).

### Part 2: The Last Page

Marcus's document ends abruptly with a section titled "Next Steps, External Threat Landscape." His notes read:

> "Internal posture assessment is one half of the equation. The other half: who is actively targeting organizations like MedDefense? Healthcare sector is under sustained attack. APT groups, ransomware operators, insider threats. I started tracking threat intelligence feeds and building a threat actor profile for MedDefense but ran out of time."
>
> "Key questions for the next phase:"
> - "Which threat actor categories are most relevant to a regional hospital group?"
> - "What are their typical TTPs (Tactics, Techniques and Procedures)?"
> - "How do our specific gaps map to their known attack patterns?"
> - "Can we apply STRIDE to MedDefense's architecture to anticipate where they would target?"
>
> "Started pulling data from CISA healthcare advisories and HHS threat briefs. This needs to become a formal Threat Landscape Report."

In 3-4 sentences, reflect on how Marcus's unfinished work connects to your completed assessment. What does your internal posture assessment tell you about MedDefense's exposure to external threats? Why is the external threat landscape the logical next step after understanding the internal posture?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `15-predecessor_review.md`
