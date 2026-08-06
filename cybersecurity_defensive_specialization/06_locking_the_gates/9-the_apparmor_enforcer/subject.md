# 9. The AppArmor Enforcer

**Goal:** Deploy and configure AppArmor profiles in enforce mode for all network-exposed services, implementing mandatory access control that limits damage even if a service is compromised.

## Context

When the crypto-miner compromised billing-srv-01 through Apache (1x00 incident), it had full access to the filesystem as `www-data`. AppArmor would have confined the Apache process to only the directories it needs. AppArmor is the difference between "the attacker got a shell on our web server" and "the attacker got a shell that can only access `/var/www`." A custom profile for the MedDefense billing application ensures that even a zero-day in the application cannot reach patient data directories.

## Instructions

Write a script `9-apparmor_config.sh` that:

- Verifies AppArmor is installed and running
- Lists all current profiles and their status
- Switches profiles for Apache and MySQL from complain to enforce mode
- Creates a custom AppArmor profile for a MedDefense application that restricts filesystem access to its required directories only
- Reports unconfined processes that should have profiles
- Prints a summary with enforce/complain/unconfined counts

## Expected Output

```
$ sudo ./9-apparmor_config.sh
[*] Checking AppArmor status...
    AppArmor module: loaded
    AppArmor service: active
[*] Profile enforcement:
    /usr/sbin/apache2        complain -> enforce  [ENFORCED]
    /usr/sbin/mysqld         complain -> enforce  [ENFORCED]
    /usr/sbin/sshd           enforce              [OK]
[*] Custom profile: /opt/meddefense/billing-app   [CREATED] [ENFORCED]
[*] Unconfined network-exposed processes:
    /usr/sbin/rsyslogd       [UNCONFINED - Profile recommended]
Profiles in enforce: 4 | Complain: 0 | Unconfined: 1
```

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/2x00_locking_the_gates`
- **File:** `9-apparmor_config.sh`
