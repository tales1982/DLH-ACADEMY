# 7. The Asset Registry

**Goal:** Build a comprehensive, structured asset inventory by consolidating information from multiple sources accumulated throughout the project.

## Context

James Chen needs a single authoritative source of truth for MedDefense assets. Right now, the information is scattered across your Environment Summary (Task 0), the incidents you analyzed (Tasks 1-2), the physical observations (Task 3), the controls you documented (Task 4) and the MRI situation (Task 6).

> "I've also asked Sarah Park to pull a network scan summary," James says, handing you a new document. "Cross-reference everything. If an asset appears in one source but not another, I want to know about it."

## Provided Files

- `network-scan-summary.txt` (a simplified Nmap-style scan output covering MedDefense's three sites: IP addresses, hostnames, detected OS, open ports and services)

## Instructions

Consolidate **ALL** asset information from every source you have used in this project. Cross-reference the onboarding packet (Task 0), incidents (Tasks 1-2), physical observations (Task 3), control artifacts (Task 4), the MRI situation (Task 6) and the new network scan summary.

Produce an **Asset Registry** with the following fields for each asset:

```
Asset ID | Name | Type | Location | Owner (Dept) | OS/Platform | Critical Services | Network Segment | Status | Notes
```

- **Asset Types:** Server, Endpoint, Network Device, IoT Medical, Data Store, Application, Physical Infrastructure
- **Status:** Active, Deprecated, Shadow IT (unmanaged), Unknown

Your registry must include a minimum of **20 distinct assets**.

After the registry, provide a **Reconciliation Notes** section that documents:

1. Assets found in the network scan that do **NOT** appear in any documentation (shadow IT or undocumented systems).
2. Assets mentioned in documentation that do **NOT** appear in the network scan (decommissioned? offline? different network?).
3. Any discrepancies or contradictions between sources.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `7-asset_registry.md`
