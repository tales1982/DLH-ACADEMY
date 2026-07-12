# PASSWORD POLICY

## Document Control

| Field          | Value                                     |
| -------------- | ----------------------------------------- |
| Policy ID      | POL-PWD-001                               |
| Version        | 1.0                                       |
| Effective Date | 2026-06-23                                |
| Review Date    | 2027-06-23                                |
| Policy Owner   | Information Security Manager              |
| Approved By    | Chief Information Security Officer (CISO) |
| Classification | Internal                                  |

# 1. Purpose

This policy establishes requirements for password creation, management, storage, and protection to ensure the security of SecureBank Financial Services systems and data.

The objective of this policy is to reduce the risk of unauthorized access, protect customer and financial information, and ensure compliance with PCI-DSS, SOX, FFIEC, and NIST SP 800-63B requirements.

# 2. Scope

## 2.1 Applicability

This policy applies to:

* All employees
* Contractors and consultants
* Third-party vendors
* System administrators

## 2.2 Systems/Assets Covered

* Core Banking System
* Customer Portal
* Employee Workstations
* Administrative Systems
* Development Environment
* VPN Services
* Cloud Services

## 2.3 Exclusions

* Customer-managed personal accounts not administered by SecureBank.
* Third-party systems not connected to SecureBank infrastructure.

# 3. Policy Statements

## 3.1 Password Requirements

All users must create strong passwords that meet organizational security standards.

### Requirements:

* Passwords must contain a minimum of 12 characters.
* Administrative accounts must use at least 15 characters.
* Passwords must contain a combination of uppercase letters, lowercase letters, numbers, and special characters.
* Common, weak, or previously breached passwords are prohibited.
* Passwords must not contain personal information or company names.
* Users may not reuse their last 10 passwords.

## 3.2 Password Management

Passwords must be securely managed throughout their lifecycle.

### Requirements:

* Passwords must be changed immediately if compromise is suspected.
* Password resets require identity verification.
* Accounts will be locked after 5 failed login attempts.
* Locked accounts remain unavailable for 15 minutes or until reset by IT.
* User sessions automatically expire after 15 minutes of inactivity.
* Administrative sessions automatically expire after 10 minutes of inactivity.

## 3.3 Multi-Factor Authentication (MFA)

Multi-Factor Authentication is required for access to critical systems.

### Requirements:

* MFA is mandatory for remote access and VPN connections.
* MFA is mandatory for all privileged accounts.
* MFA is required for administrative systems and the core banking system.
* Approved methods include authenticator applications, hardware tokens, and biometrics.
* SMS authentication should only be used when stronger methods are unavailable.

## 3.4 Password Storage

Passwords must be securely stored and protected against disclosure.

### Requirements:

* Passwords must never be stored in plain text.
* Approved hashing algorithms include Argon2, bcrypt, and PBKDF2.
* Unique salts must be used for all stored passwords.
* Approved password managers should be used for credential storage.

## 3.5 Privileged Accounts

Privileged accounts require enhanced security controls.

### Requirements:

* MFA is mandatory.
* Shared administrator accounts are prohibited.
* All privileged account activities must be logged and monitored.
* Privileged credentials must be managed through a PAM solution.
* Regular reviews of privileged account access must be performed.

# 4. Roles and Responsibilities

| Role                  | Responsibilities                                               |
| --------------------- | -------------------------------------------------------------- |
| Executive Management  | Approve policy, allocate resources, demonstrate commitment     |
| IT Security Team      | Implement controls, monitor compliance, report violations      |
| Department Managers   | Ensure team compliance, report issues, support training        |
| All Employees         | Comply with policy, report incidents, complete training        |
| System Administrators | Manage privileged accounts, enforce MFA, maintain PAM controls |

# 5. Compliance

## 5.1 Monitoring

Compliance will be monitored through authentication logs, access reviews, security monitoring tools, and account management reports.

## 5.2 Reporting

Security incidents, suspected password compromise, and policy violations must be reported immediately to the IT Security Team.

## 5.3 Auditing

Password controls and authentication systems will be audited annually and after significant system changes.

# 6. Enforcement

## 6.1 Violations

Violations of this policy may result in:

* Verbal warning
* Written warning
* Suspension of access privileges
* Disciplinary action up to and including termination
* Legal action where applicable

## 6.2 Reporting Violations

Report suspected violations to:

Information Security Team via the corporate ticketing system or [security@securebank.com](mailto:security@securebank.com).

# 7. Exceptions

## 7.1 Exception Process

Exceptions to this policy require:

1. Written request to the Information Security Manager
2. Business justification
3. Risk assessment
4. Compensating controls where applicable
5. Formal approval and documentation

## 7.2 Exception Duration

All exceptions must have a defined end date and be reviewed annually.

# 8. Definitions

| Term             | Definition                                                                   |
| ---------------- | ---------------------------------------------------------------------------- |
| MFA              | Multi-Factor Authentication requiring two or more authentication factors     |
| PAM              | Privileged Access Management used to secure administrative accounts          |
| Password Hashing | Process of converting passwords into unreadable values for secure storage    |
| Account Lockout  | Temporary restriction of account access after multiple failed login attempts |

# 9. Related Documents

* Access Control Policy
* Authentication Standard
* Password Reset Procedure
* NIST SP 800-63B Digital Identity Guidelines
* OWASP Authentication Cheat Sheet
* PCI-DSS v4.0 Requirement 8
* FFIEC Authentication Guidance

# 10. Revision History

| Version | Date       | Author        | Description     |
| ------- | ---------- | ------------- | --------------- |
| 1.0     | 2026-06-23 | Security Team | Initial Release |

# 11. Acknowledgment

By accessing company systems, all users acknowledge they have read, understood, and agree to comply with this policy.

For formal acknowledgment tracking, use the company's policy acknowledgment system.

# End of Policy Document
