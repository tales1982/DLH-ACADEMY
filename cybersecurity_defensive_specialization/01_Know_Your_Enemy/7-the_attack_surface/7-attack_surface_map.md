# 7. The Attack Surface Map

**Analyst:** [Your name]
**Date:** [Date]

## Section 1: External Surface

| Entry Point | Asset Behind It | Protection (1x00 Control) | Gap (1x00 Gap ID) |
|---|---|---|---|
| Patient Portal | web-srv-01 | | |
| VPN Endpoints | | | |
| Email (O365) | | | |
| Public Website | | | |
| DNS | | | |
| [Other, from network scan] | | | |

## Section 2: Internal Surface

| Entry Point | Asset | Exposure (Port/Service) | Why It Matters in a Flat Network |
|---|---|---|---|
| MySQL | billing-srv-01 | 3306 | |
| PostgreSQL | ehr-db-01 | 5432 | |
| NAS Management Interface | | | |
| FortiGate Admin | | | |
| Medical IoT Web Interfaces | | | |
| Windows XP | MRI workstation | | |
| Windows Server 2012 R2 | print-srv-01 | | |
| PACS Default Credentials | | | |

## Section 3: Human Surface

| Role | Access | Why Targetable | Training/Control Gap |
|---|---|---|---|
| Clinical Staff | EHR access | | |
| Reception | Physical access point | | |
| IT Staff | Elevated privileges | | |
| Executives | BEC targets | | |
| External Contractors | | | |

## Surface Assessment Summary

[One paragraph: which surface represents the greatest risk today, and why?]

---

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `7-attack_surface_map.md`
