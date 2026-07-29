# 19. The HIPAA Crypto Checkpoint

**Goal:** Map HIPAA encryption requirements to MedDefense's current state and identify every compliance gap.

## Context

MedDefense is a covered entity under HIPAA. The HIPAA Security Rule (45 CFR §164.312) has specific requirements for encryption of electronic Protected Health Information (ePHI). These requirements are "addressable," meaning MedDefense must either implement the specified encryption or document why an equivalent alternative is in place. "We did not know" is not an acceptable alternative.

## Instructions

Research the HIPAA Security Rule encryption requirements. Then produce a HIPAA Crypto Compliance Table:

| HIPAA Requirement | Citation | Current MedDefense State | Compliant? | Gap / Remediation |
|---|---|---|---|---|

Cover at minimum:

- §164.312(a)(2)(iv): Encryption and decryption of ePHI
- §164.312(e)(1): Transmission security
- §164.312(e)(2)(ii): Encryption of ePHI in transit
- §164.312(d): Authentication

For each requirement: what it mandates, what MedDefense currently does (reference your T0 inventory and 1x02 findings), whether it is compliant and what the specific remediation is if not.

After the table, answer in one paragraph: Could MedDefense pass a HIPAA security audit today? What would the auditor cite as the most critical encryption deficiency?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `19-hipaa_checkpoint.md`
