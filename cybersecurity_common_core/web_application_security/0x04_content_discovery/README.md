# 0x04 — Content Discovery

Module covering content discovery techniques — finding hidden files, directories, endpoints, and subdomains on web applications using wordlists and fuzzing tools.

---

## Contents

| File | Description |
|------|-------------|
| `0-flag.txt` | CTF flag — task 0 |
| `1-flag.txt` | CTF flag — task 1 |
| `4-flag.txt` | CTF flag — task 4 |
| `5-flag.txt` | CTF flag — task 5 |
| `6-flag.txt` | CTF flag — task 6 |
| `7-flag.txt` | CTF flag — task 7 |
| `DLH-wordlist.txt` | Custom wordlist created for the module challenges |
| `dns_wordlist.txt` | Wordlist for DNS subdomain brute-forcing |
| `favicon.ico` | Favicon used to fingerprint the web framework |
| `list_fuzz` | Target list for fuzzing exercises |
| `sorted.txt` | Sorted wordlist output |
| `tokens.txt` | Discovered tokens during content discovery |
| `PDFs/` | PDF resources for the module |

---

## Techniques Covered

| Technique | Description |
|-----------|-------------|
| **Directory brute-forcing** | Enumerating hidden paths using wordlists (`gobuster`, `ffuf`, `dirb`) |
| **File enumeration** | Discovering hidden files by extension (`.php`, `.bak`, `.conf`, `.env`) |
| **DNS subdomain brute-forcing** | Finding subdomains with DNS wordlists |
| **Favicon fingerprinting** | Identifying web frameworks by hashing the favicon |
| **robots.txt & sitemap.xml** | Extracting paths disclosed in these files |
| **Virtual host discovery** | Finding virtual hosts by fuzzing the `Host` HTTP header |

---

## Skills Practiced

- Building and using wordlists effectively
- Running `gobuster`, `ffuf`, and `dirb` for directory/file discovery
- Performing DNS subdomain enumeration
- Fingerprinting web technologies through passive and active methods
- Identifying sensitive files and endpoints exposed unintentionally

---

## Tools

- **Gobuster** — directory/file/DNS brute-forcing
- **Ffuf** — fast web fuzzer
- **Dirb** — classic web content scanner
- **Subfinder / Amass** — passive subdomain discovery

---

## References

- [SecLists — Wordlists](https://github.com/danielmiessler/SecLists)
- [OWASP Testing Guide — Content Discovery](https://owasp.org/www-project-web-security-testing-guide/)
