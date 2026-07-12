# 0x02 — Active Reconnaissance

Module covering active reconnaissance techniques — directly interacting with the target to discover open ports, running services, web technologies, and potential vulnerabilities.

---

## Contents

| File | Description |
|------|-------------|
| `0-ports.txt` | List of discovered open ports on the target |
| `1-webserver.txt` | Web server identification and version information |
| `2-injectable.txt` | Identification of potentially injectable endpoints |
| `3-database.txt` | Database service discovery results |
| `4-tables.txt` | Database table enumeration results |
| `5-hidden_dir.txt` | Hidden directory and file discovery results |
| `100-flag.txt` | CTF flag — task 100 |
| `101-flag.txt` | CTF flag — task 101 |
| `102-flag.txt` | CTF flag — task 102 |

---

## Skills Practiced

- Port scanning and service version detection with `nmap`
- Web server fingerprinting (banner grabbing, HTTP headers)
- Directory and file brute-forcing with `gobuster` / `dirb`
- Identifying injectable parameters in web applications
- Database enumeration with `sqlmap`
- Documenting findings from active scanning

---

## Tools

- **Nmap** — port scanning and service detection
- **Gobuster / Dirb** — web directory brute-forcing
- **Nikto** — web server vulnerability scanner
- **SQLMap** — automated SQL injection detection and exploitation
- **WhatWeb / Wappalyzer** — web technology fingerprinting

---

## Key Concept

Unlike passive reconnaissance, active reconnaissance **sends packets directly to the target**. This generates logs on the target system and should only be performed against systems you have explicit authorization to test.
