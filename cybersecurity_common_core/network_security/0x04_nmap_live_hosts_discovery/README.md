# 0x04 — Nmap Live Host Discovery

Module focused on host discovery techniques using Nmap — identifying which hosts are alive on a network using different scanning methods (ARP, ICMP, TCP, UDP).

---

## Contents

| File | Description |
|------|-------------|
| `0-arp_scan.sh` | ARP scan to discover live hosts on the local network segment |
| `1-icmp_echo_scan.sh` | ICMP Echo Request (ping) scan — the classic method |
| `2-icmp_timestamp_scan.sh` | ICMP Timestamp Request scan — bypasses firewalls that block echo requests |
| `3-icmp_address_mask_scan.sh` | ICMP Address Mask Request scan |
| `4-tcp_syn_ping.sh` | TCP SYN ping — discovers hosts by sending SYN packets to common ports |
| `5-tcp_ack_ping.sh` | TCP ACK ping — useful for bypassing stateless firewalls |
| `6-udp_ping_scan.sh` | UDP ping scan — sends UDP packets to discover live hosts |
| `100-flag.txt` | CTF flag — task 100 |

---

## Skills Practiced

- Understanding why host discovery is the first step in network scanning
- Choosing the right scan type depending on the network environment and firewall rules
- ARP-based discovery on local subnets (Layer 2)
- ICMP-based discovery for remote hosts (Layer 3)
- TCP/UDP-based host discovery when ICMP is blocked

---

## Tools

- **Nmap** (`-sn`, `-PE`, `-PP`, `-PM`, `-PS`, `-PA`, `-PU` flags)
- `arp-scan`

---

## Nmap Discovery Flag Reference

| Flag | Method |
|------|--------|
| `-sn` | Ping scan (no port scan) |
| `-PE` | ICMP Echo Request |
| `-PP` | ICMP Timestamp |
| `-PM` | ICMP Address Mask |
| `-PS<port>` | TCP SYN ping |
| `-PA<port>` | TCP ACK ping |
| `-PU<port>` | UDP ping |
