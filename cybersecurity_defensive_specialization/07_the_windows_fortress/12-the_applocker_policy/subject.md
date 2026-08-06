# 12. AppLocker Policy

**Goal:** Deploy AppLocker application allow-listing to prevent unauthorized executables from running, blocking the ransomware deployment mechanism used by Crimson Tide.

## Context

Crimson Tide deployed ransomware as an executable pushed via GPO. AppLocker would have blocked this: if only approved executables are allowed to run, a malicious payload dropped by GPO fails to execute. AppLocker is the control that would have stopped Phase 6 dead. But AppLocker has a clinical constraint: physicians use a medical imaging application (`DicomViewer.exe`) signed by a small medical software company. The policy must allow this while blocking everything else.

## Instructions

Write a PowerShell script `12-applocker_config.ps1` that:

- Creates a GPO named "MedDefense - AppLocker Policy"
- Configures executable rules (`.exe`, `.com`):
  - Allow: Windows system directories (`C:\Windows\*`)
  - Allow: Program Files (`C:\Program Files\*`, `C:\Program Files (x86)\*`)
  - Allow: MedDefense-approved applications (explicit path rule for DicomViewer)
  - Deny: All other locations
- Configures script rules (`.ps1`, `.bat`, `.cmd`, `.vbs`):
  - Allow: System scripts from `C:\Windows\*`
  - Allow: Admin scripts from `C:\MedDefense_Lab\Scripts\*`
  - Deny: All other locations
- Sets AppLocker to Audit Only mode (not Enforce, to avoid breaking applications during the testing period)
- Starts the Application Identity service
- Exports the AppLocker policy XML

## Expected Output

```
PS> .\12-applocker_config.ps1
[*] Creating GPO: "MedDefense - AppLocker Policy"... CREATED
[*] Starting AppIDSvc... Running           [OK]
[*] Configuring Executable Rules...
    Allow: C:\Windows\*                    [SET]
    Allow: C:\Program Files\*              [SET]
    Allow: C:\Program Files (x86)\*        [SET]
    Allow: DicomViewer.exe (MedImage Corp) [SET]
    Default: DENY                          [SET]
[*] Configuring Script Rules...
    Allow: C:\Windows\*                    [SET]
    Allow: C:\MedDefense_Lab\Scripts\*     [SET]
    Default: DENY                          [SET]
[*] Mode: AUDIT ONLY (not enforcing)
[*] Linking GPO... COMPLETE
[*] Testing...
    notepad.exe from C:\Windows: ALLOWED   [EXPECTED]
    calc.exe from C:\Temp: WOULD BLOCK     [EXPECTED]
Policy exported to: applocker_policy.xml
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `12-applocker_config.ps1`, `applocker_policy.xml`
