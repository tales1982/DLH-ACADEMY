# O que você precisa fazer

Essa tarefa é um "diff" no sentido literal: comparar dois conjuntos (achados de antes e achados de depois) e classificar cada achado em uma de três categorias.

## Passo 1 — A lógica do diff é baseada no `test_id`, não na mensagem inteira

Compare os `test_id` presentes no `lynis_findings.json` (antes) contra os presentes no `lynis_post_findings.json` (depois):
- Um `test_id` que estava ANTES mas não está DEPOIS = "resolved" (resolvido pelo hardening)
- Um `test_id` que está nos DOIS = "remaining" (ainda não resolvido)
- Um `test_id` que só aparece DEPOIS = "new" (o hardening pode ter introduzido ou revelado algo novo — por exemplo, uma configuração de auditd pode gerar um novo "suggestion" do Lynis sobre volume de log)

## Passo 2 — Você provavelmente precisa rodar o Lynis DE NOVO para gerar o "depois"

Se `lynis_post_findings.json` ainda não existe, o enunciado permite que seu script rode o Lynis (e reaproveite a lógica de parsing da Tarefa 2) para gerá-lo na hora. Isso significa que esse script pode, na prática, chamar `2-lynis_parse.sh` internamente depois de rodar uma nova auditoria.

## Passo 3 — `residual_risk_summary` é a única parte que exige julgamento, não só contagem

Esse campo deve resumir, em texto, o que os 22 achados remanescentes representam em termos de risco real — por exemplo, se a maioria são "suggestions" de baixo impacto (como atualizar o Lynis) versus algo mais sério ainda pendente. Não é só "22 achados restantes", é uma avaliação qualitativa do que esses achados significam.

## Passo 4 — `jq` de novo é sua ferramenta principal aqui, como na Tarefa 2

Use `jq` para extrair os arrays de `test_id` de cada arquivo, e `comm` ou operações de conjunto do próprio `jq` (`- ` e `contains`) para calcular as três listas (resolvidos, remanescentes, novos) sem precisar escrever laços manuais complicados em bash puro.

## Onde entregar

O arquivo final vai como `16-lynis_diff.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
