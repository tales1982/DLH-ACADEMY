# 9. Implantação do Sysmon

**Objetivo:** Instalar e configurar o Sysmon com uma configuração otimizada para detecção, implantando a ferramenta de detecção de endpoint mais importante da plataforma Windows.

## Contexto

Os Logs de Eventos do Windows capturam autenticação e criação de processo. O Sysmon captura tudo o mais: conexões de rede, consultas DNS, timestamps de criação de arquivo, modificações de registro, carregamento de drivers, eventos WMI, conexões de named pipe. O Sysmon transforma um endpoint Windows de "eu sei quem fez login" para "eu sei o que ele executou, com o que se conectou, quais arquivos criou, quais chaves de registro modificou e quais conexões de rede fez." Sem o Sysmon, detectar o movimento lateral do atacante Crimson Tide (PsExec, WMI), a exfiltração de dados (Rclone) e a implantação do ransomware seria praticamente impossível.

## Instruções

Escreva um script PowerShell `9-sysmon_deploy.ps1` que:

- Baixe o Sysmon do site da Microsoft Sysinternals
- Baixe a configuração Sysmon da SwiftOnSecurity como baseline
- Instale o Sysmon com a configuração
- Verifique se o Sysmon está rodando, o driver está carregado e eventos estão sendo gerados
- Teste criando um arquivo em `C:\Windows\Temp\` e verificando se um Event ID 11 do Sysmon (FileCreate) aparece

Produza o `sysmonconfig.xml` como um entregável separado.

## Saída Esperada

```
PS> .\9-sysmon_deploy.ps1
[*] Downloading Sysmon... OK
[*] Downloading SwiftOnSecurity config... OK
[*] Installing Sysmon with config...
    Sysmon64.exe -accepteula -i sysmonconfig.xml
    Service: Sysmon64 - Running            [OK]
    Driver: SysmonDrv - Loaded             [OK]
[*] Verifying event generation...
    Events in last 60 seconds: 12          [OK]
[*] Testing FileCreate detection...
    Created: C:\Windows\Temp\sysmon_test.txt
    Event ID 11 captured                   [VERIFIED]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `9-sysmon_deploy.ps1`, `sysmonconfig.xml`
