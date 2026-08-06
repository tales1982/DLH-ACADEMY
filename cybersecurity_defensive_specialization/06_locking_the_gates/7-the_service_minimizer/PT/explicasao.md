# O que você precisa fazer

Essa tarefa segue o mesmo esqueleto lógico da Tarefa 6: liste o que existe, compare com uma lista de referência, aja sobre a diferença. Aqui a lista de referência é uma whitelist de SERVIÇOS, não de binários.

## Passo 1 — A whitelist precisa refletir o que o próprio projeto já definiu como necessário

Olhe o output esperado: `ssh`, `apache2`, `mysql`, `ufw`, `auditd`, `apparmor`, `cron`, `rsyslog`, `systemd-timesyncd` — são exatamente 9 serviços, e não por acaso: são os mesmos serviços que as Tarefas 4, 5, 6, 8, 9, 10 deste projeto configuram ou dependem. Sua whitelist não deveria ser um chute genérico, deveria ser literalmente essa lista, com um comentário ao lado de cada um explicando o motivo (ex: `mysql.service` porque hospeda o banco de faturamento).

## Passo 2 — `systemctl list-unit-files --state=enabled` é o ponto de partida, mas cuidado com o formato

O comando lista os serviços habilitados, mas a saída inclui uma linha de cabeçalho e um rodapé com contagem que você precisa filtrar (`grep '\.service'` ajuda). Extraia só o nome do serviço, sem o sufixo de estado, para comparar contra a whitelist.

## Passo 3 — "Desabilitar" é dois comandos, não um

`systemctl stop <serviço>` para parar agora, E `systemctl disable <serviço>` para não subir no próximo boot. O output esperado mostra os dois resultados lado a lado (`[STOPPED] [DISABLED]`), então seu script precisa rodar e verificar os dois comandos separadamente.

## Passo 4 — Cuidado para não desabilitar um serviço do qual o SSH da sua sessão atual depende

Se você estiver testando isso via SSH, nunca pare o `ssh.service` (ele está na whitelist, então não deveria acontecer, mas vale ter certeza que o `ssh.service` nunca aparece na lista de "não-whitelisted" do seu script antes de rodar de verdade).

## Onde entregar

O arquivo final vai como `7-service_minimization.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
