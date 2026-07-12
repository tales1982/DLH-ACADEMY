# Threat Modeling Fundamentals

Module covering threat modeling methodology applied to real-world system architectures. Each scenario presents a different technology domain and walks through the process of identifying assets, threats, attack surfaces, and mitigations using structured frameworks.

---

## Contents

| File | Description |
|------|-------------|
| `0-ecommerce_platform.md` | Threat model for an e-commerce platform — identifying risks in payment flows, user data, authentication, and third-party integrations |
| `1-healthcare_mobile_app.md` | Threat model for a healthcare mobile application — focus on PHI (Protected Health Information), regulatory compliance (HIPAA), and mobile-specific attack vectors |
| `2-iot_smart_thermostat.md` | Threat model for an IoT smart thermostat — physical access threats, firmware integrity, insecure protocols, and cloud backend risks |
| `3-financial_trading_platform.md` | Threat model for a financial trading platform — high-frequency transaction integrity, API security, insider threats, and regulatory requirements |

---

## Methodology

The threat models in this module follow structured frameworks including:

- **STRIDE** — Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege
- **Attack Trees** — hierarchical mapping of attacker goals and sub-goals
- **Data Flow Diagrams (DFD)** — visualizing data movement and trust boundaries
- **DREAD** (where applicable) — Damage, Reproducibility, Exploitability, Affected users, Discoverability

---

## Skills Practiced

- Identifying assets, trust boundaries, and entry points in a system
- Applying STRIDE categories to map threats to system components
- Prioritizing threats by likelihood and impact
- Proposing mitigations aligned with each threat
- Writing structured threat modeling reports

---

## References

- [OWASP Threat Modeling](https://owasp.org/www-community/Threat_Modeling)
- [Microsoft STRIDE Framework](https://learn.microsoft.com/en-us/azure/security/develop/threat-modeling-tool-threats)
- [NIST SP 800-154 — Guide to Data-Centric System Threat Modeling](https://csrc.nist.gov/publications/detail/sp/800-154/draft)
