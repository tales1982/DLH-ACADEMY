# 0x02 — Mandatory Access Control (MAC)

Module covering Mandatory Access Control with SELinux — one of the strongest security mechanisms in Linux systems, used to enforce fine-grained policies beyond traditional DAC (Discretionary Access Control).

---

## Contents

| File | Description |
|------|-------------|
| `0-analyse_mode.sh` | Checks the current SELinux mode (Enforcing, Permissive, or Disabled) |
| `1-security_match.sh` | Verifies SELinux security context matching for files and processes |
| `2-list_http.sh` | Lists SELinux policies and contexts related to the HTTP service |
| `3-add_port.sh` | Adds a new port to an SELinux policy (e.g., allowing a custom port for a service) |
| `4-list_user.sh` | Lists SELinux user mappings |
| `5-add_selinux.sh` | Applies an SELinux context to a file or directory |
| `6-list_booleans.sh` | Lists SELinux boolean settings (policy toggles) |
| `7-set_sendmail.sh` | Configures SELinux settings for the Sendmail service |

---

## Skills Practiced

- Understanding MAC vs. DAC (Discretionary Access Control)
- Checking and switching SELinux modes with `getenforce` / `setenforce`
- Reading and managing SELinux security contexts (`ls -Z`, `chcon`, `restorecon`)
- Adding custom port rules with `semanage port`
- Adjusting SELinux booleans with `setsebool`
- Troubleshooting SELinux denials with `audit2why` and `ausearch`

---

## Key Concepts

- **SELinux Modes**: Enforcing (policies are enforced), Permissive (violations are logged only), Disabled
- **Security Contexts**: every file and process has a label — `user:role:type:level`
- **Booleans**: on/off policy switches that adjust behavior without rewriting policies
- SELinux is the default MAC implementation on RHEL, CentOS, and Fedora systems
