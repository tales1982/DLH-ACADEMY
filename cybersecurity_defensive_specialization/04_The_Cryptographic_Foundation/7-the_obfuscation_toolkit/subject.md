# 7. The Obfuscation Toolkit

**Goal:** Distinguish between encryption, hashing and obfuscation techniques, design a tokenization scheme for MedDefense, and evaluate steganography as both a protection tool and a threat vector.

## Context

Not every data protection mechanism is encryption. Sec+ 1.4 distinguishes several obfuscation techniques: tokenization (replacing sensitive data with non-sensitive tokens), data masking (hiding parts of data while preserving format) and steganography (hiding data within other data). Each has a specific use case, and confusing them is a common exam mistake and a real-world design error.

## Instructions

### Part 1 - Technique Comparison

Produce a comparison of 5 data protection techniques: Encryption, Hashing, Tokenization, Data Masking and Steganography. For each:

- What it does to the data
- Whether the original data can be recovered (and by whom)
- A concrete healthcare use case

### Part 2 - MedDefense Tokenization Design

MedDefense's billing department needs to process payments but should not store full credit card numbers. Design a tokenization scheme:

- What data is tokenized (and what format the token takes)
- Where the token-to-real-data vault is stored (and how that vault is protected, including encryption and access controls)
- What happens if the token vault is compromised
- How this compares to simply encrypting the credit card numbers (advantages and disadvantages of tokenization vs encryption for this use case)

### Part 3 - Data Masking Examples

Produce 3 masked MedDefense data examples showing what different roles should see:

| Data Field | Full Value | Nurse (clinical) | Billing Clerk | Reception |
|---|---|---|---|---|
| SSN | 987-65-4321 | ? | ? | ? |
| Patient Name | Maria Gonzalez | ? | ? | ? |
| Diagnosis | Type 2 Diabetes | ? | ? | ? |

For each cell, determine the appropriate masking level and justify it in one sentence based on the role's need-to-know.

### Part 4 - Steganography as Threat Vector

In 4-5 sentences, explain why steganography is a serious concern for MedDefense's data loss prevention program. Consider: DICOM medical images are large binary files routinely transferred between facilities. How could a malicious insider embed exfiltrated patient data within legitimate imaging files? What makes this harder to detect than traditional data exfiltration? What control from your 1x03 strategy would help detect this?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `7-obfuscation_toolkit.md`
