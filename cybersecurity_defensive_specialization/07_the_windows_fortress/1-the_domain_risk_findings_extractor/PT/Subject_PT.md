# 1. Extrator de Findings de Risco do Domínio

**Objetivo:** Produzir o inventário de findings acionáveis que direciona o fluxo de trabalho de hardening do Windows.

## Contexto

A Tarefa 0 mapeia o baseline do domínio, mas dados de baseline sozinhos não bastam. O engenheiro de segurança precisa de um inventário de findings que identifique exatamente o que precisa ser corrigido, qual tarefa corrige aquilo, e qual a severidade do risco. Esta tarefa conecta as fraquezas do Active Directory à política de senha, política de auditoria, hardening de Kerberos, controle de contas de serviço, hardening de GPO e limpeza de objetos obsoletos.

## Instruções

Escreva `1-domain_findings.ps1`.

O script deve auditar `meddefense.local` e gerar `domain_security_findings.json`.

Ele deve identificar:

- Contas com `PasswordNeverExpires`, incluindo nome da conta, estado habilitado/desabilitado, associações de grupo, data da última troca de senha, e se é uma conta de serviço.
- Contas desabilitadas em grupos privilegiados: Domain Admins, Enterprise Admins e G_IT_Admins.
- Objetos de computador obsoletos (stale) sem atividade de logon/autenticação há 90+ dias.
- Lacunas na política de senha e bloqueio em relação ao estado-alvo do Windows Fortress: comprimento mínimo 14, complexidade habilitada, histórico 24, limite de bloqueio 5.
- Falta de visibilidade de auditoria para criação de processo, logon especial, gerenciamento de conta, acesso a objeto e prontidão de PowerShell/Sysmon.
- Riscos de contas de serviço: logon interativo permitido, delegação irrestrita, flag apenas-DES, associação privilegiada, senha obsoleta, ou último logon suspeito.
- Postura de segurança fraca de GPO: GPOs apenas padrão, ausência de GPOs de hardening da MedDefense, ou GPOs sem propósito de segurança claro.

Cada objeto de finding deve incluir `id`, `severity`, `category`, `asset`, `evidence`, `risk`, `recommended_remediation` e `mapped_task`.

## Saída Esperada

```
PS> .\1-domain_findings.ps1
[CRITICAL] Password policy minimum length: 7
[CRITICAL] Account lockout: not configured
[CRITICAL] Kerberos DES/RC4 enabled
[HIGH] 6 accounts with PasswordNeverExpires
[HIGH] 3 service accounts with unconstrained delegation
[HIGH] Advanced Audit Policy: not configured
[MEDIUM] Stale computer objects: 2
[MEDIUM] No MedDefense hardening GPOs present

Findings: 9
Critical: 3
High: 4
Medium: 2
Report saved to: domain_security_findings.json
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `1-domain_findings.ps1`, `domain_security_findings.json`
