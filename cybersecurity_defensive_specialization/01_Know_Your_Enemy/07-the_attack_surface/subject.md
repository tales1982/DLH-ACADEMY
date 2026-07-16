# 7. The Attack Surface

**Goal:** Systematically map MedDefense's attack surface across three dimensions: external, internal and human.

## Context

An attack surface is every point where an attacker could attempt to interact with your systems, your data or your people. It is not the same as a vulnerability. A locked door is part of the attack surface. A locked door with a broken lock is a vulnerability on that surface. Understanding the surface tells you where to look. Finding the vulnerabilities tells you what to fix.

This task uses your Network Scan Summary and Asset Registry from Project 1x00 extensively. Have them open.

## Instructions

Produce a MedDefense Attack Surface Map organized in three sections.

### Section 1: External Surface (accessible from the Internet)

For each entry point, document: what it is, what asset sits behind it, what protection exists (reference 1x00 controls), and what gap is documented (reference 1x00 gaps).

Cover at minimum: patient portal (`web-srv-01`), VPN endpoints, email infrastructure (O365), public website, DNS, and any other externally-reachable service identified in the network scan.

### Section 2: Internal Surface (accessible once inside the network)

This section should reference the flat network finding from 1x00 prominently. Document: exposed services (MySQL on `billing-srv-01`, PostgreSQL on `ehr-db-01`, both accessible network-wide), management interfaces (NAS, FortiGate admin, IoT web interfaces), legacy systems (Windows XP, Server 2012 R2), default credentials (PACS, medical IoT), and the absence of network segmentation.

For each entry: the asset, the exposure (port/service from network scan), and why this matters in a flat network.

### Section 3: Human Surface (people who can be targeted)

Map the human targets by role, access level and social engineering vulnerability. Cover: clinical staff (EHR access, low security training completion), reception (physical access point, first contact), IT staff (elevated privileges, small team = fatigue), executives (BEC targets, strategic information), and external contractors (access beyond MedDefense's direct control).

For each role: what they can access, why they are targetable, and what training or control gap (from 1x00) increases their risk.

### Final Deliverable

At the end, write a **Surface Assessment Summary** (one paragraph): Which of the three surfaces represents the greatest risk for MedDefense today, and why?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `7-attack_surface_map.md`
