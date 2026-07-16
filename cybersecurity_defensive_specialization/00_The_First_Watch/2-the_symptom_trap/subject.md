# 2. The Symptom Trap

**Goal:** Develop the analytical reflex to look beyond visible symptoms and identify root causes in security events.

## Context

Remember the sticky note on Marcus's monitor? *"Check billing-srv-01, something is wrong."* This is the server that got hit by ransomware in January (Incident A). It was rebuilt, but the performance issues Marcus noticed started before the ransomware and have returned after the rebuild.

The IT team has flagged `billing-srv-01` three times in the last two months for "performance degradation." Each time, the sysadmin restarted the server, which temporarily resolved the issue. The sysadmin's latest ticket reads:

> "Recurring CPU saturation on billing-srv-01. Probably undersized for the billing workload. Recommend hardware upgrade or migration to a more powerful VM."

James Chen is not convinced. Neither was Marcus. James asks you to take a closer look.

## Provided Files

- `billing-srv-01_diagnostics.txt` (contains a `top` output snapshot and a `netstat` excerpt from the server)

### Excerpt from the diagnostics file

```
top - 14:22:07 up 12 days, 3:47, 2 users
PID    USER      PR  NI  %CPU  %MEM    COMMAND
8834   www-data  20   0  94.2   3.1    ./kworker -o stratum+tcp://pool.monero.org:4443
1102   root      20   0   2.1   8.4    /usr/sbin/apache2 -k start
1455   mysql     20   0   1.3  12.6    /usr/sbin/mysqld

Active Internet connections:
Proto  Local Address      Foreign Address        State
tcp    10.10.2.15:45892   185.243.115.89:4443    ESTABLISHED
tcp    10.10.2.15:45901   91.121.87.10:8080      ESTABLISHED
tcp    10.10.2.15:80      10.10.1.0/24:*         LISTEN
```

## Instructions

The sysadmin says this is a hardware capacity problem. You need to determine what is actually happening and why the sysadmin's diagnosis is wrong.

1. **Identify the process:** What is `kworker` doing? What does the `stratum+tcp://pool.monero.org` connection tell you? What is the purpose of this process?
2. **Classify the real compromise:** The visible symptom is performance degradation (Availability impact). But what are the actual primary security violations? Identify the two CIA pillars that are compromised *before* Availability is affected, and explain each.
3. **Explain why the sysadmin's solution fails:** If MedDefense follows the recommendation to upgrade the server hardware, does the security problem go away? Why or why not?
4. **Connect to the January incident:** The ransomware in January and this crypto-miner are on the same server. What does this suggest about the server's security posture? What question should you be asking about how both incidents were possible?

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x00_first_watch`
- **File:** `2-root_cause_analysis.md`
