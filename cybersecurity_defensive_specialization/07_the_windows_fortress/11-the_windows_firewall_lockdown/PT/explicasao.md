# O que você precisa fazer

## Passo 1 — TCP e UDP são sempre objetos de regra separados no Windows Firewall

Diferente do que a saída esperada sugere na coluna visual ("TCP/UDP 53"), o cmdlet `New-NetFirewallRule` não aceita os dois protocolos numa única chamada — você precisa criar DUAS regras (uma `-Protocol TCP`, outra `-Protocol UDP`) para DNS e para Kerberos. O parâmetro `-Group` é o que resolve esse descompasso: ele permite marcar várias regras físicas como pertencentes ao mesmo "grupo lógico", então quando você conta "6 regras ativas" na verificação, está contando GRUPOS distintos, não objetos de regra crus (que somam 8, já que DNS e Kerberos usam 2 cada).

## Passo 2 — A ordem importa: primeiro cria as regras de permissão, DEPOIS desabilita as legadas

Se você desabilitasse as regras antigas ANTES de criar as novas, haveria uma janela — mesmo que de milissegundos — em que o RDP de gerenciamento, o LDAP, o Kerberos etc. ficariam bloqueados sem substituto, o que poderia derrubar sua própria sessão administrativa se você estiver conectado via RDP ou WinRM. A sequência do script (capturar estado → default-deny nos perfis → criar as 6 regras específicas → só então desabilitar as legadas) minimiza esse risco.

## Passo 3 — "Desabilitar" é mais seguro que "remover"

O script usa `Disable-NetFirewallRule`, não `Remove-NetFirewallRule`. Se alguma regra legada acabar sendo necessária depois de tudo (por exemplo, uma aplicação clínica que você esqueceu de mapear), reabilitá-la é uma linha de comando — recriar uma regra removida do zero, com o SID/GUID e as configurações exatas do sistema original, é bem mais difícil. Esse é o mesmo princípio de "prefira reversível a destrutivo" que vale para qualquer mudança de infraestrutura.

## Passo 4 — Contar "42 regras legadas" no enunciado é ilustrativo, não um valor fixo para copiar

O número real de regras que o `Get-NetFirewallRule -Direction Inbound -Action Allow -Enabled True` encontra depende inteiramente do estado atual do laboratório (quantas regras padrão o Windows Server 2022 instala, quais roles/features estão presentes). O script usa a contagem REAL (`$legacyRules.Count`), não um número fixo — rodar em máquinas diferentes vai (corretamente) imprimir números diferentes.

## Passo 5 — `Set-NetFirewallProfile -DefaultOutboundAction Allow` é uma escolha deliberada, não um esquecimento

A tarefa pede negação padrão só para tráfego de ENTRADA (inbound) — trocar a saída (outbound) para negação padrão também é uma prática de segurança válida em ambientes mais maduros, mas quebraria silenciosamente coisas como atualizações do Windows, replicação do AD e resolução de DNS externo sem uma lista de permissões de saída cuidadosamente mapeada primeiro. Por isso o escopo desta tarefa é estritamente inbound, deixando outbound como um projeto futuro documentado, não uma omissão.

## Onde entregar

O arquivo final vai como `11-firewall_hardening.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
