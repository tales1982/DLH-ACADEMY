# 6. The Technical Proof

**Goal:** Demonstrate hands-on technical mastery by executing a rapid security check using tools from the entire module.

## Context

James Chen needs to know that you can DO what you recommend, not just write about it. Before the Board meeting, he asks you to run a quick technical validation on your own machine to prove proficiency. "Show me you can inspect a cert, verify a hash, check for an exploit and audit a system. Five minutes each."

## Instructions

Execute the following 4 rapid technical checks and document the commands and output for each.

### Check 1 — Certificate Inspection

Use OpenSSL to inspect the certificate of any live website. Produce a 5-line summary: Subject, Issuer, Validity, Key Algorithm, SAN entries.

### Check 2 — Hash Verification

Create a file, hash it with SHA-256, modify the file, hash again. Document both hashes and confirm they differ. In one sentence: why does this matter for verifying the integrity of the FortiGate firmware before installing it?

### Check 3 — Exploit Research

Run `searchsploit fortigate` or `searchsploit fortios`. Document the output. Is there a public exploit for CVE-2023-27997? What does this tell you about the urgency of patching?

### Check 4 — System Audit

Run `sudo lynis audit system --quick` on your machine. Report: the Hardening Index, the top 3 warnings and one suggestion you would apply to MedDefense's billing-srv-01.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x05_board_briefing`
- **File:** `6-technical_proof.md`
