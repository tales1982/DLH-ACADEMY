# 14. Service Account Control

**Goal:** Audit all MedDefense service accounts, identify security weaknesses and implement hardening measures that would have prevented the `svc_ehr` compromise.

## Context

The security findings (Task 1) revealed that service accounts have excessive privileges, old passwords and unconstrained delegation. The `svc_ehr` account's suspicious 3:17 AM logon suggests it may be compromised. Service accounts should never have interactive logon rights, should not be able to create user accounts, and should have delegation restricted to prevent impersonation attacks.

## Instructions

Write a PowerShell script `14-service_accounts.ps1` that:

- Lists all service accounts with their current security posture: group memberships, password age, delegation settings, SPN configuration, last logon
- Flags all findings (excessive privileges, old passwords, unconstrained delegation)
- Remediates:
  - Enable "Account is sensitive and cannot be delegated" for all service accounts
  - Deny interactive logon rights
  - Remove from privileged groups they should not belong to

## Expected Output

```
PS> .\14-service_accounts.ps1
svc_backup:
  Password age: 235 days                  [!]
  Delegation: Unconstrained               [!]
svc_ehr:
  Password age: 250 days                  [!]
  Last logon: 03:17 AM                    [!!!]
svc_sql:
  Password age: 293 days                  [!]
  UseDESKeyOnly: True                     [!]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `14-service_accounts.ps1`
