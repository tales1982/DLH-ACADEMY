# O que você precisa fazer

Essa é a tarefa de síntese final do bloco até agora: um único documento que junta tudo — os 5 riscos já quantificados na Tarefa 6, mais outros 5 que você precisa buscar no restante do seu próprio trabalho.

## Passo 1 — Os 5 primeiros riscos já estão prontos — não recalcule, reaproveite

Seus 5 riscos da Tarefa 6 já têm AV, EF, SLE, ARO e ALE completos. Aqui você só precisa traduzir esses dados pros novos campos do registro (Probabilidade/Impacto numa escala de 1-5, Dono do Risco, Decisão de Tratamento, KRI). Não refaça a matemática — reaproveite.

## Passo 2 — Os outros 5 riscos precisam vir de gaps que você ainda não quantificou — procure neles deliberadamente

Releia rapidamente a lista completa de gaps do 1x00/1x01 (o arquivo `15-gap_threat_correlation.md`) e os achados do 1x02 que não entraram nos seus 5 principais da Tarefa 6. Escolha 5 riscos adicionais que tragam variedade de categoria (Estratégico/Operacional/Conformidade/Financeiro) — pelo menos um dos seus 10 riscos totais deveria ser um risco Estratégico de verdade (não técnico), como uma lacuna de governança.

## Passo 3 — Nem todo risco vai ter um ALE calculável — seja honesto quando não tiver

Alguns riscos (uma vaga de CISO, um risco de fornecedor terceirizado sem dados suficientes) não se encaixam bem no modelo SLE/ARO/ALE. Não force um número inventado só para preencher o campo — escreva explicitamente "Não quantificado" ou "Não aplicável" com uma frase explicando por quê. Isso é mais profissional do que um número sem lastro.

## Passo 4 — Probabilidade e Impacto são duas perguntas DIFERENTES — não deixe uma vazar pra outra

Um risco pode ter probabilidade muito baixa mas impacto catastrófico (pense nos dispositivos médicos) — isso é diferente de um risco com probabilidade alta mas impacto contido (pense no servidor de faturamento). Resista à tentação de "compensar" uma nota baixa em uma escala aumentando a outra artificialmente.

## Passo 5 — Dono do Risco precisa ser uma pessoa ou cargo específico, coerente com a Tarefa 4

Volte na sua Matriz RACI da Tarefa 4 antes de atribuir donos de risco aqui. Se você já decidiu que o CEO é Accountable por decisões de aceitação de risco, por exemplo, isso deveria se refletir em quem é "dono" de riscos que exigem esse tipo de decisão.

## Passo 6 — KRI precisa ser algo mensurável, não uma reafirmação do próprio risco

Um bom KRI é um número que alguém consegue realmente acompanhar ao longo do tempo (contagem de tentativas de login falhadas, dias desde o último patch, número de contas ativas além do prazo de desligamento) — não uma frase vaga como "sinais de que o risco está aumentando."

## Onde entregar

O arquivo final vai como `10-risk_register.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. Os 10 riscos completos com todos os 17 campos, mais a Nota de Governança do Registro de Riscos.
