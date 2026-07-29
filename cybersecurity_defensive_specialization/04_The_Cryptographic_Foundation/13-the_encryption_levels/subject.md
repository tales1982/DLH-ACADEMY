# 13. The Encryption Levels

**Goal:** Compare the six encryption levels defined and recommend the appropriate level for every MedDefense data store.

## Context

"Encrypt the database" sounds simple, but there are at least three ways to do it: encrypt the entire disk the database sits on (full-disk), encrypt the database files (file-level), or encrypt individual fields within the database (record-level). Each has radically different properties: scope of protection, performance impact, key management complexity and what happens when someone with legitimate database access queries the data.

Choosing the wrong level either leaves data exposed or creates operational problems that the clinical staff will not tolerate.

## Instructions

Produce a comparison table of the 6 encryption levels from Sec+ 1.4:

| Level | Scope | Performance Impact | Key Management | Use Case |
|---|---|---|---|---|
| Full-disk | Entire physical or virtual disk | ? | ? | ? |
| Partition | One logical partition | ? | ? | ? |
| Volume | Logical volume (may span disks) | ? | ? | ? |
| File | Individual files | ? | ? | ? |
| Database | Entire database or tablespace | ? | ? | ? |
| Record | Individual fields or records | ? | ? | ? |

For each: fill in all columns and explain in one sentence when this level is the best choice.

Then produce a **MedDefense Encryption Level Map**: for each data store at MedDefense, recommend the specific encryption level and justify your choice:

- Patient records in PostgreSQL (`ehr-db-01`)
- Backup data on `NAS-01`
- Financial records in MySQL (`billing-srv-01`)
- Medical images on PACS (`pacs-srv-01`)
- Email data in O365
- Employee laptops
- BD Alaris pump firmware/configuration

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `13-encryption_levels.md`
