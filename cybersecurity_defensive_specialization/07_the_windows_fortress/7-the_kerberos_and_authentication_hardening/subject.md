# 7. Kerberos and Authentication Hardening

**Goal:** Disable weak Kerberos encryption types and harden authentication protocols to block Kerberoasting and credential theft attacks.

## Context

Finding from 1x02: "Active Directory supports DES and RC4 Kerberos encryption types." The Crimson Tide advisory confirmed: "In 3 of 5 cases, the attacker exploited Kerberoasting (RC4-encrypted service tickets cracked offline)." RC4 tickets can be cracked in minutes with hashcat. AES-256 tickets take years. The fix is straightforward: disable DES and RC4, enforce AES-only. But if any legacy application authenticates using RC4, disabling it breaks that authentication.

## Instructions

Write a PowerShell script `7-auth_hardening.ps1` that:

- Queries the current Kerberos encryption types supported by the domain
- Identifies any service accounts with the "Use DES encryption types" flag
- Checks each service account's SPN configuration
- Disables DES on all flagged accounts
- Configures the domain to support only AES128 and AES256 for Kerberos
- Disables NTLMv1 (allows only NTLMv2 as fallback)
- Configures Credential Guard awareness
- Verifies the new configuration

## Expected Output

```
PS> .\7-auth_hardening.ps1
[*] Current Kerberos types: DES, RC4, AES128, AES256
    [!] DES enabled - trivially breakable
    [!] RC4 enabled - Kerberoastable
[*] Accounts with DES flag...
    svc_sql: UseDESKeyOnly = True          [!]
[*] Service Principal Names...
    svc_backup: HTTP/backup.meddefense.local
    svc_ehr: HTTP/ehr.meddefense.local
    svc_sql: MSSQLSvc/sql.meddefense.local:1433
    [!] All 3 SPNs are Kerberoastable targets
[*] Remediating...
    svc_sql: Clearing DES flag              [DONE]
    Supported encryption: AES128 + AES256   [SET]
    NTLMv1: Refused (LmCompatibilityLevel=5) [SET]
[*] Verifying...
    Kerberos: AES128, AES256 only           [VERIFIED]
    NTLM: v2 only                           [VERIFIED]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `7-auth_hardening.ps1`
