# 3. Normalizador de Telemetria do Windows

**Objetivo:** Exportar a telemetria do Windows em JSON pronto para análise, com timestamps normalizados, nomes de campo consistentes e enriquecimento específico por tipo de evento.

## Contexto

A tarefa original de exportação do Windows focava em exportar logs. Essa tarefa reconstruída foca em produzir dados que possam realmente ser consumidos pelo SOC. Dados brutos de EVTX não são suficientes. O analista precisa de registros JSON consistentes, com campos padrão entre os logs de Security, Sysmon e PowerShell.

Esse script se torna a metade Windows do pacote final de handoff de telemetria.

## Instruções

Escreva um script PowerShell chamado `3-windows_telemetry_export.ps1`.

O script precisa exportar telemetria de uma janela de tempo configurável. A janela padrão precisa ser as últimas 24 horas.

O script precisa ler de:

- Log de Security do Windows
- Log Operational do Sysmon
- Log Operational do PowerShell

O script precisa gerar `windows_events_export.json`.

Cada evento exportado precisa incluir campos comuns normalizados:

- `timestamp`
- `hostname`
- `platform`
- `source_type`
- `channel`
- `event_id`
- `event_category`
- `provider`
- `raw_message`

Para tipos de evento chave, extraia campos enriquecidos:

- 4624: usuário alvo, tipo de logon, IP de origem, workstation
- 4625: usuário alvo, motivo da falha, IP de origem
- 4672: conta privilegiada
- 4688: nome do processo, linha de comando, processo pai se presente
- 4104: texto do script block decodificado
- Sysmon 1: imagem, linha de comando, imagem pai, hashes
- Sysmon 3: IP de destino, porta de destino, processo
- Sysmon 11: nome do arquivo alvo, processo criador
- Sysmon 13: chave de registro, nome do valor
- Sysmon 22: nome da consulta, resultados da consulta

O script precisa imprimir contagens por canal e os principais Event IDs.

## Saída Esperada

```
PS> .\3-windows_telemetry_export.ps1
[*] Exporting Windows telemetry from last 24 hours...
Security events: 847
Sysmon events: 1234
PowerShell events: 189
Total events: 2270
Top Event IDs: 4624, Sysmon-1, 4104, 4625
Output: windows_events_export.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `3-windows_telemetry_export.ps1`, `windows_events_export.json`
