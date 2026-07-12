# 0x01 — Passive Reconnaissance

Module covering passive reconnaissance techniques — gathering information about a target without sending any packets directly to the target system. All techniques use publicly available data sources.

---

## Contents

| File | Description |
|------|-------------|
| `0-whois.sh` | Retrieves WHOIS registration data for a domain (owner, registrar, dates) |
| `1-a_record.sh` | Resolves the A (IPv4 address) DNS record for a domain |
| `2-mx_record.sh` | Retrieves the MX (Mail Exchange) DNS record |
| `3-txt_record.sh` | Retrieves TXT DNS records (SPF, DKIM, DMARC, verification tokens) |
| `4-dig_all.sh` | Performs a full DNS enumeration using `dig` |
| `5-subfinder.sh` | Discovers subdomains using `subfinder` (passive OSINT tool) |
| `holbertonschool_report.md` | Passive reconnaissance report example on a target domain |
| `100-flag.txt` | CTF flag — task 100 |
| `101-flag.txt` | CTF flag — task 101 |
| `102-flag.txt` | CTF flag — task 102 |

---

## Skills Practiced

- WHOIS domain lookup and registrar information gathering
- DNS record enumeration (A, MX, TXT, NS, CNAME)
- Passive subdomain discovery without touching the target
- OSINT (Open Source Intelligence) methodology
- Writing a structured reconnaissance report

---

## Tools

- `whois`
- `dig`, `nslookup`, `host`
- **Subfinder** — passive subdomain enumeration
- Shodan, VirusTotal, crt.sh (OSINT sources)

---

## Key Concept

Passive reconnaissance generates **no traffic to the target**. All data is retrieved from third-party sources (DNS servers, public registries, search engines), making it undetectable by the target's monitoring systems.
