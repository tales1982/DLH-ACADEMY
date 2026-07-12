# 0x05 — Network Traffic Monitoring & Analysis

Module covering network traffic capture and analysis using Wireshark and tcpdump. Tasks involve analyzing real `.pcap` files to identify protocols, extract data, detect anomalies, and investigate malicious traffic.

---

## Contents

| File | Description |
|------|-------------|
| `task1-basic-analysis.pcap` | Basic packet analysis — identifying protocols and conversation flows |
| `task2-http-analysis.pcap` | HTTP traffic analysis — extracting URLs, credentials, and data in cleartext |
| `task3-dns-analysis.pcap` | DNS traffic analysis — identifying queries, responses, and suspicious domains |
| `task4-tcp-analysis.pcap` | TCP stream analysis — understanding the three-way handshake and connection states |
| `task5-advanced-filtering.pcap` | Advanced filtering techniques in Wireshark |
| `task6-tcp-stream-reconstruction.pcap` | TCP stream reconstruction — reassembling application-layer data from packets |
| `task7-malicious-traffic.pcap` | Malicious traffic analysis — identifying attack patterns, scans, and exploitation attempts |
| `task8-rdp-analysis.pcap` | RDP (Remote Desktop Protocol) traffic analysis |
| `0-flag.txt` through `7-flag.txt` | CTF flags extracted from the respective pcap files |

---

## Skills Practiced

- Capturing network traffic with `tcpdump`
- Analyzing pcap files with **Wireshark**
- Writing display filters and capture filters
- Extracting credentials from cleartext protocols (HTTP, FTP, Telnet)
- Identifying DNS exfiltration and suspicious query patterns
- Reconstructing TCP streams to recover transferred files or data
- Detecting port scans, brute-force attempts, and exploitation in traffic

---

## Tools

- **Wireshark** — graphical packet analyzer
- **tcpdump** — command-line packet capture
- **tshark** — command-line Wireshark

---

## Key Display Filters

| Filter | Purpose |
|--------|---------|
| `http` | Show only HTTP traffic |
| `dns` | Show only DNS queries and responses |
| `tcp.flags.syn == 1` | Show TCP SYN packets (connection attempts) |
| `ip.addr == x.x.x.x` | Filter by IP address |
| `frame contains "password"` | Search for the string "password" in packets |
