# Subdomains - Quick Reference

> Subdomains are extensions of a main domain used to organise different sections or services of a website. Where `example.com` is the main domain, `blog.example.com`, `shop.example.com`, and `mail.example.com` are subdomains each potentially running its own application and infrastructure.

---

## Why Subdomains Matter for Recon

| Target | Why It's Interesting |
|---|---|
| **Dev / Staging environments** | Relaxed security, exposed configs, test credentials |
| **Hidden login portals** | Admin panels not linked publicly → easy to overlook, hard to secure |
| **Legacy applications** | Old, forgotten apps running outdated & vulnerable software |
| **Sensitive files** | Misconfigured subdomains leaking docs, internal data, or config files |

---

## Tasks
 - **QUESTION 1** List all subdomains for inlanefreight.com

HINT: **Fuzz** using seclist's subdomain list
