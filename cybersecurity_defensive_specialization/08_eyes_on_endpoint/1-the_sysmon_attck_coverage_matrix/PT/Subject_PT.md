# 1. Matriz de Cobertura ATT&CK do Sysmon

**Objetivo:** Produzir uma matriz de cobertura estruturada que prove quais técnicas de atacante estão visíveis através da configuração atual do Sysmon e quais precisam de ajuste fino.

## Contexto

A tarefa original de gap do Sysmon era útil, mas era estreita demais. Neste projeto, telemetria não é apenas uma checagem de configuração. O ponto é provar se a instrumentação do endpoint produz evidência útil para comportamentos específicos de atacante. Essa tarefa reconstruída transforma a configuração do Sysmon em uma matriz de cobertura alinhada ao ATT&CK que as tarefas seguintes de detecção e handoff podem usar.

A cobertura do Sysmon precisa ser medida em três dimensões:

- Se os Event IDs necessários estão habilitados
- Se a configuração filtra a atividade
- Se o evento resultante tem campos suficientes para suportar a triagem

## Instruções

Escreva um script PowerShell chamado `1-sysmon_coverage_matrix.ps1`.

O script precisa ler `sysmonconfig.xml` e gerar `sysmon_coverage_matrix.json`.

O script precisa:

- Analisar os tipos de evento do Sysmon habilitados no XML
- Identificar regras de inclusão/exclusão que possam suprimir eventos relevantes
- Mapear técnicas do ATT&CK para os Event IDs do Sysmon necessários
- Avaliar cada técnica como: `covered`, `partial`, `blind`
- Incluir o motivo do status
- Incluir uma ação de ajuste recomendada para cada item parcial ou cego
- Imprimir um resumo da cobertura

Mapeamentos mínimos do ATT&CK:

- T1059 Command and Scripting Interpreter — Sysmon EID 1
- T1053 Scheduled Task/Job — Sysmon EID 1
- T1547 Boot or Logon Autostart Execution — Sysmon EID 13
- T1055 Process Injection — Sysmon EID 8, 10
- T1071 Application Layer Protocol — Sysmon EID 3, 22
- T1574.002 DLL Side-Loading — Sysmon EID 7
- T1027 Obfuscated or Compressed Files — Sysmon EID 11, 15

Cada linha da matriz precisa incluir:

- `technique_id`
- `technique_name`
- `required_event_ids`
- `enabled_event_ids`
- `filter_conflicts`
- `coverage_status`
- `evidence_fields_expected`
- `recommendation`

## Saída Esperada

```
PS> .\1-sysmon_coverage_matrix.ps1
[*] Parsing Sysmon config: sysmonconfig.xml
Enabled Event IDs: 1, 3, 7, 11, 12, 13, 22
Techniques assessed: 7
Covered: 5
Partial: 2
Blind: 0
Report saved to: sysmon_coverage_matrix.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `1-sysmon_coverage_matrix.ps1`, `sysmon_coverage_matrix.json`
