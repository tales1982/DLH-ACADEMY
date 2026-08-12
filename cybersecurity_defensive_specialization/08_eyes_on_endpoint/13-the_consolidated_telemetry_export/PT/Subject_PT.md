# 13. A Exportação Consolidada de Telemetria

**Objetivo:** Combinar todas as exportações de telemetria Windows e Linux, mais a telemetria de simulação do atacante, em um único pacote estruturado de entrega, com timestamps normalizados entre plataformas.

## Contexto

O Módulo 3 começa com o SOC recebendo telemetria bruta dos endpoints. O pacote de entrega que você constrói aqui É essa telemetria. Ele precisa conter: eventos operacionais normais (o grosso do volume), os eventos da simulação do atacante (o sinal que o SOC precisa encontrar) e a verdade fundamental (ground truth, para o SOC validar suas detecções). Os timestamps precisam ser consistentes entre Windows e Linux (ambos em UTC ISO 8601).

## Instruções

Escreva um script `13-consolidated_export.sh` que:

- Leia `windows_events_export.json` (Tarefa 3) e `linux_events_export.json` (Tarefa 7)
- Normalize todos os timestamps para UTC ISO 8601, caso ainda não estejam
- Verifique a consistência de campos entre plataformas (ambas precisam ter: timestamp, hostname, source_type, event_category)
- Empacote os arquivos de verdade fundamental do atacante (`windows_attack_log.json`, `linux_attack_log.json`) separadamente
- Produza a estrutura de diretório de entrega:

```
telemetry_handoff/
  windows_events.json
  linux_events.json
  attack_ground_truth.json   (combined Windows + Linux)
```

## Saída Esperada

```
$ ./13-consolidated_export.sh
[*] Loading Windows events (2,270)...
[*] Loading Linux events (2,022)...
[*] Normalizing timestamps to UTC...
    Windows: 2,270 events normalized
    Linux: 2,022 events normalized
[*] Verifying field consistency...
    Required fields present in all events    [OK]
[*] Combining ground truth...
    Windows actions: 6 | Linux actions: 6 | Total: 12
[*] Building handoff directory...
telemetry_handoff/
  windows_events.json     (2,270 events, 4.2 MB)
  linux_events.json       (2,022 events, 3.1 MB)
  attack_ground_truth.json (12 actions)
Total: 4,292 events across 2 platforms
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `13-consolidated_export.sh`
