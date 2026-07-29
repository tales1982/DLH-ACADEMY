# 9. The Chain of Trust

**Goal:** Capture and verify a complete certificate chain, understand how trust propagates from root to leaf, and analyze what happens when the chain breaks.

## Context

A certificate is only as trustworthy as the chain behind it. The patient's browser trusts the portal's certificate because it trusts the intermediate CA that signed it, which it trusts because it trusts the root CA in its trust store. If any link in this chain is invalid, expired, revoked or untrusted, the entire connection fails.

## Instructions

### Part 1 - Capture the Full Chain

Use `openssl s_client -showcerts` to capture the complete certificate chain from a website with at least 2 certificates in the chain (most commercial sites qualify). Save each certificate to a separate file. Document:

- How many certificates are in the chain
- The role of each (leaf, intermediate, root)
- The Subject and Issuer of each (show how the Issuer of one matches the Subject of the next)

### Part 2 - Manual Chain Verification

Use `openssl verify` to manually verify the chain. Document the command and the output. Then remove the intermediate certificate and try to verify again. Document the error. Explain in 2-3 sentences what this demonstrates about why servers must send the full chain (not just the leaf certificate).

### Part 3 - Revocation Mechanisms

Research and explain:

- **CRL (Certificate Revocation List):** What it is, how a client uses it, and its main limitation (hint: size and update frequency).
- **OCSP (Online Certificate Status Protocol):** What it is, how it improves on CRLs, and what OCSP Stapling adds.

For MedDefense: If the portal's private key were compromised tomorrow (as in MCQ T25 of 1x03, where a key was exposed in a Git repository), describe the exact sequence of actions needed to revoke and replace the certificate.

### Part 4 - Trust Store Exploration

On your Linux machine, find where the system's trusted root certificates are stored (typically `/etc/ssl/certs/` or similar). How many root CAs does your system trust? Pick one root CA certificate and inspect it with `openssl x509 -text`. What is its validity period? Does this surprise you?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `9-chain_of_trust.md`
