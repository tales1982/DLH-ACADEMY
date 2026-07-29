# 6. The Algorithm Landscape

**Goal:** Build the definitive reference table of cryptographic algorithms, mapped against MedDefense's current and recommended usage, identifying every deprecated algorithm still in production.

## Context

The Security+ exam expects you to know which algorithms are current, which are deprecated and which are broken. More importantly, it expects you to know WHY certain algorithms are inappropriate for certain uses. This task builds the reference you will carry into the exam and into your career.

Every algorithm in the table connects to something you have already seen in MedDefense.

## Instructions

Produce an Algorithm Reference Table organized by type:

- **Symmetric:** AES-128, AES-192, AES-256, DES, 3DES, ChaCha20-Poly1305, RC4, Blowfish
- **Asymmetric:** RSA-2048, RSA-4096, ECC P-256, ECC P-384, Diffie-Hellman, ECDHE
- **Hash:** MD5, SHA-1, SHA-256, SHA-512, SHA-3
- **Key Derivation:** PBKDF2, bcrypt, Argon2, scrypt

For each algorithm:

| Field | What to document |
|---|---|
| Type | Symmetric / Asymmetric / Hash / KDF |
| Key/Output Size | In bits |
| Primary Use Case | What it is designed for |
| Status | Current / Deprecated / Broken |
| Why Deprecated/Broken | If applicable, one sentence |
| MedDefense Usage | Where this algorithm is or should be used at MedDefense |

After the table, produce a **MedDefense Crypto Gap Analysis**: compare what MedDefense currently uses (from T0 and 1x02 findings) against what it should use. Identify at least 4 cases where MedDefense uses a deprecated or broken algorithm and recommend the specific replacement.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `6-algorithm_landscape.md`
