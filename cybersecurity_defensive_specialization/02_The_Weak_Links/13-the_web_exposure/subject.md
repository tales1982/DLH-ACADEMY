# 13. The Web Exposure

**Goal:** Analyze web-facing vulnerabilities with specific attention to internet-exposed vs internal-only exposure.

## Context

A vulnerability on an internet-facing system and the same vulnerability on an internal-only system are not the same risk. The scan report has web-related findings on the patient portal (internet-facing), the NAS management interface (internal) and the EHR application server (internal but on the flat network). Each requires different analysis.

## Instructions

Identify all web-related findings from the scan report (security headers, TLS configuration, information disclosure, application vulnerabilities). Group them by host and analyze:

For each host with web findings:

- **Host:** [Name and IP]
- **Exposure:** [Internet-facing / Internal-only / Internal but flat network accessible]
- **Findings:** [List all web-related findings affecting this host]
- **Combined Risk:** [Considering all findings together, what is the aggregate risk?]
- **Attack Scenario:** [How would an attacker chain these findings? Reference 1x01 kill chains if applicable]
- **Priority:** [Relative to the other web hosts, which should be fixed first?]

After the per-host analysis, answer: Finding 017 (Tomcat information disclosure) led SecurePoint to manually discover Finding 031 (Ghostcat - CVSS 9.8). What does this tell you about the value of investigating "Medium" findings that reveal version information?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `13-web_exposure.md`
