# O que você precisa fazer

## Passo 1 — Em um controlador de domínio, "Remote Desktop Users" não é um grupo LOCAL como você imagina

Em uma estação de trabalho ou servidor membro comum, "Remote Desktop Users" é um grupo local (SAM), gerenciado com `Add-LocalGroupMember`/`Remove-LocalGroupMember`. Mas um controlador de domínio não tem uma base SAM local independente da forma tradicional — ele usa o grupo INTEGRADO do Active Directory chamado "Remote Desktop Users" (um grupo de domínio local de verdade, visível no AD), gerenciado com `Get-ADGroupMember`/`Add-ADGroupMember`/`Remove-ADGroupMember`. Usar os cmdlets de grupo local aqui simplesmente não funcionaria — é uma pegadinha específica de DC que vale a pena entender.

## Passo 2 — `MaxIdleTime` e `MaxConnectionTime` são armazenados em MILISSEGUNDOS, não minutos

15 minutos = 15 × 60 × 1000 = 900.000 milissegundos. 8 horas = 8 × 60 × 60 × 1000 = 28.800.000 milissegundos. É um erro fácil de cometer confundir essa unidade — se você passar `15` ou `900` (segundos) diretamente, o timeout vai ficar praticamente instantâneo ou muito curto, derrubando sessões RDP legítimas quase imediatamente.

## Passo 3 — "Criptografia máxima" na verdade são DOIS valores de registro, não um só

`MinEncryptionLevel = 3` diz "não aceite nada abaixo do nível Alto." `SecurityLayer = 2` diz "negocie a camada de segurança via SSL/TLS (Negotiate/Enhanced RDP Security)" em vez do protocolo RDP legado nativo. Configurar só um dos dois deixa uma lacuna: por exemplo, definir só o `MinEncryptionLevel` sem trocar a `SecurityLayer` ainda usa a negociação de segurança RDP clássica, mais fraca e mais suscetível a ataques man-in-the-middle do que a camada SSL/TLS moderna.

## Passo 4 — Área de transferência e redirecionamento de unidade são o canal de exfiltração MAIS ÓBVIO em uma sessão RDP, e o mais fácil de esquecer

Um atacante com uma sessão RDP ativa (legítima ou roubada) pode simplesmente copiar arquivos da máquina remota para a área de transferência, colar na própria máquina, ou mapear uma unidade local dentro da sessão RDP e arrastar arquivos diretamente — sem precisar de nenhuma outra ferramenta de exfiltração. Desabilitar `fDisableClip` e `fDisableCdm` fecha esse canal, e é uma das mudanças de mais alto impacto e mais baixo custo operacional desta tarefa (a maioria dos administradores nunca precisa colar arquivos via RDP no dia a dia de um controlador de domínio).

## Onde entregar

O arquivo final vai como `13-rdp_hardening.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
