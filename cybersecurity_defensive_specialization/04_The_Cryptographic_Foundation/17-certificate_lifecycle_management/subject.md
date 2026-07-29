# 17. Certificate Lifecycle Management

**Goal:** Design the certificate management program that prevents MedDefense from ever facing another "certificate expires in 18 days" emergency.

## Context

The patient portal certificate is a symptom, not the disease. The disease is that MedDefense has no certificate inventory, no expiration monitoring, no renewal process and no policy on certificate types. This task creates the program.

## Instructions

Produce a Certificate Lifecycle Management Plan for MedDefense:

**Certificate Inventory:** List every certificate MedDefense should be tracking (patient portal, EHR internal, VPN, email signing, code signing if applicable). For each: the current issuer, expiration date (estimate based on findings) and responsible owner.

**Auto-Renewal Strategy:** Recommend whether MedDefense should use ACME/Let's Encrypt (automated, free, 90-day certificates) or a commercial CA (manual, paid, 1-year certificates). For the patient portal specifically, justify your choice considering the 800 daily patients and the clinical impact of an expiration.

**Monitoring and Alerting:** What system should monitor certificate expiration? At what thresholds should alerts fire (90 days, 60 days, 30 days, 7 days)? Who receives each alert?

**Certificate Policy:** Draft 5 policy rules for MedDefense's certificate usage (example: "All internal services must use certificates signed by the MedDefense internal CA or a trusted public CA. Self-signed certificates are prohibited in production.").

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x04_crypto_foundation`
- **File:** `17-certificate_lifecycle.md`
