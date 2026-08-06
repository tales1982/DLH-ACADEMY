# 15. Script de Validação Mestre

**Objetivo:** Produzir o script de validação abrangente que verifica cada configuração de hardening, servindo como a checagem semanal de conformidade do domínio Windows.

## Contexto

James Chen vai rodar isso toda sexta-feira. Ele não faz nenhuma alteração no sistema. Ele lê cada configuração implantada, compara contra os valores esperados e produz um painel de conformidade. Este é o equivalente Windows do `15-validation.sh` do 2x00.

## Instruções

Escreva um script PowerShell `15-master_validation.ps1` que verifique cada configuração de hardening, reportando PASS/WARN/FAIL para cada uma. O script deve terminar com código de saída 0 se todas as verificações críticas passarem, código 1 se qualquer verificação crítica falhar.

## Saída Esperada

```
PS> .\15-master_validation.ps1
--- Password & Lockout) ---
[PASS] Minimum length: 14
[PASS] Lockout threshold: 5

--- Audit Policy ---
[PASS] Process Creation: Success
[PASS] Command-line logging: Enabled
[PASS] Security log: 1 GB

--- PowerShell ---
[PASS] Script Block Logging: Enabled
[PASS] Transcription: Enabled

--- Sysmon ---
[PASS] Service: Running
[PASS] Custom rules: 5 present

--- Kerberos ---
[PASS] DES: Disabled
[PASS] RC4: Disabled

--- SMB ---
[PASS] SMBv1: Disabled
[PASS] Signing: Required

--- Firewall ---
[PASS] All profiles: ON, DefaultInbound: Block

--- RDP ---
[PASS] NLA: Required
[PASS] G_IT_Admins only

--- Service Accounts ---
[PASS] Delegation restricted: 3/3
[WARN] svc_backup password age: 235 days
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `15-master_validation.ps1`
