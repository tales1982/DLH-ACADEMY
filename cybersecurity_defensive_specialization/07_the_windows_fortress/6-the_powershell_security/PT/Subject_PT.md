# 6. Segurança do PowerShell

**Objetivo:** Configurar o logging do PowerShell e restrições de execução para garantir que todo comando PowerShell executado nos sistemas da MedDefense seja capturado, neutralizando a ferramenta pós-exploração mais poderosa do atacante.

## Contexto

O PowerShell é a ferramenta legítima mais comumente abusada em pós-exploração. O advisory Crimson Tide registrou `powershell.exe -enc [base64]` nos logs de criação de processo dos hospitais comprometidos (Fase 3). Sem o Script Block Logging, comandos PowerShell codificados são invisíveis. Sem o Module Logging, você não consegue rastrear quais capacidades o atacante carregou. Sem a Transcrição, você não tem registro completo da sessão.

## Instruções

Escreva um script PowerShell `6-powershell_security.ps1` que:

- Crie uma GPO chamada "MedDefense - PowerShell Security"
- Habilite o Script Block Logging (registra o conteúdo decodificado de todo script PowerShell, incluindo comandos codificados)
- Habilite o Module Logging para todos os módulos
- Habilite a Transcrição para `C:\PSTranscripts\`
- Verifique se a integração AMSI está ativa
- Teste executando um comando PowerShell codificado e verificando se ele aparece decodificado no Event ID 4104

## Saída Esperada

```
PS> .\6-powershell_security.ps1
[*] Creating GPO: "MedDefense - PowerShell Security"... CREATED
[*] Configuring Script Block Logging...
    EnableScriptBlockLogging = 1           [SET]
    -> Event ID 4104 captures decoded scripts
[*] Configuring Module Logging...
    EnableModuleLogging = 1, ModuleNames = *  [SET]
    -> Event ID 4103 captures module invocations
[*] Configuring Transcription...
    OutputDirectory = C:\PSTranscripts     [SET]
[*] Verifying AMSI... AMSI DLL loaded     [OK]
[*] Linking GPO and forcing update... COMPLETE
[*] Testing encoded command...
    Input: powershell -enc VwByAGkAdABlAC0ASABvAHMAdAAgACIAVABlAHMAdAAi
    Event ID 4104 found: "Write-Host 'Test'"  [VERIFIED]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `6-powershell_security.ps1`
