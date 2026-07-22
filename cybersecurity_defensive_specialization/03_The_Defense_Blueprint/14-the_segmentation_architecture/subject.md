# 14. The Segmentation Architecture

**Goal:** Design a network segmentation plan that transforms MedDefense's flat network into a defensible architecture.

## Context

The flat network appeared in every kill chain you built in 1x01. It amplified every vulnerability in 1x02. It is the single architectural weakness whose resolution has the greatest cascading effect on MedDefense's risk posture. Now you design the fix.

This task is different from the others because it is a design exercise. You are not analyzing or assessing. You are creating a network architecture that does not yet exist.

## Instructions

Design a network segmentation plan for MedDefense with the following deliverables:

### Part 1 — Zone Definition

Define at least 5 network zones (VLANs) with their purpose, what systems belong in each and what traffic flows are permitted between zones:

- Server zone (EHR, billing, file server, AD)
- Clinical workstation zone (nurse stations, physician workstations)
- Medical device zone (monitors, pumps, PACS, MRI)
- Management zone (IT admin workstations, security tools)
- Guest/IoT zone (non-clinical devices, visitor WiFi)

For each zone: name, IP range, systems included, allowed outbound connections and allowed inbound connections.

### Part 2 — Firewall Rules

Write 10 critical firewall rules (in pseudocode format: `source zone → destination zone : port/protocol : allow/deny`) that enforce the segmentation. Include at least 2 deny rules and explain what each rule prevents.

### Part 3 — Kill Chain Impact

Take your #1 kill chain from 1x01 (the ransomware scenario). Walk through it step by step and identify at which step(s) the segmentation would have broken the chain. Estimate the percentage of your top 5 kill chains that would be disrupted by this segmentation design.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `14-segmentation_architecture.md`
