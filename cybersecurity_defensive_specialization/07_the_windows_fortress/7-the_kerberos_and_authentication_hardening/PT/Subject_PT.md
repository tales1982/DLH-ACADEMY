# 7. Hardening de Kerberos e Autenticação

**Objetivo:** Desabilitar tipos fracos de criptografia Kerberos e reforçar os protocolos de autenticação para bloquear Kerberoasting e ataques de roubo de credenciais.

## Contexto

Finding do 1x02: "O Active Directory suporta os tipos de criptografia Kerberos DES e RC4." O advisory Crimson Tide confirmou: "Em 3 dos 5 casos, o atacante explorou Kerberoasting (tickets de serviço criptografados em RC4, quebrados offline)." Tickets RC4 podem ser quebrados em minutos com hashcat. Tickets AES-256 levam anos. A correção é direta: desabilitar DES e RC4, forçar apenas AES. Mas se alguma aplicação legada autentica usando RC4, desabilitá-lo quebra essa autenticação.

## Instruções

Escreva um script PowerShell `7-auth_hardening.ps1` que:

- Consulte os tipos de criptografia Kerberos atualmente suportados pelo domínio
- Identifique quaisquer contas de serviço com a flag "Use DES encryption types"
- Verifique a configuração de SPN de cada conta de serviço
- Desabilite o DES em todas as contas sinalizadas
- Configure o domínio para suportar apenas AES128 e AES256 no Kerberos
- Desabilite o NTLMv1 (permita apenas NTLMv2 como fallback)
- Configure a conscientização sobre Credential Guard
- Verifique a nova configuração

## Saída Esperada

```
PS> .\7-auth_hardening.ps1
[*] Current Kerberos types: DES, RC4, AES128, AES256
    [!] DES enabled - trivially breakable
    [!] RC4 enabled - Kerberoastable
[*] Accounts with DES flag...
    svc_sql: UseDESKeyOnly = True          [!]
[*] Service Principal Names...
    svc_backup: HTTP/backup.meddefense.local
    svc_ehr: HTTP/ehr.meddefense.local
    svc_sql: MSSQLSvc/sql.meddefense.local:1433
    [!] All 3 SPNs are Kerberoastable targets
[*] Remediating...
    svc_sql: Clearing DES flag              [DONE]
    Supported encryption: AES128 + AES256   [SET]
    NTLMv1: Refused (LmCompatibilityLevel=5) [SET]
[*] Verifying...
    Kerberos: AES128, AES256 only           [VERIFIED]
    NTLM: v2 only                           [VERIFIED]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `7-auth_hardening.ps1`
