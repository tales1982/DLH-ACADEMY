# 5. Digital Signatures in Practice — MedDefense Health Systems

**Analyst:** Security Analyst
**Date:** Current
**Environment:** OpenSSL 3.0.13, Ubuntu 24.04 — all commands actually executed, using the RSA-2048 key pair generated in Task 2 (`rsa_private.pem` / `rsa_public.pem`).

## Part 1: Sign and Verify

**`prescription.txt`:**
```
Patient: John Smith | MRN: MED-10042 | Rx: Metoprolol 50mg | Prescriber: Dr. Patel
```

**Sign the file with SHA-256 and the RSA private key:**
```
$ openssl dgst -sha256 -sign rsa_private.pem -out prescription.sig prescription.txt
```
Produces a 256-byte `prescription.sig` (matching the RSA-2048 modulus size, same reasoning as the fixed-size RSA ciphertext observed in Task 2).

**Verify the signature with the public key:**
```
$ openssl dgst -sha256 -verify rsa_public.pem -signature prescription.sig prescription.txt
Verified OK
```

**Modify one character in `prescription.txt` and verify again:**
```
$ sed -i 's/50mg/60mg/' prescription_tampered.txt
$ openssl dgst -sha256 -verify rsa_public.pem -signature prescription.sig prescription_tampered.txt
```
**Actual failure output:**
```
40174FB9C4710000:error:02000068:rsa routines:ossl_rsa_verify:bad signature:../crypto/rsa/rsa_sign.c:430:
40174FB9C4710000:error:1C880004:Provider routines:rsa_verify:RSA lib:../providers/implementations/signature/rsa_sig.c:774:
Verification failure
```
Changing a single character (`50mg` -> `60mg`) is enough to break verification completely — a direct, practical demonstration of the avalanche effect from Task 3: the signature is built over a SHA-256 digest of the file, and that digest changes almost completely (per Task 3's own measurement, roughly 50% of output bits) the instant any byte of the input changes, so a signature computed over the original digest cannot possibly validate against the new one.

## Part 2: The Signing Script

`5-sign_verify.sh` supports two modes, tested against five real scenarios:

```
$ ./5-sign_verify.sh sign prescription.txt rsa_private.pem
Signed 'prescription.txt' -> 'prescription.txt.sig'

$ ./5-sign_verify.sh verify prescription.txt prescription.txt.sig rsa_public.pem
Verified OK                                              (exit 0)

$ ./5-sign_verify.sh verify prescription_tampered.txt prescription.txt.sig rsa_public.pem
Verification failure                                     (exit 1)

$ ./5-sign_verify.sh bogus prescription.txt rsa_private.pem
Usage: ./5-sign_verify.sh sign <file_path> <private_key_path>
       ./5-sign_verify.sh verify <file_path> <signature_path> <public_key_path>   (exit 1)

$ ./5-sign_verify.sh sign prescription.txt
Usage: ...                                                (exit 1, missing args caught)
```

## Why This Matters for MedDefense: HIPAA and the ESIGN Act

A digital signature over `prescription.txt` provides three properties simultaneously, and the lab above demonstrated all three in practice:

- **Integrity** — proven directly by Part 1's tamper test: the moment `50mg` became `60mg`, verification failed loudly rather than silently accepting a modified prescription. For an e-prescription, that's the difference between a pharmacist trusting a dosage and a patient receiving the wrong one.
- **Authentication** — verification only succeeds against the specific public key paired with the private key that produced the signature (`rsa_public.pem` here); this is what proves a prescription was actually issued by Dr. Patel's key and not fabricated by someone else.
- **Non-repudiation** — because only the holder of `rsa_private.pem` could have produced a signature that verifies against `rsa_public.pem`, Dr. Patel cannot later plausibly deny having signed the prescription, provided the private key was never shared or compromised (which is precisely why private key handling — the same `chmod`-protected, never-transmitted key material used throughout this entire block — matters as much as the algorithm itself).

**Legal grounding:** HIPAA's Security Rule requires that ePHI (electronic protected health information) — which an e-prescription unambiguously is — be protected against improper alteration and that the identity of anyone accessing or modifying it be verifiable; the ESIGN Act (2000) separately establishes that an electronic signature is legally equivalent to a handwritten one, but only when it can reliably identify the signer and reliably indicate the signer's intent, and only when any subsequent alteration would invalidate it. A plain unsigned text file satisfies neither requirement — anyone with write access to `prescription.txt` could change the dosage with no trace and no way to prove who did it, or whether it was even Dr. Patel who wrote it in the first place. The RSA-signed version demonstrated above satisfies both simultaneously: MedDefense's existing infrastructure gaps documented throughout this block (Task 0's near-total absence of encryption-in-use protections, the plaintext EHR/DICOM/MySQL traffic) describe data that can be read or copied by an unauthorized party; a missing digital signature on something like an e-prescription describes a data that can be **silently altered or forged** by an unauthorized party — a categorically more dangerous gap for a system whose entire purpose is instructing a pharmacist how much medication to dispense to a named patient.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `5-sign_verify.sh`
