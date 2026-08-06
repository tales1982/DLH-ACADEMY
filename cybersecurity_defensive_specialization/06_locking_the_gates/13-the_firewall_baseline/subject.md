# 13. The Firewall Baseline

**Goal:** Configure a host firewall with default-deny inbound policy, allowing only the services MedDefense requires.

## Context

The hardened services and the audit trail are useless if the server accepts connections on ports that no service is listening on. A default-deny firewall means the server only speaks when spoken to on approved channels. The 1x02 scan found billing-srv-01 with 11 open ports. After service minimization (Task 7), only 4 or 5 should be reachable. The firewall enforces this at the network layer, independent of the service configuration.

## Instructions

Write a script `13-firewall_baseline.sh` that:

- Enables UFW (or configures nftables) with default-deny inbound, default-allow outbound
- Creates allow rules only for required services: SSH (port 22 from management network only), HTTP/HTTPS (ports 80/443), MySQL (port 3306 from application network only)
- Enables logging for denied connections
- Validates the rules by listing the active ruleset

## Expected Output

```
$ sudo ./13-firewall_baseline.sh
[*] Configuring UFW...
    Default incoming: deny
    Default outgoing: allow
[*] Adding allow rules...
    22/tcp from 10.10.1.0/24   [ADDED] SSH - management only
    80/tcp                     [ADDED] HTTP
    443/tcp                    [ADDED] HTTPS
    3306/tcp from 10.10.2.0/24 [ADDED] MySQL - app network only
[*] Enabling logging...
    Logging: on (low)
[*] Activating firewall...
    UFW: active
    Rules: 4 allow, default deny
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `13-firewall_baseline.sh`
