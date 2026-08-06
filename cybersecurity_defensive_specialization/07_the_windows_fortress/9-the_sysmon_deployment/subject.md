# 9. Sysmon Deployment

**Goal:** Install and configure Sysmon with a detection-optimized configuration, deploying the single most important endpoint detection tool on the Windows platform.

## Context

Windows Event Logs capture authentication and process creation. Sysmon captures everything else: network connections, DNS queries, file creation timestamps, registry modifications, driver loads, WMI events, named pipe connections. Sysmon transforms a Windows endpoint from "I know who logged in" to "I know what they ran, what it connected to, what files it created, what registry keys it modified and what network connections it made." Without Sysmon, detecting the Crimson Tide attacker's lateral movement (PsExec, WMI), data exfiltration (Rclone) and ransomware deployment would be nearly impossible.

## Instructions

Write a PowerShell script `9-sysmon_deploy.ps1` that:

- Downloads Sysmon from the Microsoft Sysinternals website
- Downloads the SwiftOnSecurity Sysmon configuration as a baseline
- Installs Sysmon with the configuration
- Verifies Sysmon is running, the driver is loaded and events are generating
- Tests by creating a file in `C:\Windows\Temp\` and verifying a Sysmon Event ID 11 (FileCreate) appears

Produce the `sysmonconfig.xml` as a separate deliverable.

## Expected Output

```
PS> .\9-sysmon_deploy.ps1
[*] Downloading Sysmon... OK
[*] Downloading SwiftOnSecurity config... OK
[*] Installing Sysmon with config...
    Sysmon64.exe -accepteula -i sysmonconfig.xml
    Service: Sysmon64 - Running            [OK]
    Driver: SysmonDrv - Loaded             [OK]
[*] Verifying event generation...
    Events in last 60 seconds: 12          [OK]
[*] Testing FileCreate detection...
    Created: C:\Windows\Temp\sysmon_test.txt
    Event ID 11 captured                   [VERIFIED]
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x01_windows_fortress`
- **File:** `9-sysmon_deploy.ps1`, `sysmonconfig.xml`
