# 10. O Motor de Auditoria

**Objetivo:** Implantar e configurar o auditd para monitorar eventos críticos de segurança, criando a trilha de auditoria que alimenta a exportação de telemetria futura.

## Contexto

As notas de Marcus Webb do incidente do 1x00: "Nenhum SIEM ou IDS estava implantado. O atacante se moveu sem ser detectado por 5 dias." O `auditd` é o framework de auditoria do kernel Linux. Ele registra chamadas de sistema, acessos a arquivos e eventos de autenticação no nível do kernel. Os logs que ele gera se tornam a principal fonte de dados Linux para o trabalho de análise no Módulo 3. As regras que você escreve aqui determinam o que o SOC consegue enxergar.

## Instruções

Escreva um script `10-auditd_config.sh` que:

- Instale e habilite o `auditd`
- Implante regras de auditoria em `/etc/audit/rules.d/meddefense.rules` cobrindo: arquivos de identidade, escalação de privilégio, execução de ferramentas suspeitas e integridade de arquivos específicos da MedDefense
- Carregue as regras e verifique se estão ativas
- Teste disparando um evento auditável e checando o log

## Saída Esperada

```
$ sudo ./10-auditd_config.sh
[*] Enabling auditd service...
    auditd.service: active (running)
[*] Deploying MedDefense audit rules...
    -w /etc/passwd -p wa -k identity              [ADDED]
    -w /etc/shadow -p wa -k identity              [ADDED]
    -w /etc/group -p wa -k identity               [ADDED]
    -w /etc/pam.d/ -p wa -k pam_config            [ADDED]
    -w /etc/ssh/sshd_config -p wa -k sshd_config  [ADDED]
    -w /usr/bin/sudo -p x -k priv_esc             [ADDED]
    -w /usr/bin/su -p x -k priv_esc               [ADDED]
    -w /etc/sudoers -p wa -k sudoers              [ADDED]
    -w /usr/bin/wget -p x -k suspicious_download  [ADDED]
    -w /usr/bin/curl -p x -k suspicious_download  [ADDED]
    -w /usr/bin/nc -p x -k suspicious_netcat      [ADDED]
    -w /var/lib/mysql/ -p wa -k meddefense_db     [ADDED]
    -w /etc/apache2/ -p wa -k meddefense_web      [ADDED]
    -w /etc/init.d/ -p wa -k startup_scripts      [ADDED]
[*] Loading rules... augenrules --load: OK
[*] Verifying... auditctl -l: 14 rules loaded
[*] Test: reading /etc/shadow...
    ausearch -ts recent -k identity: 1 event found [PASS]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `10-auditd_config.sh`
