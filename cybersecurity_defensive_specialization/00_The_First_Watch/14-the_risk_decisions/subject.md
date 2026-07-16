# 14. The Risk Decisions

**Goal:** Apply risk treatment strategies to prioritized gaps under realistic budget and operational constraints.

## Context

James Chen sits down with you for a strategy session:

> "OK. We've identified the problems. Now the hard part: what do we actually DO about them? I have a security budget of $120,000 for this fiscal year. That sounds like a lot until you realize that one enterprise SIEM license costs $80,000. We cannot fix everything. We need to be strategic."
>
> "For each of our top gaps, we need a treatment decision. And 'fix it' is not a strategy."

## The Four Risk Treatment Strategies

- **Mitigate:** Implement controls to reduce the risk to an acceptable level. Costs money and/or effort.
- **Transfer:** Shift the financial consequence to a third party (insurance, outsourcing). Does not eliminate the risk, changes who pays.
- **Accept:** Acknowledge the risk and take no action. Requires documented justification and management sign-off. Valid when the cost of mitigation exceeds the potential loss.
- **Avoid:** Eliminate the risk by eliminating the activity or asset that creates it. Sometimes the right answer, but often not feasible.

## Instructions

Select the **7 highest-priority gaps** from your Gap Analysis (Task 12, updated in Task 13). For each one, produce a Risk Treatment Decision:

```
Gap ID: [Reference]
Gap Title: [From gap analysis]
Risk Level: [From gap analysis, updated if changed in Task 13]

Treatment Strategy: [Mitigate / Transfer / Accept / Avoid]

Justification: [Why this strategy for this gap -- consider budget, feasibility, operational impact]
```

**If Mitigate:**
```
Proposed Control(s): [Specific controls -- category and function]
Estimated Cost: [Rough order of magnitude: $0-1K / $1-10K / $10-50K / $50K+]
Implementation Effort: [Quick Win < 1 week / Short-term < 1 month / Long-term > 1 month]
Expected Risk Reduction: [How much does this reduce the risk and why]
```

**If Transfer:**
```
Transfer Mechanism: [Insurance type, outsourced service, etc.]
Residual Risk: [What risk remains after transfer]
```

**If Accept:**
```
Acceptance Justification: [Why the cost of treatment exceeds the expected loss]
Review Trigger: [Under what conditions this decision should be revisited]
```

**If Avoid:**
```
Avoidance Action: [What activity/asset is being eliminated]
Business Impact: [What MedDefense loses by avoiding this risk]
```

Every gap entry ends with:

```
Trade-offs: [What are the downsides of your chosen strategy?]
```

At the end, produce a **Budget Summary** showing how your mitigation recommendations fit within the $120,000 annual budget. If they exceed the budget, explain what you would defer to the next fiscal year and why.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `14-risk_decisions.md`
