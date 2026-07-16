# 11. The Shadow Systems

**Goal:** Identify and assess unmanaged assets that exist outside the organization's official IT governance, and determine the appropriate response for each.

## Context

You are cross-referencing your Asset Registry (Task 7) with the network scan when the IT helpdesk lead, Mike Torres, stops by your desk:

> "Hey, you're the new security person, right? I should probably mention a few things. Dr. Patel in Cardiology bought a personal NAS drive and plugged it into the wall port in his office. He stores research data on it, says the hospital's shared drive is too slow. Oh, and the marketing team has been using a shared Google Drive for media files and press communications. It's linked to someone's personal Gmail. Also, there's a Raspberry Pi somewhere on the second floor of Central that the previous intern set up. I think Marcus actually asked him to set it up as some kind of network monitor, but nobody has touched it since they both left."

## Instructions

Shadow IT describes systems, services or devices that operate within an organization's environment without formal IT approval, management or security oversight. They represent a specific risk category because they are invisible to standard security controls, unpatched, unmonitored and often contain sensitive data.

For each of the three shadow systems described above, produce:

### Risk Assessment

1. What sensitive data might this system contain or provide access to?
2. What security controls from the official matrix (Task 10) do NOT cover this system?
3. What is the worst-case scenario if this system is compromised?

### Recommended Response

Choose one of three strategies and justify your choice:

- **Legitimize and Secure:** Bring the system under IT governance, apply appropriate controls, document it in the asset registry.
- **Migrate:** Move the data/function to an approved system that already has controls.
- **Decommission:** Remove the system and ensure data is properly handled.

### Asset Registry Update

Add each shadow system to your Asset Registry (Task 7) with `Status: "Shadow IT"` and appropriate notes.

---

After the three individual assessments, write a **Shadow IT Policy Recommendation** (one paragraph): What single policy change would most effectively reduce the likelihood of future shadow IT at MedDefense?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `11-shadow_systems.md`
