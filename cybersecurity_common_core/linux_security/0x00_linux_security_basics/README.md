# 0x00 — Linux Security Basics

Module covering foundational Linux security concepts: login monitoring, network connection auditing, firewall rules, service hardening, and system security auditing.

---

## Contents

| File | Description |
|------|-------------|
| `0-login.sh` | Monitors and displays user login activity on the system |
| `1-active-connections.sh` | Lists all active network connections |
| `2-incoming_connections.sh` | Displays incoming network connections and their sources |
| `3-firewall_rules.sh` | Lists current firewall rules (iptables) |
| `4-network_services.sh` | Lists network services listening on open ports |
| `5-audit_system.sh` | Runs a basic system security audit |
| `6-capture_analyze.sh` | Captures and analyzes network traffic on the system |
| `7-scan.sh` | Scans the local system or network for open ports and services |

---

## Skills Practiced

- Monitoring login sessions and user activity
- Inspecting active network connections with `ss` and `netstat`
- Managing and reviewing `iptables` firewall rules
- Identifying listening services and exposed ports
- Performing basic system security audits
- Packet capture fundamentals with `tcpdump`

---

## Tools

- `who`, `last`, `lastlog`
- `ss`, `netstat`
- `iptables`
- `tcpdump`
- `nmap`
