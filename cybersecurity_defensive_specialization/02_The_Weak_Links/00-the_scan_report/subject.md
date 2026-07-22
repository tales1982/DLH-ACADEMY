# 0. The Scan Report

**Goal:** Develop the professional reflex of reading a scan report for structure and context before diving into individual findings.

## Context

Thirty-one findings. Four Critical. Seven High. The temptation is to jump straight to the red ones. Resist it.

A scan report is a dataset, not an analysis. Before you investigate any single finding, you need to understand the shape of the data: how many findings, what severity distribution, which systems are most affected, what the scanner covered and, critically, what it did not cover.

This is the same discipline that separates a junior analyst from a senior one. The junior panics at "4 Critical." The senior asks: "4 Critical out of how many? On which systems? Are they on the same asset? Are they related?"

## Provided Files

- `meddefense-vulnerability-scan.txt`

## Instructions

Read the entire scan report from beginning to end. Do not research any individual finding yet. Then produce a **First Impressions Summary** containing:

1. **Scan Metadata:** What was scanned, when, by whom, what scan policy was used, what was NOT scanned (read the methodology notes).
2. **Finding Distribution:** Count by severity (Critical/High/Medium/Low/Informational). Which severity level has the most findings?
3. **Asset Heat Map:** Which hosts appear most frequently in the findings? List the top 5 hosts by finding count. Cross-reference with your Asset Registry (1x00 T7) to identify what role each host plays.
4. **First Observations:** Based on a quick read (not deep research), what patterns do you notice? Are the Critical findings concentrated on one system or spread across several? Do any findings appear related to each other? Does anything surprise you?
5. **Scan Limitations:** What does this scan NOT tell you? What assets, services or vulnerability types are outside its scope?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `0-first_impressions.md`
