# 8. The Certificate Anatomy

**Goal:** Inspect real X.509 certificates from live websites using OpenSSL, identify every field that matters for security, and diagnose intentionally broken certificates.

## Context

Every time a patient opens the MedDefense portal, their browser performs a certificate check in milliseconds: Is this really MedDefense? Is the certificate still valid? Was it issued by a trusted authority? You need to understand exactly what the browser is checking, because in 18 days, MedDefense's certificate expires and you are the person who will replace it.

## Instructions

### Part 1 - Inspect Three Real Certificates

Use `openssl s_client` to download and inspect the certificate from 3 different websites:

- A site with a Let's Encrypt certificate (example: letsencrypt.org)
- A site with a commercial CA certificate (example: github.com)
- A site with a broken certificate from badssl.com (choose one: expired.badssl.com, wrong.host.badssl.com, or self-signed.badssl.com)

For each certificate, use `openssl x509 -text` to extract and document:

- Subject (CN, O, L, ST, C)
- Issuer (who signed it)
- Validity period (Not Before, Not After)
- Serial Number
- Signature Algorithm
- Public Key Algorithm and Key Size
- Subject Alternative Names (SAN extension)
- Key Usage and Extended Key Usage
- Authority Information Access (OCSP URL, CA Issuer URL)

### Part 2 - The Broken Certificate

For your badssl.com certificate, explain precisely what is wrong. What error would a browser display? What risk does this misconfiguration create? Would you advise a patient to proceed to a portal that displays this type of error?

### Part 3 - MedDefense Certificate Profile

Based on what you have learned, describe the ideal certificate for MedDefense's patient portal:

- What type (DV, OV, EV) and why
- What CA should issue it and why
- What SAN entries should it include
- What key algorithm and size
- What validity period
- Whether a wildcard or single-domain certificate is more appropriate

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `8-certificate_anatomy.md`
