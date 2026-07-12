# DATA CLASSIFICATION POLICY

## Document Control

| Field          | Value                                     |
| -------------- | ----------------------------------------- |
| Policy ID      | POL-DCP-001                               |
| Version        | 1.0                                       |
| Effective Date | 2026-06-23                                |
| Review Date    | 2027-06-23                                |
| Policy Owner   | Privacy and Information Security Manager  |
| Approved By    | Chief Information Security Officer (CISO) |
| Classification | Internal                                  |

# 1. Purpose

This policy establishes a framework for classifying, handling, and protecting data based on its sensitivity and the potential impact of unauthorized disclosure, alteration, or destruction.

The objective is to ensure that all data created, received, maintained, or transmitted by HealthPlus Medical Group is appropriately identified and protected throughout its lifecycle, in compliance with HIPAA, GDPR, and applicable state privacy laws.

# 2. Scope

## 2.1 Applicability

This policy applies to:

* All employees
* Contractors and consultants
* Third-party vendors with access to HealthPlus data
* System administrators
* Research staff

## 2.2 Systems/Assets Covered

* Electronic Health Record (EHR) systems
* Patient management systems
* Employee HR systems
* Financial systems
* Research databases
* Cloud storage and services
* Physical documents and printed media
* Email and collaboration tools
* Removable storage media

## 2.3 Exclusions

* Publicly available data not created or managed by HealthPlus Medical Group.
* Personal systems not connected to company infrastructure.

# 3. Policy Statements

## 3.1 Classification Levels

All data must be assigned one of the following classification levels at the time of creation or receipt. When in doubt, data must be classified at the higher sensitivity level.

| Level        | Description                                                                | Examples                                                              |
| ------------ | -------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| PUBLIC       | Approved for public release. No harm if disclosed.                         | Marketing materials, website content, press releases, public reports  |
| INTERNAL     | For internal use only. Limited harm if disclosed outside the organization. | Memos, org charts, internal procedures, employee directories          |
| CONFIDENTIAL | Business-sensitive. Could cause harm to individuals or operations.         | Employee PII, financial reports, research data, business contracts    |
| RESTRICTED   | Highest sensitivity. Severe damage if disclosed or compromised.            | Patient PHI, authentication credentials, GDPR personal data          |

## 3.2 Handling Requirements

The following controls are mandatory for each classification level:

| Requirement            | Public | Internal       | Confidential             | Restricted                        |
| ---------------------- | ------ | -------------- | ------------------------ | --------------------------------- |
| Labeling               | No     | Yes            | Yes                      | Yes                               |
| Encryption at Rest     | No     | No             | Yes                      | Yes                               |
| Encryption in Transit  | No     | Yes            | Yes                      | Yes                               |
| Access Control         | Open   | Role-based     | Role-based + audit log   | MFA + strict RBAC + audit log     |

## 3.3 Labeling

All data must be labeled to identify its classification level and ensure it is handled appropriately.

### Document and File Labeling

* Classification labels must be applied at the time of creation.
* All documents must display the classification level in the header and footer of every page.
* Labels must be clearly visible and must not be obscured or removed.

### File Naming Convention

| Classification | File Naming Format        |
| -------------- | ------------------------- |
| PUBLIC         | `[filename]-PUBLIC`       |
| INTERNAL       | `[filename]-INTERNAL`     |
| CONFIDENTIAL   | `[filename]-CONFIDENTIAL` |
| RESTRICTED     | `[filename]-RESTRICTED`   |

### Email Labeling

* The classification label must be included in the email subject line: `[PUBLIC]`, `[INTERNAL]`, `[CONFIDENTIAL]`, or `[RESTRICTED]`.
* The first line of the email body must state the classification level.

## 3.4 Storage

### Approved Storage Locations

| Classification | Approved Locations                                              |
| -------------- | --------------------------------------------------------------- |
| PUBLIC         | Any company-approved system or public-facing platforms          |
| INTERNAL       | Internal file servers, approved cloud storage                   |
| CONFIDENTIAL   | Encrypted internal servers, approved encrypted cloud services   |
| RESTRICTED     | Dedicated encrypted systems, HIPAA-compliant environments only  |

### Prohibited Storage Locations

* Personal devices not enrolled in the company Mobile Device Management (MDM) system for Confidential and Restricted data.
* Unencrypted USB drives or removable media for Confidential and Restricted data.
* Personal cloud services (e.g., Google Drive, Dropbox, iCloud) for any classification level.
* Unauthorized third-party systems for Confidential and Restricted data.
* Local workstation desktop or downloads folders for Restricted data.

## 3.5 Transmission

### Email Transmission

| Classification | Requirements                                                                       |
| -------------- | ---------------------------------------------------------------------------------- |
| PUBLIC         | No restrictions                                                                    |
| INTERNAL       | Internal email systems preferred. External transmission requires justification.    |
| CONFIDENTIAL   | Encrypted email required for all external transmission                             |
| RESTRICTED     | Encrypted email mandatory. PHI requires HIPAA-compliant channels with signed BAA.  |

### File Transfer

* Confidential and Restricted data must be transmitted using encrypted protocols (SFTP, HTTPS).
* Unencrypted channels (FTP, HTTP) are prohibited for Confidential and Restricted data.
* PHI transfers require a signed HIPAA Business Associate Agreement (BAA) with the receiving party.
* GDPR personal data transfers outside the European Union require appropriate safeguards per GDPR Chapter V.

### Physical Transmission

* Confidential and Restricted documents must be sent via tracked, sealed courier service.
* Restricted documents require recipient signature upon delivery.
* Physical media containing Restricted data must be hand-delivered or sent via certified, tamper-evident packaging.

## 3.6 Disposal

### Electronic Data Disposal

| Classification | Disposal Method                                             |
| -------------- | ----------------------------------------------------------- |
| PUBLIC         | Standard deletion                                           |
| INTERNAL       | Standard deletion with recycle bin emptied                  |
| CONFIDENTIAL   | Secure deletion using NIST SP 800-88 compliant tools        |
| RESTRICTED     | Cryptographic erasure or physical destruction of media      |

### Paper Document Disposal

| Classification | Disposal Method                            |
| -------------- | ------------------------------------------ |
| PUBLIC         | Standard recycling                         |
| INTERNAL       | Cross-cut shredding                        |
| CONFIDENTIAL   | Cross-cut shredding                        |
| RESTRICTED     | Micro-cut shredding or locked secure bins  |

### Media Sanitization

* All media containing Confidential or Restricted data must be sanitized before reuse or disposal per NIST SP 800-88.
* Hard drives and storage media containing PHI must be physically destroyed or overwritten using approved DoD standards.
* All disposal must be documented with date, method, media type, and name of responsible personnel.
* Third-party disposal vendors must provide a Certificate of Destruction.

## 3.7 Access Control

### Access Principles

* Least Privilege: Users are granted the minimum access necessary for their role.
* Need-to-Know: Access is based on job function, not seniority or tenure.
* Segregation of Duties: Critical functions require multiple individuals to prevent unauthorized actions.

### Access Requirements by Classification

| Classification | Who Can Access              | Authentication Required         | Access Reviews   |
| -------------- | --------------------------- | ------------------------------- | ---------------- |
| PUBLIC         | Anyone                      | None                            | Not required     |
| INTERNAL       | All employees               | Username and password           | Annual           |
| CONFIDENTIAL   | Authorized roles only       | MFA recommended                 | Semi-annual      |
| RESTRICTED     | Explicitly authorized users | MFA mandatory                   | Quarterly        |

### Access Management

* All access to Confidential and Restricted data must be formally requested, approved by the data owner, and documented.
* Access reviews are conducted quarterly for Restricted data and semi-annually for Confidential data.
* Terminated employees must have all access revoked within 24 hours of separation.
* Privileged access to systems containing PHI must be managed through a Privileged Access Management (PAM) solution.

# 4. Roles and Responsibilities

| Role                  | Responsibilities                                                                 |
| --------------------- | -------------------------------------------------------------------------------- |
| Executive Management  | Approve policy, allocate resources, demonstrate leadership commitment            |
| Data Owners           | Assign classification levels, approve access requests, conduct access reviews    |
| Privacy Officer       | Ensure HIPAA and GDPR compliance, manage data subject rights requests            |
| IT Security Team      | Implement technical controls, monitor compliance, investigate violations         |
| Legal Counsel         | Advise on regulatory obligations, manage breach notifications to authorities     |
| Department Managers   | Ensure team compliance, report violations, support training completion           |
| System Administrators | Maintain encryption, access configurations, and audit log systems                |
| All Employees         | Classify data correctly at creation, handle per this policy, report incidents    |

# 5. Compliance

## 5.1 Monitoring

Compliance will be monitored through:

* Access logs and audit trails for Confidential and Restricted systems
* Data Loss Prevention (DLP) tools
* Security monitoring and alerting systems
* Regular compliance assessments and internal audits
* Employee training completion tracking

## 5.2 Reporting

All data classification violations and suspected data breaches must be reported immediately to the Information Security Team and Privacy Officer.

* HIPAA breach notifications must be submitted to HHS within 60 days of discovery.
* GDPR breach notifications must be made to the relevant supervisory authority within 72 hours of discovery.
* Affected individuals must be notified as required by applicable law.

## 5.3 Auditing

Data classification controls and access rights will be audited annually and following any significant data incident, regulatory change, or major system change.

# 6. Enforcement

## 6.1 Violations

Violations of this policy may result in:

* Verbal warning
* Written warning
* Suspension of access privileges
* Disciplinary action up to and including termination
* Legal action where applicable
* Mandatory reporting to regulators where required by HIPAA or GDPR

## 6.2 Reporting Violations

Report suspected violations to the Information Security Team or Privacy Officer through approved reporting channels or the company ticketing system.

# 7. Exceptions

## 7.1 Exception Process

Exceptions require:

1. Written request to the Information Security Manager.
2. Business justification.
3. Risk assessment.
4. Compensating controls where applicable.
5. Formal approval by the CISO and Privacy Officer.
6. Documentation and exception tracking with defined expiration.

## 7.2 Exception Duration

All exceptions must have a defined expiration date and be reviewed annually. Exceptions involving PHI or GDPR personal data require legal counsel review.

# 8. Definitions

| Term                  | Definition                                                                      |
| --------------------- | ------------------------------------------------------------------------------- |
| PHI                   | Protected Health Information as defined under HIPAA (45 CFR §160.103)          |
| PII                   | Personally Identifiable Information as defined by GDPR and applicable state law |
| Data Owner            | Individual responsible for classification and protection of a specific data set |
| Encryption at Rest    | Cryptographic protection of stored data                                         |
| Encryption in Transit | Cryptographic protection of data during transmission                            |
| RBAC                  | Role-Based Access Control — access rights assigned by job role                  |
| MFA                   | Multi-Factor Authentication requiring two or more authentication factors        |
| BAA                   | Business Associate Agreement required by HIPAA for third-party PHI handling     |
| Media Sanitization    | Process of rendering stored data unrecoverable prior to reuse or disposal       |
| Data Classification   | Process of categorizing data based on sensitivity and required protection level |

# 9. Related Documents

* Information Security Policy
* Access Control Policy
* Incident Response Policy
* Privacy Policy
* HIPAA Security Rule (45 CFR Part 164)
* GDPR Article 4 (Definitions) and Article 32 (Security of Processing)
* NIST SP 800-60: Guide for Mapping Types of Information
* NIST SP 800-88: Guidelines for Media Sanitization

# 10. Revision History

| Version | Date       | Author        | Description     |
| ------- | ---------- | ------------- | --------------- |
| 1.0     | 2026-06-23 | Security Team | Initial Release |

# 11. Acknowledgment

By accessing company systems, all users acknowledge they have read, understood, and agree to comply with this policy.

For formal acknowledgment tracking, use the company's policy acknowledgment system.

---

# QUICK REFERENCE GUIDE
## HealthPlus Medical Group — Data Classification at a Glance

### What Are the Classification Levels?

| Level        | What Is It?                              | Examples                                        |
| ------------ | ---------------------------------------- | ----------------------------------------------- |
| PUBLIC       | Safe to share publicly                   | Website, marketing, press releases              |
| INTERNAL     | For employees only                       | Memos, org charts, internal procedures          |
| CONFIDENTIAL | Sensitive — protect carefully            | Employee PII, financial data, research, contracts |
| RESTRICTED   | Most sensitive — maximum protection      | Patient PHI, passwords, GDPR personal data      |

### What Do I Need to Do?

| Action                 | PUBLIC | INTERNAL | CONFIDENTIAL | RESTRICTED                     |
| ---------------------- | ------ | -------- | ------------ | ------------------------------ |
| Label the file         | No     | Yes      | Yes          | Yes                            |
| Encrypt at rest        | No     | No       | Yes          | Yes                            |
| Encrypt in transit     | No     | Yes      | Yes          | Yes                            |
| Who can access         | Anyone | All staff | Authorized roles only | MFA + explicit approval |
| Access reviews         | None   | Annual   | Semi-annual  | Quarterly                      |

### How to Label Files

Add the classification to the file name and document header/footer:

* `report-PUBLIC`
* `procedure-manual-INTERNAL`
* `employee-records-CONFIDENTIAL`
* `patient-records-RESTRICTED`

Add to email subject line: `[RESTRICTED] Patient Record Request`

### Storage Rules — Quick Check

| Do This                                                 | Never Do This                                     |
| ------------------------------------------------------- | ------------------------------------------------- |
| Store PHI only in HIPAA-compliant systems               | Store any data on personal cloud (Drive, Dropbox) |
| Use encrypted servers for Confidential and Restricted   | Use unencrypted USB drives for sensitive data     |
| Use MDM-enrolled devices for sensitive data             | Save Restricted data to local desktop or downloads|

### Sending Data — Quick Check

| Data Type               | How to Send                                          |
| ----------------------- | ---------------------------------------------------- |
| PUBLIC                  | No restrictions                                      |
| INTERNAL                | Internal email preferred                             |
| CONFIDENTIAL            | Encrypted email required for external recipients     |
| RESTRICTED / PHI        | HIPAA-compliant channel + signed BAA required        |
| GDPR personal data (EU) | Verify transfer safeguards before sending outside EU |

### Disposing of Data

| Type          | CONFIDENTIAL / RESTRICTED                         |
| ------------- | ------------------------------------------------- |
| Paper         | Micro-cut shred or locked secure disposal bin     |
| Digital files | Secure deletion per NIST SP 800-88                |
| Hard drives   | Physical destruction or certified wipe            |
| All disposal  | Document: date, method, media, responsible person |

### When in Doubt — Ask First

Contact the team before sharing, storing, or disposing of sensitive data.

* **Privacy Officer:** privacy@healthplus.com
* **IT Security Team:** security@healthplus.com
* **Incident Hotline:** Available on the company intranet

> If you are unsure of the classification level, treat the data as RESTRICTED until confirmed.

# End of Policy Document
