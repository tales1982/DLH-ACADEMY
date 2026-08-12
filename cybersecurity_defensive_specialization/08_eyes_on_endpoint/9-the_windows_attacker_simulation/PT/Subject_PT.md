# 9. A Simulação de Atacante no Windows

**Objetivo:** Executar uma sequência controlada de ações típicas de atacante no endpoint Windows já hardenizado e registrar a verdade fundamental (ground truth) do que foi executado.

## Contexto

A validação de telemetria no Bloco 1 testou cada tipo de evento isoladamente. Esta tarefa testa todos juntos, numa sequência de ataque realista. Você vai rodar o próprio playbook do advisório Crimson Tide contra o seu endpoint já hardenizado: criar um usuário, escalar privilégios, rodar PowerShell codificado, estabelecer persistência, iniciar uma conexão de saída. Cada ação é registrada com seu timestamp exato para que depois (na Tarefa 10) você possa provar que sua instrumentação capturou cada uma delas.

## Instruções

Escreva um script PowerShell `9-windows_attack_sim.ps1` que execute a seguinte sequência, registrando cada ação com um timestamp preciso:

- Criar uma nova conta de usuário local (`support_update`)
- Adicionar o usuário ao grupo Administrators
- Rodar um comando PowerShell codificado (payload inofensivo, por exemplo, `Write-Host "C2 beacon"`)
- Criar uma tarefa agendada para persistência (`schtasks /create`)
- Iniciar uma conexão de rede de saída (`Test-NetConnection` para um IP externo seguro)
- Colocar um arquivo em um diretório de inicialização (`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\`)

Depois da execução, produza um arquivo JSON de ground truth registrando: número da ação, descrição, timestamp exato, fonte de detecção esperada (Sysmon Event ID, Security Event ID), técnica MITRE ATT&CK.

Limpe todos os artefatos após o registro.

## Saída Esperada

```
PS> .\9-windows_attack_sim.ps1
[*] Running Windows attacker simulation...
    [1/6] Creating local user 'support_update'...      2026-03-25T14:30:01Z
    [2/6] Adding to Administrators group...            2026-03-25T14:30:02Z
    [3/6] Running encoded PowerShell...                2026-03-25T14:30:03Z
    [4/6] Creating scheduled task...                   2026-03-25T14:30:04Z
    [5/6] Outbound network connection...                2026-03-25T14:30:05Z
    [6/6] Dropping file in Startup...                   2026-03-25T14:30:06Z
[*] Cleaning up artifacts...
    User removed, task deleted, file removed           [CLEAN]
Actions executed: 6
Ground truth saved to: windows_attack_log.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x02_eyes_on_endpoint`
- **Arquivo:** `9-windows_attack_sim.ps1`
