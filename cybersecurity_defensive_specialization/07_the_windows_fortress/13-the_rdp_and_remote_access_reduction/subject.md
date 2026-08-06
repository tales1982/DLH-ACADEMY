# 13. RDP and Remote Access Reduction

**Goal:** Secure Remote Desktop Protocol to prevent it from being a lateral movement entry point, restricting access to authorized administrators with strong session controls.

## Context

RDP was used for lateral movement in the Crimson Tide attack (Phase 3). MedDefense currently allows RDP from any user, with no Network Level Authentication requirement, no session timeout and no restriction on source IP. Clipboard and drive redirection allow an attacker to exfiltrate data directly through the RDP session.

## Instructions

Write a PowerShell script `13-rdp_hardening.ps1` that:

- Enables Network Level Authentication (NLA)
- Restricts RDP access to `GITAdmins` group only
- Sets session idle timeout to 15 minutes, max session to 8 hours
- Enforces highest encryption level
- Disables clipboard and drive redirection (exfiltration risk)
- Disables Remote Assistance
- Verifies all settings

## Expected Output

```
PS> .\13-rdp_hardening.ps1
[*] Enabling NLA... UserAuthentication = 1       [SET]
[*] Restricting to G_IT_Admins...
    Removed: Domain Users from Remote Desktop Users
    Added: G_IT_Admins                           [SET]
[*] Session limits...
    Idle timeout: 15 min                         [SET]
    Max session: 8 hours                         [SET]
[*] Encryption: High/SSL                         [SET]
[*] Clipboard: Disabled                          [SET]
[*] Drive redirection: Disabled                  [SET]
[*] Remote Assistance: Disabled                  [SET]
[*] Verification...
    NLA: Required                                [VERIFIED]
    Access: G_IT_Admins only                     [VERIFIED]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `13-rdp_hardening.ps1`
