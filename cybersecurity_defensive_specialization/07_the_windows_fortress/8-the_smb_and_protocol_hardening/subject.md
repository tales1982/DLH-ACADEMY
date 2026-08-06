# 8. SMB and Protocol Hardening

**Goal:** Disable SMBv1 and enforce SMB signing to eliminate one of the most commonly exploited lateral movement vectors in enterprise Windows environments.

## Context

SMBv1 is the protocol behind EternalBlue (WannaCry, NotPetya). The Crimson Tide advisory did not use EternalBlue, but SMBv1 remains enabled on MedDefense's domain controller. Disabling it costs nothing and removes an entire class of attacks. SMB signing prevents relay attacks. SMB encryption prevents network sniffing of file transfers.

## Instructions

Write a PowerShell script `8-smb_hardening.ps1` that:

- Checks current SMB configuration (v1 enabled, signing, encryption)
- Disables SMBv1 (client and server)
- Enables SMB signing (required, not just enabled)
- Enables SMB encryption where supported
- Disables legacy protocols: NetBIOS over TCP/IP, LLMNR
- Verifies each change with before/after comparison

## Expected Output

```
PS> .\8-smb_hardening.ps1
[*] Current SMB Configuration...
    SMBv1: Enabled                         [!]
    Signing Required: False                [!]
    Encryption: False                      [!]
[*] Disabling SMBv1 (server + client)...   [DONE]
[*] Enforcing SMB Signing...               [SET]
[*] Enabling SMB Encryption...             [SET]
[*] Disabling NetBIOS over TCP/IP...       [SET]
[*] Disabling LLMNR via GPO...             [SET]
[*] Verification...
    SMBv1: Disabled                        [VERIFIED]
    Signing: Required                      [VERIFIED]
    Encryption: Enabled                    [VERIFIED]
    LLMNR: Disabled                        [VERIFIED]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `8-smb_hardening.ps1`
