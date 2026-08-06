# 2. Avaliação do Log de Eventos do Windows

**Objetivo:** Avaliar a capacidade atual de geração de logs verificando quais IDs de Evento críticos o domínio está de fato gerando e identificando as lacunas de visibilidade.

## Contexto

Você precisa saber o que o domínio é capaz de enxergar hoje. Se o Event ID 4688 (criação de processo) não está sendo gerado, todo processo que o atacante executar é invisível. Se o Event ID 4672 (logon especial) não é logado, você não consegue detectar quando alguém usa privilégios administrativos. Esta tarefa quantifica a lacuna entre o que o domínio vê hoje e o que ele precisa ver.

## Instruções

Escreva um script PowerShell `2-eventlog_assessment.ps1` que:

- Verifique a configuração atual da política de auditoria usando `auditpol /get /category:*`
- Para cada Event ID crítico (4624, 4625, 4648, 4688, 4720, 4726, 4732, 4672, 1102), verifique se a subcategoria de auditoria necessária está habilitada
- Consulte o log de Segurança para confirmar quais Event IDs foram de fato gerados nas últimas 24 horas

## Saída Esperada

```
PS> .\2-eventlog_assessment.ps1
Event ID  Description               Audit Subcategory     Status
--------  -----------               -----------------     ------
4624      Successful Logon          Logon                 [GENERATING]
4625      Failed Logon              Logon                 [GENERATING]
4648      Explicit Credentials      Logon                 [NOT CONFIGURED]
4688      Process Creation          Process Tracking      [NOT CONFIGURED]
4720      Account Created           Account Management     [NOT CONFIGURED]
4726      Account Deleted           Account Management     [NOT CONFIGURED]
4732      Member Added to Group     Account Management     [NOT CONFIGURED]
4672      Special Logon             Special Logon         [NOT CONFIGURED]
1102      Audit Log Cleared         System Integrity      [GENERATING]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `2-eventlog_assessment.ps1`
