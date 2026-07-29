# 11. The TLS Audit

**Goal:** Evaluate real-world TLS configurations using SSL Labs, produce a remediation plan for MedDefense's patient portal, and write a hardened TLS configuration.

## Context

Finding 005 from your vulnerability assessment (1x02) identified that the patient portal still supports TLS 1.0 alongside TLS 1.2. That finding has been sitting on the remediation list for 3 weeks. Now you have the knowledge to fix it. But before you write the configuration, you need to understand what a good TLS configuration looks like and what a bad one looks like, using real data from real websites.

## Instructions

### Part 1 - SSL Labs Analysis

Go to ssllabs.com/ssltest and test 2 real websites:

- A website with an A or A+ rating (example: cloudflare.com)
- A website with a lower rating (B or below), if you can find one

For each, document:

- The overall grade
- Protocol support (which TLS versions)
- Key exchange strength
- Cipher suite strength
- Certificate details
- Any warnings or weaknesses flagged

### Part 2 - MedDefense Portal Assessment

You cannot test `portal.meddefense.local` on SSL Labs (it is internal). Based on Finding 005 from 1x02 (TLS 1.0 enabled, TLS 1.2 supported) and Finding 013 (certificate near expiration), predict what grade the portal would receive if it were publicly accessible. List every issue that would reduce the grade.

### Part 3 - The Hardened Configuration

Write a recommended TLS configuration for the MedDefense patient portal (Apache or Nginx format, your choice). The configuration must specify:

- Supported protocol versions (TLS 1.2 and TLS 1.3 only)
- Cipher suite selection (ordered by preference, with reasoning for each choice)
- HSTS header (with appropriate max-age)
- Any other TLS hardening parameters (session tickets, renegotiation, etc.)

For each choice, write one sentence explaining why.

### Part 4 - The Downgrade Attack

Explain in 3-4 sentences how a TLS downgrade attack works. If MedDefense's portal supports both TLS 1.0 and TLS 1.2, how would an attacker force a client to use the weaker protocol? What is the simplest way to prevent this attack?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `11-tls_audit.md`
