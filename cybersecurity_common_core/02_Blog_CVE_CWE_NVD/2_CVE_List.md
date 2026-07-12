# 2. CVE List

## How is a CVE ID assigned?

When someone discovers a vulnerability, it is reported. A competent authority reviews it and decides: *is this a new and real vulnerability?* If yes, it receives a unique ID in the format `CVE-YEAR-NUMBER`.

That ID is then published on the public CVE List so the entire world uses the same name to refer to the same flaw.

---

## Who manages the CVE List?

The **MITRE Corporation** manages the CVE List, with financial support from the U.S. government through the **Cybersecurity and Infrastructure Security Agency (CISA)**.

---

## What are CNAs?

**CNA** = CVE Numbering Authority.

CNAs are organizations **authorized by MITRE** to assign CVE IDs within their own domain — without needing to ask MITRE every time.

**Examples of CNAs:**
- Microsoft → assigns CVEs for Microsoft products
- Google → assigns CVEs for Google products
- Red Hat, Apple, GitHub, etc.

**How it works in practice:**

```
Researcher discovers a flaw in Windows
        ↓
Reports it to Microsoft (which is a CNA)
        ↓
Microsoft validates and assigns CVE-XXXX-XXXX
        ↓
CVE is published on MITRE's public list
```

---

## Summary

> MITRE manages the list. CNAs are the authorized "regional offices" that can register vulnerabilities within their own territory.
