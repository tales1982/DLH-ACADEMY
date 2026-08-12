# 8. O Portão de Qualidade da Telemetria Linux

**Objetivo:** Avaliar a qualidade da telemetria Linux usando o mesmo padrão aplicado à telemetria Windows.

## Contexto

Este projeto é multiplataforma. Se a telemetria Windows é medida com rigor mas a telemetria Linux é apenas exportada, o handoff fica desigual. Esta tarefa reconstruída torna a qualidade da telemetria Linux comparável à qualidade da telemetria Windows, medindo distribuição, completude de campos, cobertura de timestamp e lacunas de visibilidade.

## Instruções

Escreva um script Bash chamado `8-linux_telemetry_quality.sh`.

O script precisa ler `linux_events_export.json` e produzir `linux_telemetry_quality.json`.

O relatório de qualidade precisa incluir:

- Distribuição de eventos
  - contagem por categoria de evento
  - contagem por tipo de fonte
  - percentual do total
- Cobertura de tempo
  - eventos por hora
  - horas com eventos
  - horas sem eventos
- Detecção de lacunas
  - qualquer período maior que 30 minutos sem eventos
- Completude de campos
  - timestamp
  - hostname
  - source_type
  - event_category
  - linha de comando para execve
  - IP de origem/usuário para eventos SSH
  - caminho/operação/chave para eventos de arquivo do auditd
- Pontuação de qualidade
  - pontuação ponderada de 0 a 100
  - avaliação: good, acceptable ou poor

O script precisa usar `jq` para o parsing de JSON.

## Saída Esperada

```
$ ./8-linux_telemetry_quality.sh
[*] Analyzing linux_events_export.json...
Total events: 2022
Hours with events: 24/24
No gaps detected
execve command_line completeness: 100%
SSH source_ip completeness: 100%
auditd file path completeness: 100%
Quality score: 96.1% (good)
Report saved to: linux_telemetry_quality.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `8-linux_telemetry_quality.sh`
