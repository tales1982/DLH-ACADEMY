# 5. The Kernel Shield

**Goal:** Harden the Linux kernel network stack and memory protections via sysctl to prevent the server from being used as a pivot point or exploitation target.

## Context

In the Crimson Tide attack chain (Phase 3), the attacker moved laterally across the flat network. If a compromised Linux server has IP forwarding enabled, it becomes a router for the attacker. If ICMP redirects are accepted, the attacker can reroute traffic. If ASLR is disabled, memory corruption exploits become trivially reliable. These are default-off settings that should never be on a production server.

## Instructions

Write a script `5-sysctl_hardening.sh` that:

- Backs up the current `sysctl.conf`
- Applies network stack hardening, IPv6 disabling and memory protection parameters
- Applies settings immediately with `sysctl -p`
- Verifies each setting was applied by reading back from `/proc/sys/`
- Prints a PASS/FAIL for each setting

## Expected Output

```
$ sudo ./5-sysctl_hardening.sh
[*] Backing up /etc/sysctl.conf
[*] Applying kernel hardening parameters...
net.ipv4.ip_forward = 0                    [PASS]
net.ipv4.conf.all.accept_redirects = 0     [PASS]
net.ipv4.conf.default.accept_redirects = 0 [PASS]
net.ipv4.conf.all.send_redirects = 0       [PASS]
net.ipv4.conf.all.accept_source_route = 0  [PASS]
net.ipv4.conf.all.log_martians = 1         [PASS]
net.ipv4.tcp_syncookies = 1                [PASS]
net.ipv4.icmp_echo_ignore_broadcasts = 1   [PASS]
net.ipv6.conf.all.disable_ipv6 = 1         [PASS]
net.ipv6.conf.default.disable_ipv6 = 1     [PASS]
kernel.randomize_va_space = 2              [PASS]
fs.suid_dumpable = 0                       [PASS]
kernel.dmesg_restrict = 1                  [PASS]
kernel.kptr_restrict = 2                   [PASS]
Parameters applied: 14
Verified PASS: 14
Verified FAIL: 0
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `5-sysctl_hardening.sh`
