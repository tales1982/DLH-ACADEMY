# 8. CWE Taxonomy

## What is CWE Taxonomy?

Taxonomy means **organized classification**. The CWE taxonomy organizes software weaknesses into a structured hierarchy — from broad categories down to specific technical flaws.

```
Pillar (broadest)
  └── Class
        └── Base
              └── Variant (most specific)
```

**Example:**

```
CWE-664: Improper Control of a Resource            ← Pillar
  └── CWE-400: Uncontrolled Resource Consumption   ← Class
        └── CWE-770: Allocation Without Limits     ← Base
              └── CWE-789: Memory Allocation       ← Variant
```

This structure lets teams work at the right level — high level for policies, specific level for code fixes.

---

## How it helps in Vulnerability Assessment

### 1. Consistent classification
When a scanner finds a flaw, it tags it with a CWE ID. Every tool, every team, every vendor speaks the same language — no ambiguity about what kind of weakness was found.

### 2. Root cause analysis
A CVE tells you *what broke*. The CWE behind it tells you *why it broke*.

```
CVE-2017-9805 (Equifax breach via Apache Struts)
        │
        └──► CWE-502: Deserialization of Untrusted Data
                        │
                        └──► Root cause: application trusted
                             external serialized objects blindly
```

Understanding the CWE prevents the same mistake from appearing in other parts of the codebase.

### 3. Scope of assessment
The taxonomy helps assessors decide **what to look for**. Instead of testing randomly, they pick the relevant CWE categories for the type of application being assessed (web app, mobile, embedded system) and test systematically.

---

## How it helps in Risk Management

| Risk Management Task | How CWE Taxonomy Helps |
|---|---|
| **Prioritization** | Higher-level CWEs (Pillars) signal systemic risk across the codebase |
| **Trend tracking** | Which CWE categories appear most in our sprints? That's a training or process problem |
| **Third-party risk** | Vendor software can be evaluated against known CWE profiles |
| **Compliance** | Regulations like PCI-DSS and OWASP ASVS map controls directly to CWE categories |
| **Audit trail** | CWE IDs create a clear, standardized record of what was assessed and remediated |

---

## Benefits of a Standardized Classification System

### For developers
- Know exactly what type of flaw to avoid — not vague advice like "write secure code"
- Targeted training based on recurring CWE patterns in their work

### For security teams
- Compare findings across different tools and projects using the same IDs
- Build metrics: *"We reduced CWE-89 findings by 80% this quarter"*

### For management
- Translate technical risk into business risk using a recognized standard
- Demonstrate due diligence to auditors and regulators

### For the industry
- Vendors, researchers, and governments share a common vocabulary
- Tools integrate with each other because they all reference the same taxonomy

---

## Summary

> CWE taxonomy turns the chaotic world of software weaknesses into an organized, searchable, and actionable catalog.
> Without it, every team would reinvent the wheel — and miss the same holes everyone else already documented.
