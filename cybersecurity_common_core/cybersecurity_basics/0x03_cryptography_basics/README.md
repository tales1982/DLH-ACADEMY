# 0x03 — Cryptography Basics

Applied cryptography fundamentals module for security. Covers hashing, password cracking, and hash attack techniques using real tools such as John the Ripper and Hashcat.

---

## Contents

| File | Description |
|------|-------------|
| `0-sha1.sh` | Computes the SHA-1 hash of a file or string |
| `1-sha256.sh` | Computes the SHA-256 hash — recommended algorithm for integrity |
| `2-md5.sh` | Computes the MD5 hash (legacy algorithm, insecure for passwords) |
| `3-password_hash.sh` | Generates password hashes in the Unix system format |
| `4-wordlist_john.sh` | Performs a dictionary attack on hashes using John the Ripper |
| `5-windows_john.sh` | Cracks NTLM (Windows) hashes with John the Ripper |
| `5-password.txt` | Password wordlist for use in attacks |
| `6-crack_john.sh` | Full cracking run with John the Ripper |
| `6-password.txt` | Auxiliary password file |
| `7-crack_hashcat.sh` | Hash cracking with Hashcat (GPU-accelerated) |
| `7-password.txt` | Auxiliary password file |
| `8-combination_hashcat.sh` | Combination attack with Hashcat |
| `9-attack_hashcat.sh` | Mask/brute-force attack with Hashcat |
| `9-password.txt` | Auxiliary password file |

---

## Skills Practiced

- Generating and verifying cryptographic hashes (MD5, SHA-1, SHA-256)
- Understanding differences between hashing algorithms
- Cracking passwords with John the Ripper and Hashcat
- Dictionary, combination, and brute-force attacks
- Why unsalted passwords and weak algorithms are vulnerable

---

## Tools

- `sha1sum`, `sha256sum`, `md5sum`, `openssl`
- **John the Ripper** — hash cracking with wordlists and rules
- **Hashcat** — GPU-accelerated hash cracking
