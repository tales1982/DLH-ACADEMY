# 1. The NIST CSF Mapping

**Goal:** Apply NIST CSF 2.0 to MedDefense by mapping the organization's current security posture to each of the six core functions.

## Context

NIST CSF 2.0 organizes all security activities into six functions: Govern (establish and monitor the security strategy), Identify (understand what you need to protect), Protect (implement safeguards), Detect (find incidents when they happen), Respond (act on detected incidents), Recover (restore operations after an incident). Each function contains categories and subcategories that describe specific outcomes.

This is not a theoretical exercise. You are building MedDefense's Current Profile, a realistic snapshot of where the organization stands today against each function. This profile will become the foundation for the Target Profile (where MedDefense needs to be), and the gap between them drives the entire strategy.

## Provided Files

- `nist-csf-reference.txt` (summary of CSF 2.0 functions, categories and key subcategories)

## Instructions

For each of the 6 CSF functions, assess MedDefense's current maturity using a 4-level scale:

| Level | Description |
|---|---|
| Not Implemented | No activity exists for this function |
| Partial | Some activity exists but is informal, inconsistent or incomplete |
| Managed | Activity is documented, repeatable and covers most of the scope |
| Optimized | Activity is continuous, measured and actively improved |

Produce a NIST CSF Current Profile for MedDefense:

- **Function:** [Name]
- **Current Level:** [Not Implemented / Partial / Managed / Optimized]
- **Evidence:** [What specific findings from Projects 1x00, 1x01 and 1x02 support this rating?]
- **Key Gaps:** [What is the most significant gap within this function?]
- **Target Level:** [Where should MedDefense be in 6 months? Justify.]

A few calibration points to guide your assessment:

- **Identify:** You built the asset inventory in 1x00. Did MedDefense have one before you arrived?
- **Protect:** The vulnerability scan (1x02) revealed the state of MedDefense's protective controls. How would you rate them?
- **Detect:** Marcus's notes mentioned zero monitoring capability. What does that mean for this function?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `1-nist_csf_mapping.md`
