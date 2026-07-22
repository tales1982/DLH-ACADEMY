# 1. The CVE Ecosystem

**Goal:** Navigate the National Vulnerability Database to research specific CVEs and understand the global vulnerability identification system.

## Context

Every CVE in that scan report is an entry in a global registry. Behind each identifier is a story: who discovered the flaw, what it affects, how severe it is, whether a patch exists, whether an exploit exists. The NVD is where those stories live.

You will use NVD constantly as a security professional. This task builds the navigation reflex.

## Instructions

Select 3 CVEs from the scan report: one Critical, one High, and one Medium. Go to nvd.nist.gov and research each one.

For each CVE, document:

- **CVE ID:** [e.g., CVE-2021-44790]
- **NVD URL:** [direct link to the NVD page]
- **Description:** [In your own words - do not copy the NVD description verbatim]
- **Affected Products:** [List at least 3 affected products/versions from the NVD CPE data]
- **CVSS v3.1 Vector String:** [Copy the full vector]
- **CVSS Base Score:** [Score]
- **CWE:** [The CWE ID and name listed on the NVD page]
- **References:** [List 3 reference links from the NVD page and identify what each is: vendor advisory, patch, write-up, PoC, etc.]
- **Published Date:** [When was this CVE published?]
- **Last Modified:** [When was it last updated?]

After the 3 CVE analyses, answer these questions:

1. What is the structure of a CVE ID? (What do the year and number signify?)
2. What is a CNA (CVE Numbering Authority) and what role does it play?
3. What lifecycle states can a CVE have? (Reserved, Published, Rejected, explain each.)
4. Find one CVE on NVD that has a status of "Rejected." Why was it rejected?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `1-cve_ecosystem.md`
