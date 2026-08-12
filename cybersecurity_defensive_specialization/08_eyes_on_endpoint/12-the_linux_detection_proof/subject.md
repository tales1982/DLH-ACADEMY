# 12. Linux Detection Proof

**Goal:** Correlate the Linux attack simulation log against captured telemetry to produce a detection matrix.

## Context

Same methodology as Task 10, applied to Linux sources: auditd, auth.log and syslog. For each attacker action, was it captured? By which source? With what detail? The detection matrix reveals whether the auditd rules from 2x00 and the refinements from Task 5 provide adequate coverage.

## Instructions

Write a script `12-linux_detection_proof.sh` that:

- Reads `linux_attack_log.json` (ground truth from Task 11)
- For each action, searches auditd (via `ausearch`), auth.log and syslog within a 30-second window
- Records: source, audit key (if auditd), detail level, key fields present
- Produces a detection matrix as structured JSON

## Expected Output

```
$ sudo ./12-linux_detection_proof.sh
[*] Loading ground truth (6 actions)...
[*] Searching telemetry...
Action                     Source         Key              Detail    Status
------                     ------         ---              ------    ------
Create user                auditd         identity         Full      [CAPTURED]
                           auth.log       useradd          Full      [CAPTURED]
Modify sudoers             auditd         sudoers          Full      [CAPTURED]
Execute from /tmp          auditd         process_exec     Full      [CAPTURED]
Reverse shell               auditd         network_connect  Full      [CAPTURED]
Cron persistence           auditd         cron_persist     Full      [CAPTURED]
Access /etc/shadow         auditd         identity         Full      [CAPTURED]
Actions: 6 | Captured: 6/6 (100%) | Multi-source: 1
Report saved to: linux_detection_matrix.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x02_eyes_on_endpoint`
- **File:** `12-linux_detection_proof.sh`
