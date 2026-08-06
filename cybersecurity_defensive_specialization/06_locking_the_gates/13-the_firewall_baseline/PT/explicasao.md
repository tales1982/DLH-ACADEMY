# O que você precisa fazer

Essa tarefa é relativamente direta com UFW, mas tem uma armadilha séria: se você errar a ordem dos comandos, você pode se trancar fora do próprio servidor via SSH.

## Passo 1 — A ORDEM importa: libere o SSH ANTES de ativar o firewall

Sequência correta: (1) definir `ufw default deny incoming` e `ufw default allow outgoing`, (2) adicionar TODAS as regras de `allow`, incluindo a de SSH, (3) só então rodar `ufw enable`. Se você ativar o firewall antes de garantir a regra de SSH, a sessão atual pode cair e você perde acesso remoto ao servidor.

## Passo 2 — Sintaxe do UFW para regras com origem restrita

`ufw allow from 10.10.1.0/24 to any port 22 proto tcp` é como você limita a porta 22 a uma sub-rede específica, em vez de `ufw allow 22` (que libera de qualquer lugar). Preste atenção nessa diferença — o enunciado é específico sobre "SSH apenas da rede de gerência" e "MySQL apenas da rede de aplicação", que são regras COM restrição de origem, enquanto HTTP/HTTPS são regras SEM restrição (acessíveis de qualquer lugar, já que é um portal de pacientes público).

## Passo 3 — `ufw logging on low` é o nível certo para não inundar o log

O UFW tem níveis de log (`off`, `low`, `medium`, `high`, `full`). "low" registra pacotes bloqueados sem gerar volume excessivo — níveis mais altos podem sobrecarregar o disco rapidamente em um servidor com tráfego real.

## Passo 4 — `ufw status verbose` ou `ufw status numbered` são como você valida o resultado

Depois de aplicar tudo, rode um desses comandos e capture a saída para confirmar que as 4 regras de allow existem e que a política padrão é "deny (incoming), allow (outgoing)" — isso vira a evidência que seu script imprime no resumo final.

## Onde entregar

O arquivo final vai como `13-firewall_baseline.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
