# 11. Windows Firewall Lockdown

**Goal:** Configure Windows Firewall with a default-deny inbound policy and service-specific allow rules, implementing endpoint-level network segmentation.

## Context

The domain reconnaissance found: Domain profile ON but permissive, Private and Public profiles OFF. This means any application can listen on any port with no restriction. The firewall should enforce the principle of least privilege at the network level: only the services that MUST be reachable are allowed inbound.

## Instructions

Write a PowerShell script `11-firewall_hardening.ps1` that:

- Captures the current firewall state
- Enables ALL three profiles (Domain, Private, Public) with default-deny inbound
- Creates allow rules for required services only:
  - RDP (TCP 3389) from management subnet only (10.10.3.0/24)
  - DNS (TCP/UDP 53) for DC operation
  - LDAP (TCP 389) for AD authentication
  - Kerberos (TCP/UDP 88) for AD
  - SMB (TCP 445) from server subnet only
  - WinRM (TCP 5985/5986) from management subnet only
- Enables logging for dropped packets
- Disables legacy allow rules that conflict with the new policy

## Expected Output

```
PS> .\11-firewall_hardening.ps1
[*] Current Firewall State...
    Domain: ON, DefaultInbound: Allow       [!]
    Private: OFF                            [!]
    Public: OFF                             [!]
[*] Setting default-deny on all profiles... [SET]
[*] Creating allow rules...
    MedDef-RDP-Mgmt:  TCP 3389 from 10.10.3.0/24     [CREATED]
    MedDef-DNS:        TCP/UDP 53                    [CREATED]
    MedDef-LDAP:       TCP 389                       [CREATED]
    MedDef-Kerberos:   TCP/UDP 88                    [CREATED]
    MedDef-SMB:        TCP 445 from 10.10.1.0/24     [CREATED]
    MedDef-WinRM:      TCP 5985-5986 from 10.10.3.0/24 [CREATED]
[*] Enabling dropped packet logging...     [SET]
[*] Disabling 42 legacy allow rules...     [DONE]
[*] Verification...
    All 3 profiles: ON, DefaultInbound: Block  [VERIFIED]
    Custom rules: 6 active                     [VERIFIED]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `11-firewall_hardening.ps1`
