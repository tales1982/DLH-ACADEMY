# 14. Controle de Contas de Serviço

**Objetivo:** Auditar todas as contas de serviço da MedDefense, identificar fraquezas de segurança e implementar medidas de hardening que teriam evitado o comprometimento da `svc_ehr`.

## Contexto

Os findings de segurança (Tarefa 1) revelaram que as contas de serviço têm privilégios excessivos, senhas antigas e delegação irrestrita. O logon suspeito às 3h17 da conta `svc_ehr` sugere que ela pode estar comprometida. Contas de serviço nunca deveriam ter direitos de logon interativo, não deveriam poder criar contas de usuário, e deveriam ter a delegação restrita para prevenir ataques de personificação (impersonation).

## Instruções

Escreva um script PowerShell `14-service_accounts.ps1` que:

- Liste todas as contas de serviço com sua postura de segurança atual: associações de grupo, idade da senha, configurações de delegação, configuração de SPN, último logon
- Sinalize todos os findings (privilégios excessivos, senhas antigas, delegação irrestrita)
- Remedie:
  - Habilite "A conta é confidencial e não pode ser delegada" para todas as contas de serviço
  - Negue direitos de logon interativo
  - Remova de grupos privilegiados aos quais não deveriam pertencer

## Saída Esperada

```
PS> .\14-service_accounts.ps1
svc_backup:
  Password age: 235 days                  [!]
  Delegation: Unconstrained               [!]
svc_ehr:
  Password age: 250 days                  [!]
  Last logon: 03:17 AM                    [!!!]
svc_sql:
  Password age: 293 days                  [!]
  UseDESKeyOnly: True                     [!]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `14-service_accounts.ps1`
