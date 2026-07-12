# Fingerprinting - Quick Reference

> **Fingerprinting** is the process of extracting technical details about the technologies powering a website or web application. Like a human fingerprint, digital signatures left by web servers, frameworks, and software components can uniquely identify a target's stack — and its weaknesses.

---

## Why Fingerprinting Matters

| Reason | Description |
|---|---|
| **Targeted attacks** | Know the stack → find CVEs specific to those versions |
| **Identify misconfigurations** | Outdated software, default settings, exposed debug info |
| **Prioritise targets** | Focus on systems most likely to be vulnerable |
| **Build a full profile** | Combine with DNS, subdomain, and VHost data for a complete picture |

---

## TASKS
**QUESTION 1**: Determine the Apache version running on inlanefreight.com

**QUESTION 2**: What CMS is used on inlanefreight.com and what is the version used ?

**QUESTION 3**: On which operating system is the webserver running on inlanefreight.com ?

---
**Hints**: 
- Google "Banner Grabbing" with curl
- Wappalyzer/WhatWeb
