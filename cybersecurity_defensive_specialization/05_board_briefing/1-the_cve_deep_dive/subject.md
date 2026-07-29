# 1. The CVE Deep Dive

**Goal:** Research CVE-2023-27997 on NVD and assess its exploitability using the tools you mastered in Projects 1x02 and 1x04.

## Context

The advisory names CVE-2023-27997 as the initial access vector. You have the tools and the skills to research this CVE with the same rigor you applied to the scan findings in 1x02. This time, the urgency is not academic. This CVE is being actively exploited against hospitals in your region right now.

## Instructions

### Part 1 — NVD Research

Go to nvd.nist.gov and research CVE-2023-27997. Document:

- Full description
- CVSS v3.1 vector string and base score
- CWE classification
- Affected products and versions
- References (vendor advisory, patches)

### Part 2 — Exploit Assessment

Using searchsploit and Exploit-DB, assess exploit availability:

- Is there a public exploit?
- Is this CVE in the CISA KEV catalog?
- What is your Exploitability Score (1-5, using the scale from 1x02 T4)?

### Part 3 — MedDefense CVSS Contextualization

Using the NIST CVSS Calculator, apply Environmental Metrics specific to MedDefense's FortiGate. Consider:

- The FortiGate is the ONLY perimeter defense (no redundancy)
- It terminates all VPN tunnels (all 3 sites depend on it)
- It sits on kill chain #1, #2 and #3 from 1x01
- The support contract has expired (patching requires renewal first)

What is the adjusted CVSS score for MedDefense? Is it higher or lower than the base score?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x05_board_briefing`
- **File:** `1-cve_deep_dive.md`
