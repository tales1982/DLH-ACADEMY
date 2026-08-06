# O que você precisa fazer

Essa é a tarefa que "junta os pontos" entre a Tarefa 1 (o que deveria ser verdade) e a Tarefa 2 (o que é verdade de fato no sistema). O script precisa cruzar essas duas fontes e decidir, controle por controle, qual é o status real.

## Passo 1 — A lógica de cruzamento é o núcleo da tarefa

Para cada um dos 15 controles do `cis_profile.json`, você precisa procurar no `lynis_findings.json` se existe algum achado (warning/suggestion) cujo `test_id` ou `message` esteja relacionado àquele controle. Isso geralmente significa montar, dentro do próprio script, uma tabela de associação entre `control_id` e os `test_id` do Lynis que costumam aparecer para aquele tipo de controle (por exemplo, controles de SSH costumam se relacionar a achados como `SSH-7408`).

## Passo 2 — Nem todo controle vai ter um achado do Lynis correspondente, e isso é esperado

O Lynis não testa tudo (por exemplo, ele pode não avaliar diretamente "retenção de logs" da forma que seu perfil CIS define). Para esses casos, o status correto é `not_assessed` — não force um "compliant" ou "non_compliant" sem evidência real. O output esperado já mostra exatamente 1 controle como "Not assessed", então seu cruzamento deveria naturalmente sobrar com pelo menos um controle sem evidência direta do Lynis.

## Passo 3 — A pontuação de prioridade (1-100) precisa ter uma fórmula, não um número chutado

Uma abordagem razoável: combine a severidade do controle CIS (critical/high/medium) com algum peso, e some/multiplique com a quantidade ou gravidade dos achados do Lynis relacionados. O importante é que a fórmula seja determinística e explicável no seu código, não um valor arbitrário jogado no JSON.

## Passo 4 — "Remediation actions queued: 12" não é igual a "non-compliant + partially compliant" à primeira vista

O output mostra 10 non-compliant + 2 partially compliant = 12, que bate exatamente com "Remediation actions queued: 12". Use isso como checagem de sanidade: todo controle non_compliant ou partially_compliant deveria gerar exatamente uma entrada na fila de remediação.

## Onde entregar

Os arquivos finais vão como `3-remediation_queue.sh`, `gap_analysis.json` e `remediation_queue.json`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
