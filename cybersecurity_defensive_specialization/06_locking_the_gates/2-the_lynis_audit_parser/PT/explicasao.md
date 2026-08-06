# O que você precisa fazer

Essa tarefa é sobre parsing de texto: transformar o formato específico do arquivo `lynis-report.dat` (chave=valor, uma linha por entrada, chaves repetidas para listas) em JSON estruturado.

## Passo 1 — Entenda o formato do arquivo antes de escrever qualquer regex

O `lynis-report.dat` tem linhas como `warning[]=TEST-ID|Mensagem aqui|...` e `suggestion[]=TEST-ID|Mensagem aqui|...`, com campos separados por `|`. A mesma chave (`warning[]`, por exemplo) aparece várias vezes, uma por achado. Rode `grep '^warning\[\]' /var/log/lynis-report.dat` de verdade no seu sistema depois de rodar o Lynis, para ver o formato exato antes de programar o parser — não assuma o formato, confirme.

## Passo 2 — `severity` não vem pronto no arquivo, você deriva do nome da chave

Se a linha começa com `warning[]`, a severidade é "warning". Se começa com `suggestion[]`, é "suggestion". Se começa com `manual_check[]`, é "manual_check". O `test_id` e a `message` vêm dos campos separados por `|` dentro do valor.

## Passo 3 — `jq -R -s` ou `awk` são bons pontos de partida para montar o JSON

Você pode processar o arquivo linha por linha com `grep`/`awk`/`sed` para extrair os campos, e então montar cada objeto JSON com `jq -n --arg severity "$sev" --arg test_id "$id" --arg message "$msg" '{severity: $severity, test_id: $test_id, message: $message}'`, agregando tudo num array com `jq -s`. Isso evita bugs de escaping manual de aspas dentro das mensagens.

## Passo 4 — O índice de hardening está em uma linha separada, não dentro dos achados

Procure a linha `hardening_index=NN` no arquivo `.dat` — é um valor único, não uma lista, então trate ela separadamente das listas de `warning[]`/`suggestion[]`/`manual_check[]`.

## Onde entregar

Os arquivos finais vão como `2-lynis_parse.sh` e `lynis_findings.json`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
