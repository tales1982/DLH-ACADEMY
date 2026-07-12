# 4. Calculate CVSS

## Vulnerability Scenario

> A remote code execution vulnerability in a widely used web server.
> The attacker can run any code remotely — **no authentication required**.

---

## Step 1 — Identify the Base Metrics

| Metric | Value | Reasoning |
|---|---|---|
| **Attack Vector (AV)** | Network | Exploited remotely over the internet |
| **Attack Complexity (AC)** | Low | No special conditions required |
| **Privileges Required (PR)** | None | No authentication needed |
| **User Interaction (UI)** | None | Attacker acts alone, no victim click needed |
| **Scope (S)** | Unchanged | Attack stays within the web server boundary |
| **Confidentiality (C)** | High | Attacker can read any data on the server |
| **Integrity (I)** | High | Attacker can modify or delete any data |
| **Availability (A)** | High | Attacker can crash or disable the server |

> **Note:** The exercise example lists PR as "Required" and UI as "Required" — but the scenario clearly states *no authentication required*, so the correct values are **None** for both.

---

## Step 2 — Calculate the Base Score (CVSS v3.1)

**ISCBase** (how bad is the impact):
```
ISCBase = 1 − [(1 − 0.56) × (1 − 0.56) × (1 − 0.56)]
        = 1 − [0.44 × 0.44 × 0.44]
        = 1 − 0.0852
        = 0.9148
```

**ISC** (Scope = Unchanged):
```
ISC = 6.42 × 0.9148 = 5.87
```

**Exploitability** (how easy is it to exploit):
```
Exploitability = 8.22 × 0.85 × 0.77 × 0.85 × 0.85
               = 8.22 × 0.4737
               = 3.89
```

**Final Score:**
```
CVSS Score = Roundup(Min[(5.87 + 3.89), 10])
           = Roundup(9.76)
           = 9.8
```

---

## Step 3 — Result

| | |
|---|---|
| **CVSS Score** | **9.8** |
| **Severity** | **Critical** |
| **CVSS Vector** | `CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H` |

> This is one of the worst possible scores. A real-world example with this profile is **Log4Shell (CVE-2021-44228)**, which scored 10.0.

---

## Step 4 — Implications for the Organization

- Any attacker on the internet can exploit this with no skill required (AC: Low, PR: None).
- Full control over the server means **data theft, ransomware, lateral movement** — all are possible.
- Because it affects a *widely used web server*, thousands of organizations are potentially exposed at the same time.
- Regulatory and compliance impact: a breach could trigger **GDPR, HIPAA, or PCI-DSS** violations.

---

## Step 5 — Mitigation Strategies

### Immediate (24–72 hours)
- Apply the vendor patch as an **emergency update** — do not wait for the next maintenance window.
- If no patch is available, **disable or isolate** the affected service immediately.
- Block exploitation attempts at the **WAF (Web Application Firewall)** level as a temporary workaround.

### Short-term (within 1 week)
- Scan the entire environment for other instances of the same software.
- Check logs for signs of exploitation **before** the patch was applied.
- Rotate any credentials or secrets that may have been exposed on the affected server.

### Long-term
- Adopt a **continuous vulnerability scanning** program (Nessus, Qualys, OpenVAS).
- Monitor **CISA KEV (Known Exploited Vulnerabilities)** to catch actively exploited CVEs early.
- Apply the **principle of least privilege** so that even if a server is compromised, the blast radius is limited.
