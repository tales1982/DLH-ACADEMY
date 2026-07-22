# 23. The Validation Plan

**Goal:** Design a post-remediation validation and continuous monitoring strategy.

## Context

Patching is not the end. Verification is the end. A patch that was deployed but failed silently is worse than no patch at all because everyone thinks the problem is solved.

## Instructions

Design a Validation Plan for MedDefense covering:

1. **Post-Patch Verification:** For each of the 3 "Immediate" remediations from T20, describe the specific test or check that confirms the patch was applied correctly. (Example: rescan the specific port/service, verify the version string changed, confirm the exploit no longer works.)
2. **Compensating Control Validation:** For the compensating controls (MRI, medical IoT), describe how to verify they are functioning as intended.
3. **Rescan Schedule:** What frequency of vulnerability scanning should MedDefense adopt? Justify your recommendation.
4. **Continuous Intelligence:** How should MedDefense integrate CISA KEV alerts, vendor advisories and threat feed updates into their vulnerability management cycle?
5. **Lifecycle Diagram:** Describe (in text) the continuous vulnerability management lifecycle for MedDefense: Scan → Triage → Prioritize → Remediate → Validate → Repeat. For each step, identify who is responsible (Security Analyst, IT Ops, Vendor, Management).

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `23-validation_plan.md`
