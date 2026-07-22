# 2. The CVSS Deconstruction

**Goal:** Master the CVSS v3.1 scoring system by deconstructing, constructing and comparing scores using the NIST Calculator.

## Context

A CVSS score without understanding is a number. A CVSS score with understanding is a decision tool. This task turns the former into the latter.

Open the NIST CVSS v3.1 Calculator in your browser. You will use it for all three exercises.

## Instructions

### Exercise 1: Deconstruction

Take the following CVSS vector string from the scan report (Finding 001, CVE-2021-44790):

```
CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H
```

For each component, explain:

- What the abbreviation stands for
- What the selected value means
- What other values are possible and how they would change the score
- Why this specific value was selected for this vulnerability

Then answer: If the Attack Vector was changed from Network (N) to Local (L), what would the new score be? Calculate it on the NIST Calculator and explain why the score changes.

### Exercise 2: Construction

You discover a vulnerability with these characteristics:

- Exploitable only from the local network (not the internet)
- Exploitation is complex and requires specific conditions
- The attacker needs low-level privileges
- No user interaction is needed
- The vulnerability only affects the targeted system (scope unchanged)
- Successful exploitation compromises confidentiality completely
- No impact on integrity
- No impact on availability

Build the CVSS vector string manually. Then enter it into the NIST Calculator and verify your score. Document the vector string, the calculated score and the severity rating.

### Exercise 3: Comparison

Select two findings from the scan report: one with a CVSS score above 9.0 and one with a score between 5.0 and 7.0. Enter both vector strings into the calculator side by side. Identify the specific components that explain the score difference. Which components have the biggest impact on the final score?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `2-cvss_analysis.md`
