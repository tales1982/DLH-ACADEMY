# 14. Production Hardening Orchestrator

**Goal:** Create a safe master script that runs the hardening workflow in dependency order and records the before/after security delta.

## Context

A production-style hardening script must not run blindly. It must check prerequisites, stop safely, record failures, and generate evidence.

## Instructions

Write `14-hardening_orchestrator.sh`.

The script must run the hardening workflow in this order:

1. `0-baseline_snapshot.sh`
2. Lynis baseline capture or `2-lynis_parse.sh`
3. `4-ssh_hardening.sh`
4. `5-sysctl_hardening.sh`
5. `6-filesystem_hardening.sh`
6. `7-service_minimization.sh`
7. `8-pam_hardening.sh`
8. `9-apparmor_config.sh`
9. `10-auditd_config.sh`
10. `11-audit_coverage_test.sh`
11. `12-log_config.sh`
12. `13-firewall_baseline.sh`
13. `15-validation.sh`

The script must verify required scripts exist, stop immediately on failure, record timing and exit codes, capture pre/post Lynis scores, and write `hardening_run.json` plus `hardening_improvement.json`.

It must be idempotent.

## Expected Output

```
$ sudo ./14-hardening_orchestrator.sh
Pre-checks: PASS
Steps scheduled: 13
Steps completed: 13
Steps failed: 0
Before Lynis score: 52
After Lynis score: 84
Delta: +32
Run log saved to: hardening_run.json
Improvement saved to: hardening_improvement.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `14-hardening_orchestrator.sh`
