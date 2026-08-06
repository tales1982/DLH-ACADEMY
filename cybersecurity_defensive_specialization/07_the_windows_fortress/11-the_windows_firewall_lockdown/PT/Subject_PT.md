# 11. Bloqueio do Firewall do Windows

**Objetivo:** Configurar o Firewall do Windows com uma política de negação padrão (default-deny) para entrada e regras de permissão específicas por serviço, implementando segmentação de rede em nível de endpoint.

## Contexto

O reconhecimento do domínio encontrou: perfil de Domínio LIGADO mas permissivo, perfis Privado e Público DESLIGADOS. Isso significa que qualquer aplicação pode escutar em qualquer porta sem restrição alguma. O firewall deve impor o princípio do menor privilégio em nível de rede: só os serviços que PRECISAM estar acessíveis são permitidos na entrada.

## Instruções

Escreva um script PowerShell `11-firewall_hardening.ps1` que:

- Capture o estado atual do firewall
- Habilite os TRÊS perfis (Domínio, Privado, Público) com negação padrão na entrada
- Crie regras de permissão apenas para os serviços necessários:
  - RDP (TCP 3389) apenas da sub-rede de gerenciamento (10.10.3.0/24)
  - DNS (TCP/UDP 53) para operação do DC
  - LDAP (TCP 389) para autenticação do AD
  - Kerberos (TCP/UDP 88) para o AD
  - SMB (TCP 445) apenas da sub-rede de servidores
  - WinRM (TCP 5985/5986) apenas da sub-rede de gerenciamento
- Habilite o log de pacotes descartados
- Desabilite regras de permissão legadas que conflitem com a nova política

## Saída Esperada

```
PS> .\11-firewall_hardening.ps1
[*] Current Firewall State...
    Domain: ON, DefaultInbound: Allow       [!]
    Private: OFF                            [!]
    Public: OFF                             [!]
[*] Setting default-deny on all profiles... [SET]
[*] Creating allow rules...
    MedDef-RDP-Mgmt:  TCP 3389 from 10.10.3.0/24     [CREATED]
    MedDef-DNS:        TCP/UDP 53                    [CREATED]
    MedDef-LDAP:       TCP 389                       [CREATED]
    MedDef-Kerberos:   TCP/UDP 88                    [CREATED]
    MedDef-SMB:        TCP 445 from 10.10.1.0/24     [CREATED]
    MedDef-WinRM:      TCP 5985-5986 from 10.10.3.0/24 [CREATED]
[*] Enabling dropped packet logging...     [SET]
[*] Disabling 42 legacy allow rules...     [DONE]
[*] Verification...
    All 3 profiles: ON, DefaultInbound: Block  [VERIFIED]
    Custom rules: 6 active                     [VERIFIED]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `11-firewall_hardening.ps1`
