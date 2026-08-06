# 3. Construtor de Referência de Telemetria do Windows

**Objetivo:** Construir uma referência de eventos do Windows legível por máquina que conecta eventos de segurança aos casos de uso de detecção da MedDefense.

## Contexto

Uma lista de findings diz o que está quebrado. Uma referência de telemetria diz como é o "certo" depois que for corrigido — a ponte operacional entre a configuração de política de auditoria (Tarefa 2), a implantação do Sysmon, o logging de PowerShell e o trabalho de detecção do Módulo 3, que consome exatamente essa telemetria. Isso se torna a referência que toda regra de detecção futura e todo runbook do SOC vai citar.

## Instruções

Escreva `3-telemetry_reference.ps1`.

O script deve gerar `windows_event_reference.json`.

A referência deve incluir:

- Log de Segurança: 4624, 4625, 4648, 4672, 4688, 4720, 4726, 4732, 1102.
- Log de PowerShell: 4103, 4104.
- Log do Sysmon: 1, 3, 7, 11, 13, 22.

Para cada evento, inclua `event_id`, `event_name`, `log_source`, `audit_or_sensor_dependency`, `security_meaning`, `normal_frequency`, `triage_priority`, `crimson_tide_phase`, `example_suspicious_pattern` e `validation_method`.

## Saída Esperada

```
PS> .\3-telemetry_reference.ps1
Security events mapped: 9
PowerShell events mapped: 2
Sysmon events mapped: 6
Total events documented: 17
Reference saved to: windows_event_reference.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `3-telemetry_reference.ps1`
