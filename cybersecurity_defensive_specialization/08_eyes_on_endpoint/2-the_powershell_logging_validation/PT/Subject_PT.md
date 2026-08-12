# 2. Validação do Logging do PowerShell

**Objetivo:** Verificar que o Script Block Logging, o Module Logging e a Transcrição do PowerShell estão capturando corretamente comandos de complexidade variada.

## Contexto

O logging do PowerShell foi habilitado. Mas "habilitado" não significa "completo". Comandos codificados deveriam aparecer decodificados nos Script Block Logs. Importações de módulo deveriam aparecer no Module Logging. Operações remotas deveriam gerar transcrições. Essa tarefa prova que cada camada de logging funciona contra os tipos de PowerShell que o atacante Crimson Tide realmente usou.

## Instruções

Escreva um script PowerShell `2-powershell_logging_validation.ps1` que:

- Execute um comando simples (`Get-Process`) e verifique o Event ID 4104 (Script Block)
- Execute um comando codificado (`powershell -enc [base64 de Write-Host "Test"]`) e verifique se o conteúdo decodificado aparece no Event ID 4104
- Execute uma importação de módulo (`Import-Module ActiveDirectory`) e verifique o Event ID 4103 (Module Logging)
- Execute um bloco de script com múltiplas linhas e verifique se o bloco completo foi capturado
- Verifique se um arquivo de transcrição foi criado em `C:\PSTranscripts\` para a sessão

Para cada teste: reporte CAPTURED / MISSED e o nível de detalhe (conteúdo completo vs. parcial).

## Saída Esperada

```
PS> .\2-powershell_logging_validation.ps1
[*] Testing PowerShell logging coverage...
    [1/5] Simple command (Get-Process)...
          EID 4104: "Get-Process" captured                     [PASS]
    [2/5] Encoded command...
          Input: -enc VwByAGkAdABlAC0ASABvAHMAdAAgACIAVABlAHMAdAAi
          EID 4104: "Write-Host 'Test'" (decoded) captured     [PASS]
    [3/5] Module import...
          EID 4103: "Import-Module ActiveDirectory" captured   [PASS]
    [4/5] Multi-line script block...
          EID 4104: Full block captured (12 lines)             [PASS]
    [5/5] Transcription file...
          C:\PSTranscripts\*.txt exists, session recorded      [PASS]
Tests: 5 | Captured: 5 | Missed: 0
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `2-powershell_logging_validation.ps1`
