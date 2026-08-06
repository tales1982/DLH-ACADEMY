# O que você precisa fazer

Estruturalmente essa tarefa é irmã da Tarefa 4: backup → aplica → verifica. A diferença é que aqui a "verificação" não é só sintaxe (como `sshd -t`), é ler de volta o valor real que o kernel aplicou.

## Passo 1 — `sysctl -p` só aplica o que está no arquivo, então escreva no arquivo primeiro

O fluxo é: editar/adicionar as linhas em `/etc/sysctl.conf` (ou em um arquivo dentro de `/etc/sysctl.d/`, o que é considerado mais correto na prática, mas o enunciado pede especificamente para editar o `sysctl.conf`), e só depois rodar `sysctl -p` para aplicar tudo de uma vez. Não rode `sysctl -w` parâmetro por parâmetro se você quer que a configuração também sobreviva a um reboot.

## Passo 2 — O PASS/FAIL não é sobre o comando ter funcionado, é sobre o valor final estar certo

Depois de aplicar, leia o valor de volta com `cat /proc/sys/net/ipv4/ip_forward` (por exemplo) e compare com o valor esperado (`0`). Só imprima "PASS" se os dois valores realmente coincidirem — isso pega casos em que, por exemplo, um módulo do kernel não está carregado e o parâmetro não existe (o que deveria aparecer como "FAIL", não travar o script).

## Passo 3 — Alguns parâmetros aqui usam caminhos com "." no sysctl mas "/" no /proc

Um parâmetro como `net.ipv4.conf.all.accept_redirects` no `sysctl.conf` corresponde ao caminho `/proc/sys/net/ipv4/conf/all/accept_redirects` — os pontos se tornam barras. Isso é fácil de programar com uma simples substituição de string (`echo "$param" | tr '.' '/'`), mas é fácil esquecer e vale testar manualmente primeiro.

## Passo 4 — Cuidado ao desabilitar IPv6 se o laboratório depende dele

Antes de aplicar `net.ipv6.conf.all.disable_ipv6 = 1` de verdade, confirme que a conexão SSH que você está usando para acessar o laboratório é via IPv4 (os dados de acesso mostram `127.0.0.1` e `10.10.1.10`, que são IPv4, então deve ser seguro) — mas em qualquer sistema real, desabilitar IPv6 sem verificar isso primeiro pode cortar seu próprio acesso.

## Onde entregar

O arquivo final vai como `5-sysctl_hardening.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
