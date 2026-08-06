# The Windows Fortress

> "Attackers don't hack in. They log in." — CISA Director Jen Easterly, 2023

## Introduction

Linux is hardened. billing-srv-01, web-srv-01 and log-srv-01 are locked down, monitored by auditd and compliant with the CIS Benchmark to 84 points. That was the easy part. Because Linux runs 3 servers at MedDefense. Windows runs everything else.

280 workstations across 3 sites. 2 domain controllers managing authentication for 2,000 staff. Active Directory controlling every login, every password policy, every security setting across the entire organization. Group Policy Objects that have never been reviewed, some dating back to when Marcus Webb was still here. Sysmon nowhere to be found. PowerShell Script Block Logging disabled. AppLocker non-existent. The Windows Firewall turned off on 2 of 3 profiles. And the Crimson Tide advisory (1x05) explicitly documented that in all 5 hospital breaches, the attacker used Group Policy to deploy ransomware across every Windows endpoint simultaneously.

Windows is where the attacker lives after initial access. Active Directory is the crown jewel. If the attacker owns AD, they own everything: every workstation, every server, every user, every password. The 5 hospitals hit by Crimson Tide all had one thing in common: weak AD configurations that the attacker exploited for lateral movement, privilege escalation and ransomware deployment.

This project teaches you to think in Windows. Not as a Windows administrator, but as a security engineer who uses Active Directory, Group Policy, Sysmon and PowerShell as defensive weapons. Every script you write will be in PowerShell. Every configuration will be deployed through GPO. Every detection capability will generate Windows Events that become the telemetry you export and analyze as an analyst in Module 3.

## Why this matters

Linux hardening protects 3 servers. Windows hardening protects 280 workstations and the domain controllers that authenticate every human in the organization. The blast radius of a Windows misconfiguration is not one server. It is the entire enterprise. When the Crimson Tide attacker created a malicious GPO on the domain controller, that GPO executed on every Windows machine in the domain within 90 minutes. One misconfiguration. 280 compromised endpoints.

## Context

Week seven at MedDefense. Wednesday morning.

James Chen walks in with a printed screenshot of the Crimson Tide advisory, Phase 6 highlighted in yellow:

"Deployment method: Group Policy Object pushed from compromised Domain Controller. Payload: Modified BlackSuit variant. Encryption: AES-256-CBC with RSA-2048 wrapped key. Targets: All Windows systems."

He sets it on your desk.

"The attacker used GPO to deploy ransomware because GPO is how Windows pushes changes to every machine. If we do not lock down our GPOs, harden our AD, deploy Sysmon and monitor our domain controllers, the same GPO mechanism that we use to enforce security will be used against us to deploy the next payload."

Sarah Park adds: "We have a Windows Server 2022 domain controller and the MedDefense domain is live. You have full Domain Admin access. The domain has 14 user accounts across 3 departments, 5 service accounts, and zero security hardening. The password policy minimum is 7 characters. There is no lockout. RC4 Kerberos is enabled. SMBv1 is enabled. I could go on, but I think you get the picture."

James concludes: "I need this domain locked down. GPO hardening, Sysmon deployed, audit policies configured, AppLocker in place, Windows Firewall enforced, service accounts audited. And I need a PowerShell script that validates all of it, because I am going to run that script every week."

## Learning Objectives

By the end of this project, you are expected to be able to explain to anyone, without the help of Google:

### Active Directory Security

- How Active Directory structures authentication and authorization (DCs, OUs, GPOs, groups)
- How Group Policy Objects are applied (LSDOU order), how to diagnose GPO conflicts, and how to deploy security settings via GPO
- The critical Windows Event IDs for security monitoring (4624, 4625, 4648, 4688, 4720, 4726, 4732, 1102) and what each reveals about an attacker's behavior

### Windows Hardening

- How to harden password policy, account lockout and authentication protocols via GPO
- How to configure Advanced Audit Policies for security-relevant event generation
- How to deploy Sysmon with a detection-optimized configuration and tune it for specific threats
- How to configure AppLocker for application allow-listing
- How to harden SMB, RDP, Windows Firewall and service accounts

### Endpoint Detection

- How Sysmon works, what each critical Event ID captures and how to write custom detection rules
- How PowerShell Script Block Logging and Constrained Language Mode reduce the attacker's toolkit
- How Windows Firewall rules enforce network segmentation at the endpoint level

## Resources

**Read or Watch:**

- Active Directory Security
  - Microsoft: Active Directory Security Best Practices — Official hardening guide.
  - CISA: Detecting and Mitigating Active Directory Compromises — Real-world AD attack patterns.
- Sysmon
  - Microsoft Sysinternals: Sysmon — Official documentation and download.
  - SwiftOnSecurity Sysmon Config — The reference detection configuration.
- Windows Hardening
  - CIS Benchmark for Windows Server 2022 — Download the PDF.
  - Microsoft Security Baselines — Microsoft's own hardening recommendations.

**Man or Help:**

`Get-Help Set-ADDefaultDomainPasswordPolicy` · `Get-Help New-GPO` · `Get-Help Set-GPRegistryValue` · `Get-Help Get-WinEvent` · `Get-Help New-NetFirewallRule`

## Requirements

### General

- A `README.md` file, at the root of the folder of the project, is mandatory.
- All your files should end with a new line.

### PowerShell Scripting

- All your scripts must have the `.ps1` extension.
- All scripts must include a comment header with: script name, purpose, author and date.
- All scripts must use `Set-StrictMode -Version Latest` and `$ErrorActionPreference = "Stop"` for robust error handling.

## Lab Environment

| Parameter | Value |
|---|---|
| Lab Name | DC01 |
| Operating System | Windows Server 2022 |
| Domain | meddefense.local |
| Username | analyst |
| Password | Analyst2026! |
| Privileges | Domain Admin |
| Access Method | Direct VM login |
| Tools Used | PowerShell and Windows GUI tools |

**Login Details**

Use the following credentials to log in to the Windows Server 2022 VM:

```
Domain: meddefense.local
Username: analyst
Password: Analyst2026!
```

All lab work is performed directly on the DC01 VM using PowerShell and GUI-based administrative tools.
