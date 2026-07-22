# 11. The False Positives

**Goal:** Identify and document false positives in the scan report, and understand why validation before action is essential.

## Context

Acting on a false positive wastes resources. Ignoring a true positive creates risk. Telling the difference is one of the most underrated skills in vulnerability management.

The scan report contains 2-3 findings that, upon investigation, are not actual vulnerabilities in MedDefense's specific context. The scanner noted them for investigation by SecurePoint, who flagged at least one explicitly. Your job is to find them all and prove why they are false positives.

## Instructions

Review the scan report for findings that may be false positives. Identify at least 2 and for each:

- **Finding ID:** [From scan report]
- **Reported Vulnerability:** [What the scanner claimed]
- **Why It Is a False Positive:** [Technical explanation]
- **Validation Method:** [How would you confirm this is a FP? What test or check?]
- **Risk of Acting on This FP:** [What resources would be wasted if you treated this as a real finding?]
- **Risk of Not Validating:** [What would happen if this were NOT a FP and you dismissed it?]

**Hint:** Read the scan report carefully. SecurePoint flagged at least one finding with a note about potential false positive status. There are others that require your own analysis.

After the FP analysis, answer: In a scan report of 31 findings, what is a reasonable expected false positive rate for an automated scanner? Why is manual validation essential before committing remediation resources?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `11-false_positives.md`
