# 0. Reconhecimento do Domínio

**Objetivo:** Mapear todo o ambiente Active Directory da MedDefense sob uma perspectiva de segurança, estabelecendo o baseline Windows equivalente à Tarefa 0 do módulo 2x00.

## Contexto

Antes de você fortalecer (harden) um domínio Windows, precisa entender com o que está trabalhando. Quantos usuários? Quais grupos? Quais contas de serviço? Quais GPOs existem? Quais são as políticas atuais de senha e auditoria? Este é o equivalente Windows do baseline do Lynis feito na Tarefa 0 do 2x00.

## Instruções

Escreva um script PowerShell `0-domain_baseline.ps1` que capture o estado de segurança completo do domínio MedDefense e produza um relatório estruturado:

- Informações do domínio: nome do domínio, nível funcional da floresta, controladores de domínio
- Todas as contas de usuário: nome, habilitada/desabilitada, último logon, data da última troca de senha, flag de senha nunca expira
- Todos os grupos e seus membros
- Todas as contas de serviço (contas com "svc" no nome ou na OU de Contas de Serviço)
- Todos os GPOs vinculados ao domínio e às OUs
- Política de senha atual: comprimento mínimo, complexidade, histórico, idade máxima
- Política de bloqueio de conta atual (ou "NOT CONFIGURED" se ausente)
- Tipos de criptografia Kerberos suportados
- Todos os usuários com privilégios de Domain Admin ou Enterprise Admin
- Resumo com contagem de findings de segurança

## Saída Esperada

```
PS> .\0-domain_baseline.ps1
Domain: meddefense.local
DC: DC01.meddefense.local
User Accounts: 14
  Password Never Expires: 6
Service Accounts: 3
  Unconstrained delegation: 3
GPOs: 2 (Default only)
Password Minimum Length: 7
Complexity: Disabled
Lockout Threshold: 0
Kerberos: DES, RC4, AES128, AES256
Domain Admins: Administrator, analyst
Findings: 9 (Critical: 3, High: 4, Medium: 2)
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `0-domain_baseline.ps1`
