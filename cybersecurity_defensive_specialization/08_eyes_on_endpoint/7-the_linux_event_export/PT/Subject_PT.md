# 7. A Exportação de Eventos Linux

**Objetivo:** Exportar logs Linux relevantes para segurança, de uma janela de tempo definida, para JSON estruturado com campos normalizados, em paralelo à exportação Windows da Task 3.

## Contexto

O analista do Módulo 3 precisa da telemetria Linux no mesmo formato estruturado da telemetria Windows. O auth.log registra logins SSH e uso de sudo. O auditd registra eventos em nível de syscall. O syslog captura atividade de serviços. Esse script analisa cada formato e produz um JSON consistente que pode ser consultado com `jq` junto com a exportação Windows.

## Instruções

Escreva um script `7-linux_export.sh` que:

- Analise o auth.log para extrair eventos SSH (sucesso/falha de login, IP de origem, usuário), eventos de sudo (usuário, comando) e eventos de su
- Analise os logs do auditd para extrair eventos de syscall (execve com linha de comando, acesso a arquivo com caminho, criação de socket de rede com destino)
- Analise o syslog para extrair eventos de início/parada de serviço e condições de erro
- Para cada evento: normalize o timestamp para ISO 8601 UTC, extraia hostname, source_type, event_category e campos-chave

## Saída Esperada

```
$ ./7-linux_export.sh
[*] Parsing auth.log... 523 events
    SSH logins: 47 | sudo: 312 | su: 8 | PAM: 156
[*] Parsing audit.log... 1,187 events
    execve: 478 | file_access: 423 | network: 156 | other: 130
[*] Parsing syslog... 312 events
    service: 89 | error: 23 | other: 200
Total events: 2,022
Time range: 2026-03-25T00:00:00Z to 2026-03-25T23:59:59Z
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `7-linux_export.sh`
