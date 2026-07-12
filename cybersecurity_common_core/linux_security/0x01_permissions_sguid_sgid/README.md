# 0x01 — Permissions, SUID & SGID

Module covering Linux file permission management, privilege escalation vectors through SUID/SGID bits, and secure file handling practices.

---

## Contents

| File | Description |
|------|-------------|
| `0-add_user.sh` | Adds a new user to the system |
| `1-add_group.sh` | Creates a new group |
| `2-sudo_nopass.sh` | Configures a user to run sudo without a password |
| `3-find_files.sh` | Finds files with specific permission settings |
| `4-find_suid.sh` | Searches the system for files with the SUID bit set |
| `5-find_sgid.sh` | Searches the system for files with the SGID bit set |
| `6-check_files.sh` | Checks file permissions and ownership |
| `7-file_read.sh` | Sets read-only permissions for other users |
| `8-change_user.sh` | Changes file ownership using `chown` |
| `9-empty_file.sh` | Creates a file with full permissions (777) |

---

## Skills Practiced

- Linux user and group management (`useradd`, `groupadd`)
- Understanding and modifying file permissions with `chmod`
- Changing file ownership with `chown` and `chgrp`
- Identifying SUID and SGID binaries — common privilege escalation vectors
- Auditing file permissions for security misconfigurations

---

## Key Concepts

- **SUID (Set User ID)**: allows a file to run with the permissions of its owner — dangerous if set on writable scripts
- **SGID (Set Group ID)**: allows a file or directory to run with the group's permissions
- Finding SUID/SGID files: `find / -perm /4000` and `find / -perm /2000`
