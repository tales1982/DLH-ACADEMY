# Network Protocols — Security Hardening

Module focused on securing network protocols and services at the Linux system level: firewalls, network hardening, encrypted communications, and protocol security configuration.

---

## Contents

| File | Description |
|------|-------------|
| `0-iptables.sh` | Configures basic iptables firewall rules |
| `1-firewall.sh` | Sets up a complete firewall ruleset for the system |
| `2-harden.sh` | Applies network hardening configurations |
| `3-identify.sh` | Identifies running network services and exposed ports |
| `4-audit.sh` | Audits network configurations and services for security issues |
| `5-sshd_config` | Hardened SSH daemon configuration file |
| `6-nfs.sh` | Secures NFS (Network File System) configuration |
| `7-snmp.sh` | Hardens SNMP (Simple Network Management Protocol) settings |
| `8-smtp.sh` | Secures SMTP mail server configuration |
| `9-tls_version.txt` | Documents supported TLS versions and cipher recommendations |
| `10-cipher.sh` | Configures allowed cryptographic ciphers for network services |
| `11-http_https.txt` | HTTP vs. HTTPS configuration notes |
| `12-dos.sh` | Implements basic rate limiting and DoS mitigation rules |

---

## Skills Practiced

- Building and managing firewall rules with `iptables`
- Hardening SSH: disabling root login, key-only authentication, restricting ciphers
- Securing NFS exports and preventing unauthorized mounts
- Hardening SNMP: disabling v1/v2c, enforcing SNMPv3
- Configuring TLS versions and cipher suites
- Implementing rate limiting to mitigate DoS attacks

---

## Tools

- `iptables` / `ip6tables`
- `sshd`, `ssh-keygen`
- `openssl`
- `nmap`, `ss`, `netstat`
