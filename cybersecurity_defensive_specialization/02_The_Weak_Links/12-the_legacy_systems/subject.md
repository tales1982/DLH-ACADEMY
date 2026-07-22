# 12. The Legacy Systems

**Goal:** Assess the unique risk profile of end-of-life systems that will never receive another security patch.

## Context

An end-of-life system is not just "another vulnerability." It is a system that is permanently vulnerable. Every CVE disclosed from this point forward that affects this OS version will remain unpatched. Forever. The MRI workstation running Windows XP has accumulated over a decade of unpatched critical vulnerabilities. The question is not whether it is vulnerable. The question is how many ways.

## Instructions

The scan report identifies 3 end-of-life systems at MedDefense. For each:

- **System 1:** Windows XP SP3 (10.10.1.70, MRI Workstation)
- **System 2:** Windows Server 2012 R2 (10.10.2.31, Print Server)
- **System 3:** Ubuntu 18.04 LTS without ESM (10.10.2.15, Billing Server)

For each system:

1. **EOL Research:** Go to NVD and search for critical CVEs affecting this OS version published in the last 2 years. How many results? (You do not need to document all of them, count and note the 2 most critical.)
2. **Permanent Exposure:** Explain in 2-3 sentences why EOL is categorically different from "unpatched." Why can you never close this risk through patching alone?
3. **Scan Findings:** List all findings from the scan report that affect this specific system. Are any of them exploitable specifically because the OS is EOL?
4. **Compensating Controls:** What compensating controls were proposed in 1x00 (T6 for the MRI)? Do those controls adequately address the vulnerabilities found in the scan? If not, what additional controls would you recommend?
5. **Business Decision:** If MedDefense can only migrate ONE of these three systems off EOL in the next quarter (budget constraint), which one should it be? Justify using asset criticality (from 1x00) and threat exposure (from 1x01).

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `12-legacy_systems.md`
