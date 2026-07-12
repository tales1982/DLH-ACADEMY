# Virtual Hosts (VHosts) — Quick Reference

> **Virtual Hosting** allows a single web server to host multiple websites or applications on one IP address. The server uses the HTTP `Host` header from each incoming request to decide which site to serve.

---

## VHosts vs Subdomains

| | **Subdomain** | **Virtual Host** |
|---|---|---|
| **What it is** | DNS extension of a domain | Web server configuration entry |
| **Lives in** | DNS records | Web server config (Apache/Nginx/IIS) |
| **Needs DNS?** | ✅ Yes has its own DNS record | ❌ Not necessarily |
| **Example** | `blog.example.com` → DNS A record | `dev.example.com` → server config only |

> 🔑 Key insight: A virtual host **may not have a public DNS record** — it only exists in the server's config. This is why brute-forcing VHosts can reveal hidden sites that subdomain enumeration misses.

---

## Tasks:
 - **QUESTION 1** Find the corresponding Vhosts with these prefix for this domain host: inlanefreight.htb (ask me IP and port)
```
web
vm
br
a
su
```
---

## How It Works (Step by Step)
- Browser navigates to www.example.com 
- Browser sends HTTP request with: Host: DLH.example.com 
- Web server reads the Host header 
- Server matches it against virtual host configs 
- Correct site content is served

The `Host` header acts as a **switch**, same IP, different content depending on what domain was requested.
