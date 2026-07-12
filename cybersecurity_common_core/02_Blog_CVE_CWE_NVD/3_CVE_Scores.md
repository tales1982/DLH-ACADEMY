# 3. CVE Scores

## How to use CVEs and CVSS scores effectively?

A CVSS score is a number from **0 to 10** that tells you how dangerous a vulnerability is.
Organizations use it to answer one simple question: **which vulnerability do I fix first?**

| Score | Severity | Action |
|---|---|---|
| 9.0 – 10.0 | Critical | Fix immediately (24–72h) |
| 7.0 – 8.9 | High | Fix within 1–2 weeks |
| 4.0 – 6.9 | Medium | Fix in the next patch cycle |
| 0.1 – 3.9 | Low | Schedule when possible |

---

## Strategies for integrating CVE into a vulnerability management program

### 1. Scan regularly
Use tools like Nessus, Qualys, or OpenVAS to automatically detect which CVEs affect your environment.

### 2. Prioritize by context — not just by score
A CVE with score 9.0 on an isolated internal server may be less urgent than a CVE with score 7.0 on an internet-facing system.

Ask:
- Is this system exposed to the internet?
- Is there a public exploit available?
- Is this system critical to the business?

### 3. Patch fast, document everything
Apply patches within the SLA defined by severity. Always record what was patched, when, and by whom — this is essential for audits and compliance.

### 4. Monitor threat intelligence
Follow feeds like **CISA KEV (Known Exploited Vulnerabilities)** to know which CVEs are actively being exploited in the wild — these jump to the top of the priority list regardless of score.

### 5. Review and repeat
Vulnerability management is a cycle, not a one-time task. Scan → Prioritize → Patch → Verify → Repeat.

---

## Summary

> The CVSS score tells you *how bad* a vulnerability is. Context tells you *how urgent* it is. Use both together to make smart decisions with limited resources.
