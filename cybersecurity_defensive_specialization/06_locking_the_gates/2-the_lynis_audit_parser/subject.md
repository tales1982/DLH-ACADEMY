# 2. The Lynis Audit Parser

**Goal:** Parse a report file and produce a machine-readable JSON summary of the most important audit results.

## Context

Lynis stores the most important audit data in a key-value report file, usually `lynis-report.dat`. This file is easier to parse than the terminal output or the verbose log file. Converting it into JSON makes the audit results easier to inspect, filter, and reuse in a security workflow.

## Instructions

Run a full Lynis audit on the system. Then write a script `2-lynis_parse.sh` that:

- accepts the path to a `.dat` report file as its first argument (`"$1"`)
- extracts the Lynis hardening index
- extracts every `warning[]`, `suggestion[]`, and `manual_check[]` entry
- parses each finding into:
  - `severity`
  - `test_id`
  - `message`
- produces a structured JSON report on standard output

**Hint:** `man jq`

## Expected Output

```
$ ./2-lynis_parse.sh /var/log/lynis-report.dat | jq '.' > lynis_findings.json

$ cat lynis_findings.json
{
  "hardening_index": 62,
  "findings": [
    {
      "severity": "suggestion",
      "test_id": "LYNIS",
      "message": "This release is more than 4 months old. Check the website or GitHub to see if there is an update available."
    },
    {
      "severity": "suggestion",
      "test_id": "DEB-0280",
      "message": "Install libpam-tmpdir to set $TMP and $TMPDIR for PAM sessions"
    },
...
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `2-lynis_parse.sh`, `lynis_findings.json`
