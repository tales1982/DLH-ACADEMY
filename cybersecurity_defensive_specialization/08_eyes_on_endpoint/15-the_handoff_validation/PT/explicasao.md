# O que você precisa fazer

Este é o último script do projeto inteiro — o portão de qualidade que decide se o pacote montado na Tarefa 13 pode seguir para o Módulo 3. Repare que o enunciado (`subject.md`) descreve os campos obrigatórios como `sourcetype`/`eventcategory` (sem underscore), mas o script implementa `REQUIRED_FIELDS='["timestamp","hostname","source_type","event_category"]'` — os mesmos nomes com underscore usados nas Tarefas 3, 7 e 13. Isso não é um erro do script: é ele ficando consistente com o schema real que o resto do pipeline produz, em vez de seguir literalmente um nome de campo que nunca existiu nos dados de verdade.

## Passo 1 — Cada verificação passa pela mesma função `record`, o que é o que torna o relatório final tão uniforme

Em vez de cada seção do script imprimir `[PASS]`/`[FAIL]` e montar JSON à sua própria maneira, tudo passa por `record <check_name> <ok:0/1> <detail>`. Essa função incrementa `PASS_COUNT`/`FAIL_COUNT`, imprime a linha formatada, e acumula um objeto `{check, status, detail}` em `CHECKS_JSONL`. É por isso que o veredito final (`[ "$FAIL_COUNT" -eq 0 ]`, a própria última linha do script) e o `handoff_validation.json` sempre concordam entre si — os dois nascem da mesma contagem, não de lógicas separadas que poderiam divergir.

## Passo 2 — A contagem de timestamps futuros processa tudo em UM único jq, não em um loop bash — e isso é uma escolha deliberada de performance

O comentário no script é explícito: "Batched in a single jq pass rather than a bash loop spawning `date` per line - this list can run to tens of thousands of timestamps." O jq recebe todos os timestamps concatenados via heredoc (`<<<"$ALL_TIMESTAMPS"`), filtra os que batem no regex ISO-8601, converte cada um com `strptime | mktime`, e conta quantos são maiores que `$now`. Chamar `date` uma vez por timestamp para um handoff com milhares de eventos seria ordens de magnitude mais lento.

## Passo 3 — O script se protege explicitamente contra SIGPIPE em `sort | head -1` sob `set -e euo pipefail`

O trecho `RANGE_START=$(echo "$ALL_TIMESTAMPS" | sort | head -1) || true` tem um comentário longo explicando por quê: quando `head -1` já pegou sua linha e fecha o pipe, `sort` pode ainda estar tentando escrever o resto do output para esse pipe, recebe SIGPIPE e sai com código 141. Sob `pipefail`, isso conta como falha do pipeline inteiro mesmo que o dado que você queria já tenha passado. O `|| true` existe só para essa engenharia de borda — sem ele, o script abortaria de vez em quando de forma não-determinística dependendo do volume de dados.

## Passo 4 — "Completude do ground truth" compara contagem de ações ÚNICAS na matriz, não linhas da matriz

`MATRIX_ENTRIES` soma `jq '[.detection_matrix[]?.action] | unique | length'` para as matrizes Windows e Linux. O `unique` importa porque a Tarefa 12 (Linux) grava mais de uma linha por ação quando há detecção multi-fonte (ex.: "Create user" aparece tanto via `auditd` quanto via `auth.log`) — sem deduplicar, o script contaria a mesma ação duas vezes e poderia relatar mais entradas de matriz do que ações reais existem no ground truth, mascarando um `[MISSED]` real em outra ação.

## Onde entregar

O arquivo final vai como `15-handoff_validation.sh` (mais `handoff_validation.json` gerado), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
