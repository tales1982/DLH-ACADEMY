# 4. O Bloqueio do SSH

**Objetivo:** Fortalecer o SSH para eliminar a autenticação por senha e reduzir a superfície de ataque ao mínimo necessário para as operações da MedDefense.

## Contexto

Finding 009 da sua avaliação de vulnerabilidades (1x02): "O SSH no billing-srv-01 permite autenticação por senha. Combinado com a ausência de política de bloqueio de conta, isso permite ataques de força bruta." O alerta do Crimson Tide confirmou: em 3 das 5 violações de hospitais, o atacante usou credenciais roubadas para movimento lateral via SSH (Fase 3). Isso é a primeira coisa que você corrige.

## Instruções

Escreva um script `4-ssh_hardening.sh` que:

- Faça backup do `sshd_config` atual em `/etc/ssh/sshd_config.bak`
- Aplique as seguintes configurações de hardening do SSH (cada uma com um comentário referenciando a ameaça que ela endereça):
  - `PermitRootLogin no`
  - `PasswordAuthentication no`
  - `PermitEmptyPasswords no`
  - `X11Forwarding no`
  - `MaxAuthTries 3`
  - `ClientAliveInterval 300` e `ClientAliveCountMax 2` (timeout de inatividade: 10 min)
  - `AllowUsers medadmin sysadmin`
  - `Protocol 2`
  - `LoginGraceTime 60`
  - `Banner /etc/issue.net`
- Crie o arquivo de banner `/etc/issue.net`
- Valide a sintaxe da configuração com `sshd -t`
- Se a validação passar, reinicie o SSH. Se falhar, restaure o backup.

## Saída Esperada

```
$ sudo ./4-ssh_hardening.sh
[*] Backing up /etc/ssh/sshd_config
[*] Applying SSH hardening settings...
    PermitRootLogin no
    PasswordAuthentication no
    PermitEmptyPasswords no
    X11Forwarding no
    MaxAuthTries 3
    ClientAliveInterval 300
    ClientAliveCountMax 2
    AllowUsers medadmin sysadmin
    Protocol 2
    LoginGraceTime 60
    Banner /etc/issue.net
[*] Validating SSH configuration...
    sshd -t: OK
[*] Restarting SSH service...
    ssh.service: active (running)
Settings applied: 11
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `4-ssh_hardening.sh`
