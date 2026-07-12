# 9. Relationship between CWE, CVE, and CVSS

## The Three Frameworks — One Sentence Each

- **CWE** — describes the *type of weakness* in the code (the root cause)
- **CVE** — identifies a *specific vulnerability* in a specific product (the incident)
- **CVSS** — measures *how severe* that vulnerability is (the score)

---

## How They Connect

```
CWE-89: SQL Injection          ← the weakness TYPE (why it exists)
        │
        ▼
CVE-2012-1823: SQL Injection   ← the specific INSTANCE (what is vulnerable)
in PHP-CGI                       (product, version, date)
        │
        ▼
CVSS Score: 7.5 (High)         ← how DANGEROUS it is
AV:N / AC:L / PR:N / UI:N       (exploitability + impact)
```

> CWE explains the **cause**.
> CVE names the **event**.
> CVSS measures the **risk**.

---

## A Real-World Analogy

Think of a car accident report:

| Framework | Analogy |
|---|---|
| **CWE** | The road had no guardrail (design flaw — root cause) |
| **CVE** | On March 5th, a car fell off Highway 9 at km 42 (specific incident) |
| **CVSS** | The accident caused 3 deaths and blocked traffic for 6 hours (severity score) |

Each layer adds a different dimension of understanding.

---

## How They Work Together in Vulnerability Management

### Step 1 — Scanner detects a CVE
A vulnerability scanner finds `CVE-2021-44228` (Log4Shell) on a server.

### Step 2 — CVSS tells you how urgent it is
CVSS Score: **10.0 — Critical**
→ Drop everything. Patch now.

### Step 3 — CWE tells you why it happened
CWE-502: Deserialization of Untrusted Data
→ The root cause is that the application blindly trusted external input.
→ Search the entire codebase for similar patterns.

### Step 4 — Fix the instance AND the root cause
```
Short term  →  Patch the CVE (apply Log4j update)
Long term   →  Fix the CWE pattern across all projects
               Train developers on CWE-502
               Add SAST rule to detect it in CI/CD
```

---

## The Full Strategy

| Framework | Role in the Strategy | Who Uses It |
|---|---|---|
| **CWE** | Prevents vulnerabilities from being written | Developers, architects |
| **CVE** | Identifies what needs to be patched right now | Security ops, sysadmins |
| **CVSS** | Determines the order of remediation | Security managers, risk teams |

---

## Why you need all three

- **CVSS without CVE** → you have a score but don't know what to patch
- **CVE without CVSS** → you know what's broken but not how urgent it is
- **CVE without CWE** → you patch the instance but write the same flaw again next sprint
- **All three together** → you patch fast, prioritize correctly, and prevent recurrence

---

## Summary

> CWE, CVE, and CVSS are not competing frameworks — they are **layers of the same answer**.
> CWE prevents. CVE identifies. CVSS prioritizes.
> An organization that uses all three does not just react to vulnerabilities — it systematically reduces the chance of creating them.
