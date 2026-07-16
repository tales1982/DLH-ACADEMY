# 4. The Human Vector

**Goal:** Identify, classify and analyze social engineering attack vectors in a healthcare context, including red flags and countermeasures.

## Context

The most sophisticated firewall in the world is useless if an attacker can call the front desk and talk their way into a password reset. Social engineering exploits the one system you cannot patch: human psychology. In healthcare, the exploitation surface is enormous. Clinical staff are trained to be helpful. Administrative staff handle urgent requests all day. Everyone is busy, stressed and inclined to take shortcuts.

The Security+ framework (2.2) defines these human-targeted vectors: phishing (email), vishing (voice/phone), smishing (SMS), pretexting (fabricated scenarios), business email compromise (BEC), impersonation, watering hole attacks, brand impersonation and typosquatting. Each exploits a different psychological lever: urgency, authority, familiarity, fear or helpfulness.

## Instructions

Analyze the following 7 social engineering scenarios targeting MedDefense. For each one, produce:

```
Scenario [N]:
  Vector Type: [Exact Sec+ 2.2 term]
  Target: [Role at MedDefense + why this person is vulnerable]
  Psychological Lever: [Urgency / Authority / Familiarity / Fear / Helpfulness / Curiosity]
  Red Flags: [3 specific indicators the target should notice]
  Technical Control: [One control that would reduce the risk]
  Administrative Control: [One policy or procedure that would reduce the risk]
```

### The Scenarios

**Scenario 1:** An email arrives in the inbox of Sarah Park (IT Director), appearing to come from FortiGate support: "Critical firmware vulnerability detected on your FortiGate 100F. Click here to download the emergency patch. Failure to patch within 24 hours may result in service termination." The sender domain is `fortinet-support.net`.

**Scenario 2:** The CFO (Robert Kim) receives an email from what appears to be Dr. Patricia Morales (CEO): "Robert, I need you to process a wire transfer of $85,000 to the account below immediately. This is for a confidential equipment acquisition. Do not discuss with anyone until the deal closes. I am in meetings all day, email only." The sender address has a subtle difference from the real CEO email.

**Scenario 3:** A nurse at MedDefense Central answers the phone. The caller identifies themselves as "Mike from IT" and says: "We're doing an emergency security audit after the billing server incident. I need to verify your login works correctly. Can you read me your username and the password you use for the EHR system?"

**Scenario 4:** All MedDefense employees receive a text message: "MedDefense Parking: Your staff parking permit expires tomorrow. Renew immediately to avoid towing: [link]." The link leads to a page that looks like MedDefense's internal HR portal and asks for AD credentials.

**Scenario 5:** The website of the Regional Healthcare Association (an industry group that MedDefense physicians visit monthly for CME credits) is compromised. Visitors who browse specific pages are silently redirected to a site that attempts to exploit a browser vulnerability to install malware.

**Scenario 6:** Someone registers the domain `meddefence-portal.com` (note: "defence" instead of "defense"). They create a pixel-perfect copy of MedDefense's patient portal. Google Ads are purchased so this fake portal appears above the real one in search results for "MedDefense patient portal."

**Scenario 7:** A person in scrubs carrying a stethoscope and a hospital-branded coffee cup approaches the restricted corridor leading to the IT department. They follow a staff member through the badge-controlled door, saying warmly: "Thanks! My badge is in my locker, I'm just running back to grab something from my desk." Their visitor badge, partially hidden by the stethoscope, expired two days ago.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x01_know_your_enemy`
- **File:** `4-social_engineering_analysis.md`
