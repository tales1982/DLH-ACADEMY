# O que você precisa fazer

## Passo 1 — "Desabilitar SMBv1" tem DUAS metades, e é fácil esquecer uma

`Set-SmbServerConfiguration -EnableSMB1Protocol $false` desliga só o LADO SERVIDOR (o DC parar de aceitar conexões SMBv1 de entrada). O lado CLIENTE (o próprio DC tentando falar SMBv1 com outra máquina) é controlado separadamente, pelo recurso opcional do Windows `SMB1Protocol` (ou os subrecursos `SMB1Protocol-Client`/`-Server`/`-Deprecation` em algumas versões). Desabilitar só um lado deixa a outra metade do ataque ainda possível — por isso o script tenta os dois mecanismos.

## Passo 2 — "Assinatura obrigatória" é diferente de "assinatura habilitada"

`EnableSecuritySignature` diz "eu aceito assinar se o outro lado pedir." `RequireSecuritySignature` diz "eu recuso a conexão se não for assinada." A tarefa pede explicitamente "obrigatória, não apenas habilitada" — configurar só `EnableSecuritySignature=$true` deixaria a porta aberta para um ataque de downgrade onde o atacante simplesmente não pede assinatura e a conexão não assinada é aceita mesmo assim.

## Passo 3 — `TcpipNetbiosOptions = 2` não é intuitivo

Esse valor WMI tem três estados: `0` = usar o que o DHCP mandar, `1` = forçar habilitado, `2` = forçar desabilitado. Não existe um "desligado por padrão" nesse enum — se você deixar em `0` achando que está desabilitando, na prática está dizendo "deixa o DHCP decidir", o que normalmente significa que o NetBIOS continua ativo.

## Passo 4 — O registro do LLMNR é o mesmo, esteja ele vindo de uma GPO ou aplicado direto na máquina

`EnableMulticast=0` em `HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient` é exatamente o valor que a configuração de GPO "Turn off multicast name resolution" escreve. Aplicá-lo diretamente no controlador de domínio (como este script faz) tem o efeito idêntico ao de uma GPO já processada — é por isso que a tarefa fala em "via GPO" mesmo sem o script criar uma GPO nova: a categoria da configuração é de política de grupo (fica na hive `Policies`), independente de como ela chegou até o registro.

## Passo 5 — Por que LLMNR importa tanto quanto o NetBIOS

Os dois são protocolos de resolução de nomes "de reposição" que o Windows usa quando o DNS normal falha — e os dois respondem a QUALQUER host na rede que pergunte, sem autenticação. Um atacante rodando Responder (ou ferramenta equivalente) na mesma rede pode se passar por um host inexistente e capturar hashes NTLM de quem tentou resolver aquele nome. Desabilitar ambos fecha essa porta de coleta de credenciais sem custo operacional algum em uma rede com DNS funcional.

## Onde entregar

O arquivo final vai como `8-smb_hardening.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
