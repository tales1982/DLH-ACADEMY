# 5. Política de Auditoria Avançada

**Objetivo:** Configurar as Políticas de Auditoria Avançada via GPO para gerar os eventos de segurança necessários para detecção, fechando as lacunas de visibilidade identificadas na Tarefa 2.

## Contexto

A política de auditoria padrão do Windows registra quase nada útil. O Event ID 4688 (criação de processo) não é gerado por padrão. O log do processo não inclui a linha de comando completa. O uso de privilégios não é auditado. Isso significa que, se um atacante rodar PowerShell em uma estação da MedDefense agora mesmo, não existe NENHUMA evidência do que foi executado. A Política de Auditoria Avançada substitui a política básica por uma configuração granular por categoria. É isso que transforma os Logs de Eventos do Windows de "ruído" em "evidência."

## Instruções

Escreva um script PowerShell `5-audit_policy.ps1` que:

- Crie uma GPO chamada "MedDefense - Advanced Audit Policy"
- Configure as seguintes categorias de auditoria (Sucesso e Falha onde aplicável):
  - Account Logon: Credential Validation (S/F), Kerberos Authentication (S/F)
  - Logon/Logoff: Logon (S/F), Logoff (S), Special Logon (S)
  - Account Management: User Account Management (S/F)
  - Privilege Use: Sensitive Privilege Use (S/F)
  - Object Access: File System (S/F), Registry (S/F)
  - Process Tracking: Process Creation (S)
- Habilite o log da linha de comando nos eventos de criação de processo (adiciona a linha de comando completa ao Event ID 4688)
- Restrinja a limpeza do log de Segurança apenas aos Domain Admins
- Configure o tamanho do log de Segurança para 1 GB
- Vincule a GPO e force uma atualização
- Verifique com `auditpol /get /category:*`

## Saída Esperada

```
PS> .\5-audit_policy.ps1
[*] Creating GPO: "MedDefense - Advanced Audit Policy"... CREATED
[*] Configuring Audit Categories...
    Credential Validation:    Success, Failure   [SET]
    Kerberos Authentication:  Success, Failure   [SET]
    Logon:                    Success, Failure   [SET]
    Special Logon:            Success            [SET]
    User Account Management:  Success, Failure   [SET]
    Sensitive Privilege Use:  Success, Failure   [SET]
    Process Creation:         Success            [SET]
[*] Enabling command-line in process creation events...   [SET]
[*] Restricting Security log clearing...                  [SET]
[*] Setting Security log max size to 1 GB...              [SET]
[*] Linking GPO and forcing update... COMPLETE
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `5-audit_policy.ps1`
