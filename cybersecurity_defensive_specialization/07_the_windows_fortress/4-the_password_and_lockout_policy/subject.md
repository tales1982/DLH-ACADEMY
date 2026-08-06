# 4. Password and Lockout Policy

**Goal:** Deploy a CIS-compliant password and account lockout policy via Group Policy, fixing the two most critical findings from your domain assessment.

## Context

Finding password minimum length is 7, complexity disabled, no lockout. The Crimson Tide advisory documented that weak passwords and absent lockout enabled brute-force and credential harvesting in all 5 hospital breaches. This is the single highest-impact GPO you will create.

## Instructions

Write a PowerShell script `4-password_policy.ps1` that:

- Creates a new GPO named "MedDefense - Password and Lockout Policy"
- Configures password settings:
  - Minimum length: 14 characters
  - Complexity: Enabled
  - History: 24 passwords remembered
  - Maximum age: 0
  - Minimum age: 1 day
- Configures account lockout:
  - Lockout threshold: 5 attempts
  - Lockout duration: 15 minutes
  - Reset counter: 15 minutes
- Links the GPO to the domain root
- Forces a group policy update
- Verifies the policy is applied by querying the effective policy

## Expected Output

```
PS> .\4-password_policy.ps1
[*] Creating GPO: "MedDefense - Password and Lockout Policy"... CREATED
[*] Configuring Password Policy...
    Minimum Length: 14            [SET]
    Complexity: Enabled           [SET]
    History: 24                   [SET]
    Maximum Age: 0                [SET]
    Minimum Age: 1 day            [SET]
[*] Configuring Account Lockout...
    Threshold: 5 attempts         [SET]
    Duration: 15 minutes          [SET]
    Reset Counter: 15 minutes     [SET]
[*] Linking GPO to domain root... LINKED
[*] Forcing Group Policy update... COMPLETE
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `4-password_policy.ps1`
