# O que você precisa fazer

Essa tarefa é conceitualmente parecida com a Tarefa 5 (que já tinha PASS/FAIL para sysctl), mas agora cobrindo TODOS os controles das Tarefas 4-13, e com uma regra importante: esse script NUNCA modifica nada, só lê.

## Passo 1 — Cada checagem é: ler valor real, comparar com valor esperado, imprimir resultado

Para SSH, isso significa ler `/etc/ssh/sshd_config` (com `sshd -T` é ainda melhor, porque mostra a configuração EFETIVA já processada, não só o que está escrito no arquivo). Para sysctl, leia de `/proc/sys/...` como na Tarefa 5. Para serviços, use `systemctl is-active <serviço>`. Para UFW, use `ufw status`.

## Passo 2 — `sshd -T` é mais confiável que fazer `grep` no arquivo de configuração

Se você só faz `grep PermitRootLogin /etc/ssh/sshd_config`, pode pegar uma linha comentada ou ignorar que existem múltiplas diretivas com "Match" que sobrescrevem o valor padrão em contextos específicos. `sudo sshd -T | grep permitrootlogin` mostra o valor final que o daemon realmente vai usar.

## Passo 3 — O código de saída é o que torna esse script útil em automação

`exit 0` só se TODAS as checagens passarem, `exit 1` se qualquer uma falhar — isso é o que permite, por exemplo, um cron job rodar esse script toda segunda de manhã e disparar um alerta automaticamente só quando `$?` for diferente de zero, sem precisar de um humano lendo a saída toda semana.

## Passo 4 — O exemplo de output já mostra um FAIL de propósito — isso é intencional no design da tarefa

O `net.ipv4.conf.all.log_martians = 0 (expected: 1)` no exemplo mostra exatamente o formato que um FAIL deveria ter: valor atual, e entre parênteses o valor esperado. Isso ilustra "drift" acontecendo de verdade — talvez alguém tenha mexido nessa configuração depois do hardening inicial. Seu script precisa detectar e reportar isso claramente, não escondê-lo.

## Onde entregar

O arquivo final vai como `15-validation.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
