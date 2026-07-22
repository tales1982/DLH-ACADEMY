# 3. The Weakness Beneath

**Goal:** Use the CWE taxonomy to identify weakness patterns behind individual CVEs.

## Context

CVE tells you "what is broken." CWE tells you "why it keeps breaking." If three different CVEs on three different products all trace back to CWE-787 (Out-of-bounds Write), that is not a coincidence, it is a pattern. Understanding the pattern lets you predict where the next vulnerability will appear, not just react to the current one.

## Instructions

Go to cwe.mitre.org.

### Part 1: Tracing CVEs to CWEs

Select 3 CVEs from the scan report that have CWE assignments on their NVD page. For each:

- Identify the CWE (ID + name)
- Go to the CWE page and read the description
- Find the CWE's position in the hierarchy (is it a child of a broader weakness? which parent?)
- Check: is this CWE in the CWE Top 25 Most Dangerous Software Weaknesses?

### Part 2: Pattern Analysis

Look across all 31 findings in the scan report. How many distinct CWEs can you identify? Are there findings that share the same underlying CWE even though they are different CVEs? Identify at least one such pattern.

### Part 3: Recommendation

Based on the CWE patterns you found in the MedDefense scan: if MedDefense were developing software internally, which one CWE category should their developers be trained to avoid first, and why?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `3-cwe_analysis.md`
