# 1. Domain Risk Findings Extractor

**Goal:** Produce the actionable findings inventory that drives the Windows hardening workflow.

## Context

Task 0 maps the domain baseline, but baseline data alone is not enough. The security engineer needs a findings inventory that identifies exactly what must be remediated, which task remediates it, and how severe the risk is. This task connects Active Directory weaknesses to password policy, audit policy, Kerberos hardening, service account control, GPO hardening, and stale object cleanup.

## Instructions

Write `1-domain_findings.ps1`.

The script must audit `meddefense.local` and generate `domain_security_findings.json`.

It must identify:

- Accounts with `PasswordNeverExpires`, including account name, enabled state, group memberships, password last set date, and whether it is a service account.
- Disabled accounts in privileged groups: Domain Admins, Enterprise Admins, and G_IT_Admins.
- Stale computer objects with no logon/authentication activity in 90+ days.
- Password and lockout policy gaps against the Windows Fortress target state: minimum length 14, complexity enabled, history 24, lockout threshold 5.
- Missing audit visibility for process creation, special logon, account management, object access, and PowerShell/Sysmon readiness.
- Service account risks: interactive logon allowed, unconstrained delegation, DES-only flag, privileged membership, stale password, or suspicious last logon.
- Weak GPO security posture: default-only GPOs, no MedDefense hardening GPOs, or GPOs without clear security purpose.

Each finding object must include `id`, `severity`, `category`, `asset`, `evidence`, `risk`, `recommended_remediation`, and `mapped_task`.

## Expected Output

```
PS> .\1-domain_findings.ps1
[CRITICAL] Password policy minimum length: 7
[CRITICAL] Account lockout: not configured
[CRITICAL] Kerberos DES/RC4 enabled
[HIGH] 6 accounts with PasswordNeverExpires
[HIGH] 3 service accounts with unconstrained delegation
[HIGH] Advanced Audit Policy: not configured
[MEDIUM] Stale computer objects: 2
[MEDIUM] No MedDefense hardening GPOs present

Findings: 9
Critical: 3
High: 4
Medium: 2
Report saved to: domain_security_findings.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `1-domain_findings.ps1`, `domain_security_findings.json`
