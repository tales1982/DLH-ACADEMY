# 8. Hardening de SMB e Protocolos

**Objetivo:** Desabilitar o SMBv1 e forçar a assinatura SMB para eliminar um dos vetores de movimento lateral mais explorados em ambientes Windows corporativos.

## Contexto

O SMBv1 é o protocolo por trás do EternalBlue (WannaCry, NotPetya). O advisory Crimson Tide não usou o EternalBlue, mas o SMBv1 continua habilitado no controlador de domínio da MedDefense. Desabilitá-lo não custa nada e remove uma classe inteira de ataques. A assinatura SMB previne ataques de relay. A criptografia SMB previne a captura de transferências de arquivo na rede.

## Instruções

Escreva um script PowerShell `8-smb_hardening.ps1` que:

- Verifique a configuração SMB atual (v1 habilitado, assinatura, criptografia)
- Desabilite o SMBv1 (cliente e servidor)
- Habilite a assinatura SMB (obrigatória, não apenas habilitada)
- Habilite a criptografia SMB onde suportada
- Desabilite protocolos legados: NetBIOS sobre TCP/IP, LLMNR
- Verifique cada mudança com uma comparação antes/depois

## Saída Esperada

```
PS> .\8-smb_hardening.ps1
[*] Current SMB Configuration...
    SMBv1: Enabled                         [!]
    Signing Required: False                [!]
    Encryption: False                      [!]
[*] Disabling SMBv1 (server + client)...   [DONE]
[*] Enforcing SMB Signing...               [SET]
[*] Enabling SMB Encryption...             [SET]
[*] Disabling NetBIOS over TCP/IP...       [SET]
[*] Disabling LLMNR via GPO...             [SET]
[*] Verification...
    SMBv1: Disabled                        [VERIFIED]
    Signing: Required                      [VERIFIED]
    Encryption: Enabled                    [VERIFIED]
    LLMNR: Disabled                        [VERIFIED]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `8-smb_hardening.ps1`
