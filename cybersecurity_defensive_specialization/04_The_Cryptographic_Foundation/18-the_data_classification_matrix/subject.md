# 18. The Data Classification Matrix

**Goal:** Apply data protection principles to produce a comprehensive data classification policy for MedDefense that drives every encryption decision.

## Context

Encryption is not binary ("encrypted" or "not encrypted"). It is a spectrum driven by the sensitivity of the data. A hospital cafeteria menu does not need AES-256. A patient's HIV status does. The data classification determines the protection level, and the protection level determines the algorithm, the key management rigor and the access controls.

## Instructions

### Part 1 - Data Type Inventory

Classify all MedDefense data into data types: Regulated (HIPAA/PHI), PII, Financial, Intellectual Property, Legal and Operational. Some data may belong to multiple types.

### Part 2 - Classification Levels

Define 4 classification levels for MedDefense:

- **Public** (example: hospital address, visiting hours)
- **Internal** (example: staff directory, meeting schedules)
- **Confidential** (example: financial reports, vendor contracts)
- **Restricted** (example: patient records, credentials, encryption keys)

For each level, define: who can access it, what encryption is required (at rest and in transit), what happens if it is exposed.

### Part 3 - The Classification Decision Tree

Produce a text-based decision tree that a MedDefense employee could follow to classify a new type of data: "Is it patient data? → Restricted. Does it contain financial information? → Confidential. Is it internal operational data? → Internal."

### Part 4 - Sovereignty and Geolocation

MedDefense is considering migrating backups to AWS cloud storage (from the 1x03 roadmap). In 2-3 sentences, explain why data sovereignty matters for healthcare. If the AWS region is in a different state or country, what HIPAA implications arise? Does encryption mitigate the sovereignty concern?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `18-data_classification.md`
