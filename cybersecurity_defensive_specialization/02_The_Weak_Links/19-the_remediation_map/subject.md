# 19. The Remediation Map

**Goal:** Design specific remediation actions for each prioritized vulnerability, considering operational constraints and risks of the remediation itself.

## Context

Fixing a vulnerability always has a cost: the patch that breaks the billing application, the firewall rule that blocks legitimate clinical traffic, the server restart that takes the EHR offline during rounds. Remediation is not "apply patch." Remediation is "apply patch, but first understand what might break, test in a maintenance window, have a rollback plan, and communicate with the clinical teams."

## Instructions

For your 8 prioritized findings, design a remediation plan:

```
Finding [ID]:
  Response Type: [Patch / Configuration Change / Compensating Control / Exception]

  If Patch:
    Patch Source: [Vendor advisory URL or update method]
    Prerequisites: [Testing, maintenance window, backup]
    Rollback Plan: [How to revert if the patch causes issues]
    Operational Risk: [What could go wrong during patching?]

  If Configuration Change:
    Change Description: [Exact change needed]
    Impact Assessment: [What services or users are affected?]

  If Compensating Control:
    Control Description: [What control and how it reduces risk]
    Residual Risk: [What risk remains after the control?]

  If Exception:
    Justification: [Why remediation is not feasible]
    Review Date: [When this decision will be reassessed]
    Monitoring: [What monitoring compensates for the accepted risk?]

  Timeline: [Immediate / 7 days / 30 days / 90 days]
  Owner: [IT / Security / Vendor / Clinical - who executes this?]
  Cost Estimate: [$0-1K / $1-10K / $10-50K / $50K+]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `19-remediation_map.md`
