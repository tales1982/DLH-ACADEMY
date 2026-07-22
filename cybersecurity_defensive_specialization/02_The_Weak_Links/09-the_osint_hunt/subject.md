# 9. The OSINT Hunt

**Goal:** Use open-source intelligence to identify vulnerabilities affecting MedDefense that the automated scan missed.

## Context

Automated scanners are not omniscient. They check what they are configured to check, against the databases they have. They miss: vulnerabilities disclosed after their plugin database was last updated, vulnerabilities in services they cannot fingerprint, logical vulnerabilities that require context to identify, and weaknesses in configurations they do not have authenticated access to assess.

A complete vulnerability assessment supplements the scan with manual OSINT research.

## Instructions

Using public sources (vendor security advisories, CISA alerts, security blogs, NVD), research vulnerabilities that affect MedDefense's technology stack but were **not** identified in the scan report.

Focus on:

1. **FortiGate FortiOS vulnerabilities** — MedDefense uses a FortiGate 100F. Search NVD for recent FortiOS CVEs. Identify at least 1 critical or high CVE that could affect this device (the scan may not have checked the firewall's own firmware).
2. **Microsoft Office 365 / Entra ID vulnerabilities** — MedDefense uses O365 E3 for the entire organization. The scan did not cover cloud services. Research at least 1 recent vulnerability or attack technique targeting O365 environments.
3. **Synology DSM vulnerabilities** — The backup NAS runs Synology DSM 7. Search NVD for DSM 7 CVEs. Identify at least 1.

For each vulnerability found:

- **Source:** [Where you found it — NVD URL, CISA advisory, vendor page]
- **CVE:** [If applicable]
- **Affected Product:** [MedDefense asset]
- **Why the Scan Missed It:** [Was it out of scope? Unauthenticated scan? Plugin not available?]
- **CVSS / Severity:** [If available]
- **MedDefense Impact:** [What would exploitation mean for MedDefense specifically?]
- **Recommendation:** [What should MedDefense do about this?]

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `9-osint_hunt.md`
