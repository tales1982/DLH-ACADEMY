# 0x01 — Python Scripting for Cybersecurity

Module covering Python scripting applied to cybersecurity tasks: DNS resolution, HTTP interaction, web crawling, and port scanning — fundamental automation skills for security professionals.

---

## Contents

| File | Description |
|------|-------------|
| `0-dns_resolver.py` | Resolves a hostname to its IP address using Python's socket library |
| `1-dns_records.py` | Retrieves multiple DNS record types (A, MX, TXT, NS) for a given domain |
| `2-download_page.py` | Downloads the HTML content of a web page using `urllib` or `requests` |
| `3-http_headers.py` | Retrieves and displays HTTP response headers from a target URL |
| `4-web_crawler.py` | Basic web crawler that extracts and follows links from a starting URL |
| `5-port_scanner.py` | TCP port scanner that checks for open ports on a target host |

---

## Skills Practiced

- Python socket programming for network communication
- DNS resolution and record retrieval with `dns.resolver`
- Making HTTP requests and inspecting responses with `requests`
- Parsing HTML with `BeautifulSoup`
- Building a basic port scanner with threading
- Writing reusable security automation scripts

---

## Libraries Used

- `socket` — low-level network communication
- `dns.resolver` (dnspython) — DNS record lookups
- `requests` — HTTP client
- `urllib` — URL handling and page download
- `BeautifulSoup` (bs4) — HTML parsing for web crawling
- `threading` — concurrent port scanning

---

## Key Concepts

- How DNS resolution works programmatically
- HTTP request/response cycle and header inspection
- Port scanning logic: TCP connect scan vs. SYN scan
- Responsible use: these scripts should only target systems you own or have authorization to test
