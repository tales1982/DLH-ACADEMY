# 12. A Prova de Detecção no Linux

**Objetivo:** Correlacionar o log de simulação de ataque no Linux com a telemetria capturada para produzir uma matriz de detecção.

## Contexto

Mesma metodologia da Tarefa 10, aplicada às fontes Linux: auditd, auth.log e syslog. Para cada ação do atacante, ela foi capturada? Por qual fonte? Com qual nível de detalhe? A matriz de detecção revela se as regras de auditd do 2x00 e os refinamentos da Tarefa 5 oferecem cobertura adequada.

## Instruções

Escreva um script `12-linux_detection_proof.sh` que:

- Leia `linux_attack_log.json` (verdade fundamental da Tarefa 11)
- Para cada ação, busque no auditd (via `ausearch`), no auth.log e no syslog dentro de uma janela de 30 segundos
- Registre: fonte, chave de auditoria (audit key, se auditd), nível de detalhe, campos-chave presentes
- Produza uma matriz de detecção como JSON estruturado

## Saída Esperada

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

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `12-linux_detection_proof.sh`
