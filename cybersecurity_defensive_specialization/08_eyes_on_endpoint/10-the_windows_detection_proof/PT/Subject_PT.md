# 10. A Prova de Detecção no Windows

**Objetivo:** Correlacionar o log da simulação de ataque Windows com a telemetria capturada para produzir uma matriz de detecção que prove quais ações foram capturadas, por qual fonte e com que nível de detalhe.

## Contexto

Agora você tem dois conjuntos de dados: o ground truth (Tarefa 9) e a telemetria capturada (logs de Security, Sysmon, PowerShell). Esta tarefa mapeia um contra o outro. Para cada ação que o atacante tomou, ela foi capturada? Por qual fonte? Com qual Event ID? Com que nível de detalhe? Essa matriz de detecção é a prova de que sua instrumentação funciona em condições realistas.

## Instruções

Escreva um script PowerShell `10-windows_detection_proof.ps1` que:

- Leia `windows_attack_log.json` (ground truth da Tarefa 9)
- Para cada ação simulada, pesquise os Logs de Eventos do Windows (Security, Sysmon, PowerShell) dentro de uma janela de 30 segundos ao redor do timestamp registrado
- Registre: qual fonte capturou, o Event ID, o nível de detalhe (full/partial/missed), os campos-chave presentes

## Saída Esperada

```
PS> .\10-windows_detection_proof.ps1
[*] Loading ground truth (6 actions)...
[*] Searching telemetry for each action...
Action                     Source         Event ID   Detail    Status
------                     ------         --------   ------    ------
Create user                Security       4720       Full      [CAPTURED]
Add to Administrators      Security       4732       Full      [CAPTURED]
Encoded PowerShell         PS ScriptBlock 4104       Full      [CAPTURED]
                           Sysmon         1          Full      [CAPTURED]
Scheduled task             Sysmon         1          Full      [CAPTURED]
Outbound connection        Sysmon         3          Full      [CAPTURED]
Startup file drop          Sysmon         11         Full      [CAPTURED]
Actions: 6 | Captured: 6/6 (100%) | Multi-source: 1
Report saved to: windows_detection_matrix.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `10-windows_detection_proof.ps1`
