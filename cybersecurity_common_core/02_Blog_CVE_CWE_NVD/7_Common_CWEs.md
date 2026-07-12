# 7. Common CWEs

## Examples of Common CWEs and Their Impact

| CWE | Weakness | Real Impact |
|---|---|---|
| **CWE-79** | Cross-Site Scripting (XSS) | Attacker runs malicious scripts in the victim's browser — steals sessions, redirects users |
| **CWE-89** | SQL Injection | Attacker reads, modifies, or deletes the entire database |
| **CWE-22** | Path Traversal | Attacker accesses files outside the intended directory (e.g., `/etc/passwd`) |
| **CWE-787** | Out-of-bounds Write | Corrupts memory — can lead to crashes or full code execution |
| **CWE-306** | Missing Authentication | Critical functions exposed with no login required |
| **CWE-502** | Deserialization of Untrusted Data | Attacker sends a crafted object that executes code on the server |
| **CWE-20** | Improper Input Validation | The root cause behind most injection attacks |
| **CWE-798** | Hard-coded Credentials | Passwords buried in source code — exposed when the repo is leaked |

---

## Real-World Connection

```
CWE-89 (SQL Injection) ──► CVE-2012-1823 (PHP-CGI)       → millions of servers exposed
CWE-79 (XSS)           ──► CVE-2021-39141 (Spring)       → session hijacking at scale
CWE-502 (Deserialization) ► CVE-2017-9805  (Apache Struts) → Equifax breach (147M records)
```

Every CVE has a CWE behind it. Fix the CWE pattern — prevent the CVE.

---

## How to Prioritize in a Software Project

### Step 1 — Start with the CWE Top 25
The **CWE Top 25** is updated yearly and ranks weaknesses by frequency and severity.
Start there. These are the most common root causes of real breaches.

### Step 2 — Score by impact on your context

Ask three questions for each CWE found:

| Question | Weight |
|---|---|
| Can it be exploited remotely? | High priority if yes |
| Does it expose sensitive data or allow code execution? | High priority if yes |
| Is the affected component internet-facing? | High priority if yes |

### Step 3 — Fix order

```
1st  →  CWE-89, CWE-79, CWE-306   (injection + missing auth = immediate risk)
2nd  →  CWE-502, CWE-22, CWE-787  (complex but critical impact)
3rd  →  CWE-20, CWE-798            (foundational — fix these to prevent future issues)
```

### Step 4 — Shift left
Do not wait for testing to find CWEs. Use **SAST tools during development** so weaknesses are caught before they reach the codebase.

| Phase | Action |
|---|---|
| Design | Threat model against CWE Top 25 |
| Coding | Apply secure patterns (parameterized queries, input validation) |
| Code Review | Flag CWE violations with specific IDs |
| CI/CD Pipeline | Block merge if critical CWEs are detected by SAST |

---

## Summary

> The most dangerous CWEs are the ones developers write without realizing.
> Prioritize by exploitability and impact — then fix the root cause, not just the symptom.
