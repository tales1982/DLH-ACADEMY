# 2. The Asymmetric Engine

**Goal:** Generate RSA and ECC key pairs, discover the size limitation of asymmetric encryption through experimentation, and understand why the hybrid model exists.

## Context

If symmetric encryption is the workhorse, asymmetric encryption is the handshake. It solves the key distribution problem that symmetric encryption alone cannot: how do two parties who have never met agree on a shared secret? The answer involves key pairs, where one key encrypts and the other decrypts. But this elegance comes at a cost that you are about to measure.

## Instructions

### Part 1 — RSA Key Generation and Encryption

Generate an RSA-2048 key pair:

```
openssl genrsa -out rsa_private.pem 2048
openssl rsa -in rsa_private.pem -pubout -out rsa_public.pem
```

Encrypt a small file (the same patient record from T1) with the public key. Decrypt with the private key. Document the commands.

Now try to encrypt the 100MB test file from T1 with RSA. What happens? Document the error message. Explain in 2-3 sentences why RSA cannot encrypt large files directly and what this limitation means for real-world usage.

### Part 2 — ECC Key Generation

Generate an ECC key pair using the P-256 curve:

```
openssl ecparam -genkey -name prime256v1 -out ecc_private.pem
openssl ec -in ecc_private.pem -pubout -out ecc_public.pem
```

Compare the file sizes of `rsa_private.pem` and `ecc_private.pem`. What is the ratio? Explain in 2-3 sentences why ECC achieves equivalent security with much smaller keys and why this matters for constrained environments (think: MedDefense's BD Alaris pumps and Philips monitors with limited processing power).

### Part 3 — The Hybrid Model

In practice, TLS and most encrypted communication use a hybrid approach: asymmetric encryption to exchange a symmetric key, then symmetric encryption for the actual data. Describe this hybrid model in 4-5 sentences. Why is this combination superior to using either approach alone? Connect this to MedDefense's patient portal: when a patient connects via HTTPS, which part of the protocol handles the key exchange and which part handles the bulk data encryption?

### Part 4 — The Key Length Table

Produce a comparison table covering the algorithms Sec+ 1.4 expects:

| Algorithm | Type | Key Lengths | Equivalent Security | Status | MedDefense Usage |
|---|---|---|---|---|---|

Cover: AES (128/192/256), RSA (2048/4096), ECC (P-256/P-384), DES, 3DES, ChaCha20-Poly1305, RC4. For each, state whether it is approved for use in a healthcare environment handling regulated data.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `2-asymmetric_analysis.md`
