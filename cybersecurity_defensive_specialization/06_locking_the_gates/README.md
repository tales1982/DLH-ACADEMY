# Locking the Gates

> "Security is not a product. Security is a process." — Bruce Schneier

## Introduction

You spent weeks telling MedDefense what was wrong with its infrastructure. You wrote five reports. You quantified the risk. You calculated the ALE. You designed the strategy, secured the budget and presented to the Board.

Now stop writing and start configuring.

This project is the first line of code in MedDefense's defense. The Linux servers that run the patient portal, the billing system and the log collection host are exposed, misconfigured and running default settings that you yourself flagged in Finding 009 (SSH password auth), Finding 011 (Ubuntu 18.04 without ESM) and Finding 026 (outdated kernel with 47 known CVEs). The Crimson Tide advisory showed that every hospital breach started with a misconfigured service on a reachable server. Your servers are reachable. Your services are misconfigured. The difference between MedDefense and Hospital C (currently in FBI containment 45 miles away) is what you do in the next 22 hours.

This project produces no report. It produces hardened systems and the scripts that harden them. Every deliverable is a shell script that produces structured JSON output or a measurable system state change. When you finish, billing-srv-01's Lynis hardening index will have risen from the low 50s to above 80. SSH will reject password authentication. Unnecessary SUID binaries will be stripped. auditd will log every privilege escalation attempt. AppArmor will confine every exposed service. And every change will be automated in a script that can harden the next server in minutes instead of hours.

## Why this matters

Every SOC analyst who has worked a hospital breach will tell you the same thing: the attacker did not need a zero-day. They needed a default SSH config, an unnecessary service and a missing audit trail. Linux hardening is not glamorous work, but it is the work that eliminates the easy wins attackers depend on. The CIS Benchmark methodology you learn here is the same methodology you will apply to Windows, to firewalls, to network devices. This is your training ground. The method transfers everywhere.

## Context

Week seven at MedDefense Health Systems. Monday morning.

The Board approved the security strategy on Friday. The 72-hour emergency plan from the Crimson Tide response is in Phase 2. James Chen has divided the roadmap into workstreams. Yours is infrastructure hardening.

He hands you a printed checklist:

"Three Linux servers. Three weeks of risk sitting in production. Here is what happens this week:"

- **billing-srv-01** (Ubuntu 22.04, fresh OS upgrade from 18.04, Apache 2.4.x, MySQL, SSH) — the server that had the crypto-miner. The upgrade resolved Finding 011 but the system needs full hardening.
- **web-srv-01** (Ubuntu 22.04, Apache/Nginx, patient portal) — internet-facing, TLS already improved (from 1x04 work), but OS-level hardening is zero.
- **log-srv-01** (Ubuntu 22.04, fresh build) — the centralized log collection host. Must be the most hardened server in the environment because if the log server is compromised, the attacker can erase the evidence.

"I want scripts, not notes. If billing-srv-01 burns tomorrow and we have to rebuild, I want to run one script and have a hardened server in 20 minutes. Document the exceptions, automate the rest."

Sarah Park adds: "And the CIS Benchmark for Ubuntu is 800 pages. Do not try to implement all of it. Pick the controls that matter for our threat model, apply them, justify what you skip, and prove the system is harder to break than it was yesterday."

## Learning Objectives

By the end of this project, you are expected to be able to explain to anyone, without the help of Google:

### System Hardening

- What a CIS Benchmark is, how it is structured and how to apply it with professional judgment (not blind compliance)
- How to harden SSH for enterprise use: key-only authentication, root login prohibition, idle timeouts, allowed users, protocol enforcement
- How to harden the Linux kernel via `sysctl`: network stack protections (SYN cookies, ICMP redirects, IP forwarding), ASLR, core dump restrictions
- How to audit and remediate filesystem permissions: SUID/SGID binaries, world-writable files, mount options (`noexec`, `nosuid`, `nodev`)
- How to configure AppArmor profiles in enforce mode for exposed services
- How to configure PAM for password quality enforcement and login attempt limiting
- How to deploy and configure `auditd` for security-relevant event logging
- How to configure `rsyslog` and log rotation for structured, exportable logging
- How to implement a host firewall with default-deny posture

### Operational Skills

- How to run a Lynis audit, parse the results programmatically, and measure the hardening delta (before vs after)
- How to cross-reference audit findings against CIS controls to produce a gap analysis
- How to write idempotent bash scripts that automate hardening operations and produce structured JSON outputs
- How to build a master hardening pipeline that can harden a server from zero to production-ready in one execution

### Professional Judgment

- When to apply a CIS recommendation and when to skip it with a documented compensating control
- How to balance security hardening against clinical operational requirements

## Resources

**Read or Watch:**

- CIS Benchmarks
  - CIS Benchmark for Ubuntu Linux 22.04 LTS — Download the PDF. Read Sections 1 (Initial Setup) and 5 (Access/Authentication). You do not need to read all 800 pages.
  - CIS Benchmarks Overview — How benchmarks are structured and maintained.
- Linux Hardening
  - NIST SP 800-123: Guide to General Server Security — Section 4 covers OS hardening principles.
  - Linux Audit System Documentation — `auditd` reference.
  - AppArmor Wiki — Profile syntax and enforcement modes.

**Man or Help:**

`man sshd_config` · `man sysctl` · `man sysctl.conf` · `man pam_pwquality` · `man pam_faillock` · `man auditctl` · `man auditd` · `man aa-status` · `man aa-enforce` · `man lynis` · `man rsyslog.conf` · `man ufw`

## Requirements

### General

- A `README.md` file, at the root of the folder of the project, is mandatory.
- All your files should end with a new line.

### Bash Scripting

- All your scripts must be executable.
- The first line of all your scripts should be exactly `#!/bin/bash`.
- All your files should end with a new line.

### Specific Project Rules

- **Scripts are the primary deliverable.** Every hardening action must be captured in a script that can be re-executed on a fresh system. The script IS the documentation.
- **Idempotent scripts only.** Running the script twice must produce the same result as running it once. Use conditional checks before making changes.
- **JSON outputs for all structured data.** Every analysis, assessment and validation task produces a structured JSON file. These outputs are machine-readable and auto-checkable.
- **Show the delta.** Before any hardening, capture the system state (Lynis score, open ports, SUID list). After hardening, capture the same metrics. The delta is the proof of work.
- **Justify every deviation.** If a CIS recommendation is not applied, create a comment in the script explaining why and what compensating control exists.
- **Connect to MedDefense.** Comments in scripts should reference the threat or vulnerability that each setting addresses.
  - Example: `# Disable SSH password auth - addresses 1x02 Finding 009 and Crimson Tide Phase 3 (SSH lateral movement)`

## Lab Access

**Connection Details:**

| Parameter | Value |
|---|---|
| Lab Name | billing-srv-01 |
| Target Host | Local VM |
| Username | analyst |
| Auth Method | Analyst2026! |

**Connection Example:**

From your local computer:

```
ssh -p 2222 analyst@127.0.0.1
```

From the Windows VM (Next Lesson):

```
ssh analyst@10.10.1.10
```
