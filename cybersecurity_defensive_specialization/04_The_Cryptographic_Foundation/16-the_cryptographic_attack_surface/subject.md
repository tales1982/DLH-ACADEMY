# 16. The Cryptographic Attack Surface

**Goal:** Map the cryptographic attacks to MedDefense's specific weaknesses, showing which attacks are viable today and which controls would neutralize them.

## Context

Downgrade attacks, collision attacks, birthday attacks and more. These are not abstract concepts. Every one of them maps to a real weakness at MedDefense.

## Instructions

For each of the following attack types, produce:

```
Attack: [Name]
Mechanism: [How it works, 2-3 sentences]
MedDefense Vulnerability: [Which specific system/configuration is susceptible?]
Evidence: [Reference to 1x02 finding or T0/T6 analysis]
Viable Today: [Yes/No, with reasoning]
Mitigation: [What specific control or configuration change neutralizes this attack?]
```

Attacks to cover:

- TLS Downgrade (forcing TLS 1.0 on the patient portal)
- Collision Attack (exploiting MD5 in Kerberos tickets)
- Birthday Attack (theoretical, explain the math and relevance)
- Kerberoasting (exploiting RC4/DES in Kerberos for offline cracking)
- On-path/MITM on unencrypted channels (DICOM traffic, unencrypted database connections)
- Key Recovery from Memory (if an attacker has root on billing-srv-01, can they extract AES keys from RAM?)

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `16-crypto_attack_surface.md`
