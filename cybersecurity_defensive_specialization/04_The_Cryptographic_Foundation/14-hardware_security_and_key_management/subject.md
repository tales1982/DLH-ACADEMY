# 14. Hardware Security and Key Management

**Goal:** Evaluate TPM, HSM and secure enclave technologies, and design a key management strategy for MedDefense that solves the "where do you keep the keys?" problem.

## Context

Every encryption scheme has a fatal weakness: the key. If you encrypt 50,000 patient records with AES-256 and store the key in a plaintext configuration file on the same server, you have not actually protected anything. You have added a speed bump.

Sec+ 1.4 identifies three hardware security technologies designed to solve this problem: TPM (Trusted Platform Module), HSM (Hardware Security Module) and secure enclaves. Each operates at a different scale and cost, and MedDefense needs to choose which is appropriate for its budget and risk profile.

## Instructions

### Part 1 - Technology Comparison

Research and compare:

| Technology | What It Is | What It Protects | Typical Cost | Typical Deployment |
|---|---|---|---|---|
| TPM | ? | ? | ? | ? |
| HSM | ? | ? | ? | ? |
| Secure Enclave | ? | ? | ? | ? |
| KMS (Software) | ? | ? | ? | ? |

### Part 2 - MedDefense Key Management Design

MedDefense now has encryption on: the patient database (T13 recommendation), the backup storage (T12), the portal TLS (T10) and the VPN tunnels. Each of these has at least one encryption key.

Design a Key Management Plan that addresses:

- Where each key is stored (which system/device)
- Who has access to each key (which role, from your 1x03 governance structure)
- How keys are rotated (frequency and process)
- What happens if a key is compromised (revocation and replacement procedure)
- What happens if a key is lost (recovery procedure, key escrow if appropriate)

### Part 3 - The HSM Decision

Using the ALE calculations from 1x03, evaluate whether MedDefense should invest in an HSM for database encryption key management. Estimate the cost of an HSM (cloud-based HSM-as-a-Service options are available at approximately $1-2/key/month). Compare this to the risk of key compromise (reference the relevant risk from your Risk Register). Is the investment justified?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `14-key_management.md`
