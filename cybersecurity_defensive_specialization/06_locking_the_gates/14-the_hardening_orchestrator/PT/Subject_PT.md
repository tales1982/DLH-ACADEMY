# 14. Orquestrador de Hardening de Produção

**Objetivo:** Criar um script mestre seguro que executa o fluxo de hardening na ordem correta de dependências e registra o delta de segurança antes/depois.

## Contexto

Um script de hardening no estilo produção não pode rodar às cegas. Ele precisa checar pré-requisitos, parar com segurança, registrar falhas e gerar evidências.

## Instruções

Escreva `14-hardening_orchestrator.sh`.

O script precisa executar o fluxo de hardening nesta ordem:

1. `0-baseline_snapshot.sh`
2. Captura da linha de base do Lynis ou `2-lynis_parse.sh`
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

O script precisa verificar se os scripts exigidos existem, parar imediatamente em caso de falha, registrar tempo de execução e códigos de saída, capturar as pontuações do Lynis antes/depois, e escrever `hardening_run.json` mais `hardening_improvement.json`.

Ele precisa ser idempotente.

## Saída Esperada

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

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `14-hardening_orchestrator.sh`
