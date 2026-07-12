# Crawling (Spidering) - Quick Reference

> **Crawling** (or spidering) is the automated process of systematically browsing a website by following links from page to page, like a spider navigating its web. A crawler starts at a **seed URL**, fetches the page, extracts all links, and repeats the process across every discovered page.

---

## How a Web Crawler Works
- Start with a seed URL → http://example.com
- Fetch the page & parse its content
- Extract all links found on the page
- Add new links to the queue
- Repeat for every queued URL


---

## What Crawlers Find

| Asset | Why It's Valuable |
|---|---|
| **Hidden pages & directories** | Pages not linked publicly but still accessible |
| **Forms & input fields** | Potential injection points (SQLi, XSS, SSRF) |
| **Comments in source code** | Developer notes, credentials, internal paths |
| **Linked files** | Config files, backups (`.bak`, `.old`), docs |
| **API endpoints** | Undocumented routes exposed in JS or HTML |
| **Third-party integrations** | External services and dependencies |

---

## TASKS:
**QUESTION 1**: After spidering inlanefreight.com, identify the location where future reports will be stored. Respond with the full domain.

---

## Tools and Tricks:
- For this task, you'll use OWASP Zap SPIDER (pre-installed on kali/parrot)
- Here is a small guide:

<img width="1909" height="1055" alt="image" src="https://github.com/user-attachments/assets/9742af2a-7160-4ceb-816c-985e521408c3" />

- Once here, click on the small green "+" sign

<img width="642" height="621" alt="image" src="https://github.com/user-attachments/assets/454bb821-a983-49f6-8891-bee664a63da4" />

- You then click on "Spider" and click on "New Scan"

<img width="499" height="132" alt="image" src="https://github.com/user-attachments/assets/f6bfc484-8149-4ef2-97e6-d42c51103d2f" />

- For starting point you put the domain you want to attack and start scan:

<img width="891" height="639" alt="image" src="https://github.com/user-attachments/assets/4d9136e3-63df-400a-9cef-e0d53c9fd243" />

---

**HINTS**: You have to filter using keywords :D

---

## `robots.txt` & `sitemap.xml`
These are generally goldmines, but they won't help you this time:

### `robots.txt`
Tells search engine bots what **not** to crawl which means it often lists the most interesting paths.

```bash
curl http://example.com/robots.txt
```
### `sitemap.xml`
Lists all pages the site owner wants indexed which gives you a full map of the site instantly.

```bash
curl http://example.com/sitemap.xml
```
