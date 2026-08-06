# 11. Teste de Cobertura de Telemetria de Auditoria

**Objetivo:** Provar que as regras de auditoria implantadas na Tarefa 10 realmente capturam os eventos de segurança com os quais a MedDefense se preocupa.

## Contexto

O validador de auditoria original incentivava mudanças arriscadas no sistema. Essa versão reconstruída mantém a ideia operacional, mas torna o teste mais seguro, controlado, mensurável e utilizável como evidência final de conformidade.

## Instruções

Escreva `11-audit_coverage_test.sh`.

O script precisa produzir `audit_validation.json` e testar pelo menos seis eventos controlados:

- execução de comando privilegiado via `sudo`
- tentativa de acesso a `/etc/shadow`
- execução de `wget` ou `curl`
- leitura ou checagem de metadados de `/etc/ssh/sshd_config`
- escrita controlada em um arquivo temporário sob um caminho de teste monitorado
- inspeção de configuração de cron ou ação controlada em um arquivo de teste de cron

Para cada teste, registre nome do teste, chave de auditoria esperada, comando executado, timestamp, status de captura, e contagem ou trecho do evento correspondente.

O script precisa incluir lógica de limpeza e não pode deixar para trás contas de teste, arquivos ou tarefas de cron inseguras.

## Saída Esperada

```
$ sudo ./11-audit_coverage_test.sh
[*] Running audit telemetry coverage tests...
[1/6] sudo execution                    [CAPTURED]
[2/6] shadow access                     [CAPTURED]
[3/6] suspicious download tool          [CAPTURED]
[4/6] sshd config read                  [CAPTURED]
[5/6] monitored test file write         [CAPTURED]
[6/6] cron configuration check          [CAPTURED]
[*] Cleaning test artifacts...
Tests executed: 6
Captured: 6
Missed: 0
Report saved to: audit_validation.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `11-audit_coverage_test.sh`
