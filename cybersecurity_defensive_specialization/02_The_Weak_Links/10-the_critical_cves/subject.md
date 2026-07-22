# 10. The Critical CVEs

**Goal:** Conduct a comprehensive deep analysis of the 5 most critical findings from the scan report.

## Context

Surface-level triage is done. Now go deep on the findings that matter most. For each critical finding, you are building the complete intelligence package that a SOC manager needs to make a patching decision: technical details, exploit status, business context and threat correlation.

## Instructions

Select the 5 findings from the scan report that you assess as most critical (not necessarily the 5 with the highest CVSS — use your judgment from the earlier tasks). For each:

```
Finding: [Scan report Finding ID]
CVE: [If applicable]
Host: [From scan report]
Asset Role: [From 1x00 Asset Registry - what does this system do?]
Asset Criticality: [From 1x00 Criticality Matrix - CIA ratings]

Technical Analysis:
  Vulnerability Description: [Your own words]
  CVSS Base Score: [From NVD]
  Exploit Availability: [From T4 - Exploitability Score 1-5]
  CISA KEV Status: [Listed or not]
  CWE: [From T3]

Contextual Analysis:
  Network Exposure: [Is this reachable from the internet? From the flat network? From which subnets?]
  Kill Chain Position: [Does this finding appear in any of the 5 kill chains from 1x01 T10? Which step?]
  Threat Actor: [Which actor type from 1x01 T6 would most likely exploit this? Via which vector?]
  Related Findings: [Does this finding combine with other findings to create a chain? Reference Finding IDs.]

Adjusted Priority: [Critical/High/Medium/Low - your assessment after full contextual analysis]
Justification: [Why this priority, referencing all evidence above]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `10-critical_cves.md`
