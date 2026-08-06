# 1. MedDefense CIS Control Profile

**Goal:** Build a threat-driven CIS hardening profile for MedDefense Linux servers that becomes the input for later remediation tasks.

## Context

The original CIS priority task leaned too heavily toward manual benchmark interpretation. In this project, scripts are the primary deliverable. This rebuilt task turns CIS prioritization into a structured, reusable control profile that later scripts can consume.

MedDefense does not need a generic list of CIS recommendations. It needs a focused control profile for `billing-srv-01`, `web-srv-01`, and `log-srv-01`, tied to the project's actual risks: SSH lateral movement, weak authentication, unnecessary services, missing audit visibility, exposed database services, and insufficient kernel hardening.

## Instructions

Write `1-cis_profile.sh`.

The script must generate `cis_profile.json` containing exactly 15 controls. Each control must include:

- `control_id`
- `title`
- `cis_section`
- `severity` (critical, high, or medium)
- `asset_scope`
- `threat_mapping`
- `implementation_task`
- `verification_method`
- `justification`

The selected controls must cover SSH, kernel/sysctl hardening, PAM, service minimization, filesystem permissions, audit logging, firewall exposure, and log retention.

## Expected Output

```
$ ./1-cis_profile.sh
Controls selected: 15
Critical: 5
High: 7
Medium: 3
CIS sections covered: 5
Mapped implementation tasks: 10
Report saved to: cis_profile.json
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `1-cis_profile.sh`, `cis_profile.json`
