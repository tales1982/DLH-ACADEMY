# DNS - Quick Reference

> The **Domain Name System (DNS)** is the internet's GPS — it translates human-readable domain names (e.g., `www.example.com`) into numerical IP addresses (e.g., `192.0.2.1`) that computers use to communicate.

---

## DNS Record Types

| Record | Purpose | Example |
|---|---|---|
| **A** | Maps domain → IPv4 address | `example.com → 93.184.216.34` |
| **AAAA** | Maps domain → IPv6 address | `example.com → 2606:2800::1` |
| **MX** | Mail servers for the domain | `mail.example.com` |
| **NS** | Authoritative name servers | `ns1.example.com` |
| **CNAME** | Alias pointing to another domain | `www → example.com` |
| **TXT** | Arbitrary text (SPF, DKIM, secrets) | `v=spf1 include:...` |
| **SOA** | Start of Authority — zone metadata | Primary NS, admin email, serial |
| **PTR** | Reverse lookup: IP → domain | Used in `dig -x` |

---

## Task 2:
 - **QUESTION 1**: Which IP address maps to inlanefreight.com?
 - **QUESTION 2**: Which domain is returned when querying the PTR record for 134.209.24.248?
 - **QUESTION 3**: What is the full domain returned when you query the mail records for facebook.com?

---

## Cheat Sheet

```bash
host domain.com             # A Record lookup
dig domain.com              # Default A record lookup
dig domain.com A            # IPv4 address
dig domain.com AAAA         # IPv6 address
dig domain.com MX           # Mail servers
dig domain.com NS           # Name servers
dig domain.com TXT          # TXT records (great for recon)
dig domain.com CNAME        # Canonical name / alias
dig domain.com SOA          # Start of authority
dig @1.1.1.1 domain.com     # Query a specific DNS server
dig +trace domain.com       # Full DNS resolution path
dig -x 192.168.1.1          # Reverse lookup (IP → hostname)
```
## Why DNS Matters for Recon
🗺️ Uncovering Hidden Assets:

DNS records can expose subdomains, mail servers, and stale infrastructure.
```
dev.example.com CNAME oldserver.example.net
```
→ That old server might still be running vulnerable software.

🌐 Mapping Network Infrastructure:

- NS records → reveal the hosting provider
- A records → pinpoint load balancers, internal services
- MX records → identify email providers (e.g., Google Workspace, O365)

→ Build a map of how systems connect, find traffic choke points, spot weak links.
