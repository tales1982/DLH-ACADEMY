# 8. The Self-Audit

**Goal:** Run a real security audit tool on your own machine, interpret the results, and project the findings onto the MedDefense environment.

## Context

You have been reading a scan report someone else produced. Now you generate your own. Lynis is an open-source security auditing tool that checks your system against hundreds of security best practices: kernel hardening, authentication, file permissions, networking, logging, malware detection and more.

Running it on your own machine teaches you what a scanner actually checks, how to read raw audit output and how to distinguish important findings from noise. Then you will project that understanding onto MedDefense.

## Instructions

### Part 1: Install and Run

On your Linux machine or VM:

```
# Install Lynis
sudo apt update && sudo apt install lynis -y
# OR clone from GitHub for the latest version
# git clone https://github.com/CISOfy/lynis && cd lynis

# Run a full system audit
sudo lynis audit system
```

### Part 2: Analyze Results

After the audit completes, document:

- **Hardening Index:** What score did your machine receive?
- **Top 5 Warnings:** List the 5 most critical warnings. For each: what Lynis checks, why it matters and what the remediation would be.
- **Top 5 Suggestions:** List the 5 most relevant suggestions (from the "Suggestions" section). For each: explain what security improvement it recommends.
- **Category Breakdown:** Lynis organizes checks by category (Kernel, Authentication, Networking, etc.). Which categories scored highest? Which scored lowest? What does this tell you about your system's security posture?

### Part 3: MedDefense Projection

Without access to MedDefense's servers, project what Lynis would likely find on `billing-srv-01` (Ubuntu 18.04, Apache 2.4.29, MySQL, crypto-miner compromise history, SSH password auth enabled). List 5 specific findings you would expect Lynis to flag on this server, with your reasoning for each prediction.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x02_the_weak_links`
- **File:** `8-lynis_audit.md`
