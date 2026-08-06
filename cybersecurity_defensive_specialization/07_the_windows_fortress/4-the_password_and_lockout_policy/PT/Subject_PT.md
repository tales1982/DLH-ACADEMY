# 4. Política de Senha e Bloqueio

**Objetivo:** Implantar, via Group Policy, uma política de senha e bloqueio de conta alinhada ao CIS, corrigindo os dois findings mais críticos da sua avaliação do domínio.

## Contexto

O finding mostra comprimento mínimo de senha de 7, complexidade desabilitada, sem bloqueio de conta. O advisory Crimson Tide documentou que senhas fracas e ausência de bloqueio permitiram força bruta e coleta de credenciais nas 5 violações hospitalares. Esta é a GPO de maior impacto que você vai criar.

## Instruções

Escreva um script PowerShell `4-password_policy.ps1` que:

- Crie uma nova GPO chamada "MedDefense - Password and Lockout Policy"
- Configure as definições de senha:
  - Comprimento mínimo: 14 caracteres
  - Complexidade: Habilitada
  - Histórico: 24 senhas lembradas
  - Idade máxima: 0
  - Idade mínima: 1 dia
- Configure o bloqueio de conta:
  - Limite de bloqueio: 5 tentativas
  - Duração do bloqueio: 15 minutos
  - Contador de reset: 15 minutos
- Vincule a GPO à raiz do domínio
- Force uma atualização de Group Policy
- Verifique se a política foi aplicada consultando a política efetiva

## Saída Esperada

```
PS> .\4-password_policy.ps1
[*] Creating GPO: "MedDefense - Password and Lockout Policy"... CREATED
[*] Configuring Password Policy...
    Minimum Length: 14            [SET]
    Complexity: Enabled           [SET]
    History: 24                   [SET]
    Maximum Age: 0                [SET]
    Minimum Age: 1 day            [SET]
[*] Configuring Account Lockout...
    Threshold: 5 attempts         [SET]
    Duration: 15 minutes          [SET]
    Reset Counter: 15 minutes     [SET]
[*] Linking GPO to domain root... LINKED
[*] Forcing Group Policy update... COMPLETE
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x01_windows_fortress`
- **Arquivo:** `4-password_policy.ps1`
