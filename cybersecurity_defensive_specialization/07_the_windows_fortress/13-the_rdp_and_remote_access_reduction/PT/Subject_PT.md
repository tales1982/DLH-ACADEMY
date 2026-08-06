# 13. Redução de RDP e Acesso Remoto

**Objetivo:** Proteger o Remote Desktop Protocol para impedir que ele seja um ponto de entrada de movimento lateral, restringindo o acesso a administradores autorizados com controles de sessão fortes.

## Contexto

O RDP foi usado para movimento lateral no ataque Crimson Tide (Fase 3). A MedDefense atualmente permite RDP de qualquer usuário, sem exigência de Network Level Authentication, sem timeout de sessão e sem restrição de IP de origem. O redirecionamento de área de transferência e de unidades permite que um atacante exfiltre dados diretamente pela sessão RDP.

## Instruções

Escreva um script PowerShell `13-rdp_hardening.ps1` que:

- Habilite o Network Level Authentication (NLA)
- Restrinja o acesso RDP apenas ao grupo `G_IT_Admins`
- Configure o timeout de sessão ociosa para 15 minutos, sessão máxima para 8 horas
- Force o nível de criptografia mais alto
- Desabilite o redirecionamento de área de transferência e de unidades (risco de exfiltração)
- Desabilite o Assistência Remota
- Verifique todas as configurações

## Saída Esperada

```
PS> .\13-rdp_hardening.ps1
[*] Enabling NLA... UserAuthentication = 1       [SET]
[*] Restricting to G_IT_Admins...
    Removed: Domain Users from Remote Desktop Users
    Added: G_IT_Admins                           [SET]
[*] Session limits...
    Idle timeout: 15 min                         [SET]
    Max session: 8 hours                         [SET]
[*] Encryption: High/SSL                         [SET]
[*] Clipboard: Disabled                          [SET]
[*] Drive redirection: Disabled                  [SET]
[*] Remote Assistance: Disabled                  [SET]
[*] Verification...
    NLA: Required                                [VERIFIED]
    Access: G_IT_Admins only                     [VERIFIED]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `13-rdp_hardening.ps1`
