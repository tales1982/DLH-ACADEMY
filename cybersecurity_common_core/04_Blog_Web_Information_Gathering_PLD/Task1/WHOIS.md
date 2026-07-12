# WHOIS - Quick Reference

> WHOIS is a query/response protocol used to access databases storing information about registered internet resources: domain names, IP address blocks, and autonomous systems.
> Think of it as a **giant phonebook for the internet**.

---

## What's in a WHOIS Record?

| Field | Description |
|---|---|
| **Domain Name** | The domain itself (e.g., `example.com`) |
| **Registrar** | Company where the domain was registered (e.g., OVH) |
| **Registrant Contact** | Person/org that registered the domain |
| **Administrative Contact** | Person responsible for managing the domain |
| **Technical Contact** | Person handling technical issues |
| **Creation & Expiration Dates** | When the domain was registered and when it expires |
| **Name Servers** | Servers that resolve the domain name to an IP address |

---

## How to Query

```bash
# Command line
whois example.com
whois 1.2.3.4

# Online tools
# https://lookup.icann.org
```
---

## TASK 1
 - **QUESTION 1**: Perform a WHOIS lookup against the paypal.com domain. What is the registrar Internet Assigned Numbers Authority ID number?
 - **QUESTION 2**: What is the admin email contact for the tesla.com domain
 - **QUESTION 3**: What is the Registrar Name for dlh.lu
---

## Real-World Scenarios
🎣 Scenario 1 — Phishing Investigation

A suspicious email links to a domain. WHOIS reveals:

- Registered a few days ago
- Registrant hidden behind a privacy service
- Name servers tied to a bulletproof hosting provider

→ Strong phishing indicator. Block the domain, alert employees, pivot to related infrastructure.

🦠 Scenario 2 — Malware / C2 Analysis

Malware phones home to a C2 domain. WHOIS reveals:

- Registered with a free, anonymous email
- Registrant address in a high-cybercrime region
- Registrar with lax abuse policies

→ Likely a bulletproof server. Contact the hosting provider, report abuse, track infrastructure.
