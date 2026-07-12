# 0x01 — OWASP Top 10

Module covering the OWASP Top 10 — the most critical web application security risks. Includes hands-on exploitation tasks and a walkthrough of a stored XSS attack.

---

## Contents

| File | Description |
|------|-------------|
| `1-xor_decoder.sh` | Decodes an XOR-encoded payload found during a challenge |
| `2-flag.txt` | CTF flag — task 2 |
| `4-vuln.txt` | Vulnerability description or payload for task 4 |
| `xss_stored_walkthrough.md` | Step-by-step walkthrough of a Stored XSS (Cross-Site Scripting) attack |

---

## OWASP Top 10 Categories Covered

| # | Risk |
|---|------|
| A01 | Broken Access Control |
| A02 | Cryptographic Failures |
| A03 | Injection (SQL, XSS, Command) |
| A04 | Insecure Design |
| A05 | Security Misconfiguration |
| A06 | Vulnerable and Outdated Components |
| A07 | Identification and Authentication Failures |
| A08 | Software and Data Integrity Failures |
| A09 | Security Logging and Monitoring Failures |
| A10 | Server-Side Request Forgery (SSRF) |

---

## Skills Practiced

- Identifying and exploiting Cross-Site Scripting (XSS) vulnerabilities
- Understanding Stored vs. Reflected vs. DOM-based XSS
- Decoding encoded payloads (XOR, Base64)
- Using the OWASP Top 10 framework to assess web application risk
- Writing a structured vulnerability walkthrough

---

## References

- [OWASP Top 10 (2021)](https://owasp.org/www-project-top-ten/)
- [PortSwigger Web Security Academy](https://portswigger.net/web-security)
