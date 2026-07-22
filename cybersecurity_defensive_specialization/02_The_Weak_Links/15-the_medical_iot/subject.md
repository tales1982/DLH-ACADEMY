# 15. The Medical IoT

**Goal:** Assess vulnerabilities in connected medical devices with specific attention to patient safety implications.

## Context

A vulnerability on a workstation and a vulnerability on an infusion pump are not the same category of problem. One can steal data. The other can affect dosing. The scan report found findings on both Philips monitors and BD Alaris pumps. The BD bulletin is real. The risk is real.

## Instructions

Analyze the medical IoT findings from the scan report (Findings 010, 016, 024 and any related findings).

1. **BD Alaris Assessment:** Research the BD Alaris security bulletin for firmware 12.1.2. (Search for "BD Alaris security bulletin" or check bd.com.) Document: what vulnerability is described, what the vendor recommends as mitigation and whether MedDefense has implemented the recommendation.
2. **Philips IntelliVue Assessment:** The monitors expose unauthenticated web interfaces and HL7 ports on the flat network. What data flows through these interfaces? What would an attacker with network access be able to see or do?
3. **Patient Safety Dimension:** In 3-4 sentences, explain why medical device vulnerabilities are in a different risk category than IT system vulnerabilities. What is the worst-case scenario for a compromised infusion pump vs a compromised workstation?
4. **Remediation Challenge:** Why is patching medical devices harder than patching IT systems? Identify at least 3 factors specific to medical devices (regulatory, operational, vendor dependency).

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `15-medical_iot.md`
