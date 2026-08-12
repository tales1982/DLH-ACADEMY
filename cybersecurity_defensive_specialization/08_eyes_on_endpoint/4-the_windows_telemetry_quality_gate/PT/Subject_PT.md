# 4. O Portão de Qualidade da Telemetria Windows

**Objetivo:** Avaliar se a telemetria Windows exportada está completa, contínua e é útil o suficiente para o handoff ao analista.

## Contexto

Telemetria exportada ainda pode ter baixa qualidade. Ela pode ter campos de linha de comando ausentes, campos de IP de origem vazios, lacunas de tempo, ou um tipo de evento barulhento afogando todo o resto. Essa tarefa é reconstruída como um portão de qualidade que aceita ou rejeita a exportação do Windows antes que ela entre no pacote final de handoff.

## Instruções

Escreva um script PowerShell chamado `4-windows_telemetry_quality.ps1`.

O script precisa ler `windows_events_export.json` e produzir `windows_telemetry_quality.json`.

O relatório de qualidade precisa incluir:

- Distribuição de eventos
  - contagem por Event ID
  - percentual do total
- Distribuição por canal
  - Security
  - Sysmon
  - PowerShell
- Cobertura de tempo
  - eventos por hora
  - horas com eventos
  - horas sem eventos
- Detecção de lacunas
  - períodos de tempo maiores que 30 minutos sem eventos
- Completude de campos
  - campos obrigatórios preenchidos vs. vazios/nulos por tipo de evento
  - completude da linha de comando para eventos de processo
  - completude do IP de origem para eventos de logon
  - completude do script block para eventos do PowerShell
- Pontuação de qualidade
  - pontuação ponderada de 0 a 100
  - avaliação: good, acceptable ou poor

## Saída Esperada

```
PS> .\4-windows_telemetry_quality.ps1
[*] Analyzing windows_events_export.json...
Total events: 2270
Hours with events: 23/24
Largest gap: 60 minutes
Command-line completeness: 100%
Source IP completeness: 97%
Script block completeness: 100%
Quality score: 94.2% (good)
Report saved to: windows_telemetry_quality.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `4-windows_telemetry_quality.ps1`, `windows_telemetry_quality.json`
