# O que você precisa fazer

Essa é a tarefa de "amarrar tudo" — um script que chama todos os outros scripts do projeto em sequência, com controle de erro adequado. É mais sobre orquestração e tratamento de falhas do que sobre hardening em si.

## Passo 1 — "Parar imediatamente em caso de falha" significa checar o código de saída de CADA script

Depois de chamar cada script (ex: `./4-ssh_hardening.sh`), verifique `$?` (o código de saída). Se for diferente de 0, registre a falha no `hardening_run.json`, imprima quantos passos foram completados vs. agendados, e pare — não continue para o próximo script como se nada tivesse acontecido. Isso é o que `set -e` faria automaticamente para comandos simples, mas para múltiplos scripts chamados em sequência, é mais seguro checar explicitamente.

## Passo 2 — "Verificar se os scripts exigidos existem" é um pré-check antes de começar qualquer coisa

Antes de rodar o passo 1, cheque se todos os 13 arquivos de script da lista realmente existem e são executáveis (`[ -x "$script" ]`). Se algum estiver faltando, aborte com "Pre-checks: FAIL" antes mesmo de tocar no sistema — isso evita hardening parcial por causa de um arquivo esquecido.

## Passo 3 — O "antes/depois" do Lynis não é feito pelo orquestrador sozinho, ele reaproveita os scripts anteriores

"Lynis baseline capture" no passo 2 significa rodar o Lynis de verdade e guardar o resultado ANTES do hardening começar; depois de todos os passos de hardening (incluindo a validação do passo 15), rode o Lynis DE NOVO para pegar a pontuação final. A diferença entre essas duas pontuações é o "Delta: +32" do output esperado.

## Passo 4 — Idempotência aqui significa "posso rodar o orquestrador inteiro de novo sem quebrar nada"

Como cada script individual (das Tarefas 4-13) já deve ser idempotente por conta própria, o orquestrador herda essa propriedade automaticamente SE ele não fizer nada além de chamar os scripts em ordem e registrar resultados. Não adicione lógica no orquestrador que dependa de "essa é a primeira execução" — trate toda execução como se pudesse ser uma re-execução.

## Onde entregar

O arquivo final vai como `14-hardening_orchestrator.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
