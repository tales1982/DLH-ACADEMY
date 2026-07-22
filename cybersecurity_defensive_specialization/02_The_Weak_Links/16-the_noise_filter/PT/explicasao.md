# O que você precisa fazer

Esse é o exercício de fechamento de todo o trabalho de triagem do bloco: os 31 achados, um por um, cada um recebendo uma categoria de ação final. É deliberadamente o exercício mais mecânico do bloco — mas o valor está em fazer isso com disciplina, achado por achado, sem pular nenhum.

## Passo 1 — Você já fez boa parte dessa classificação nas tarefas anteriores. Use esse trabalho, não refaça do zero

Antes de classificar cada achado como se fosse a primeira vez que você olha pra ele, releia rapidamente suas próprias conclusões das Tarefas 6, 10, 11 e 13: você já decidiu quais achados são falsos positivos (Tarefa 11), já reavaliou a severidade de vários achados de configuração incorreta (Tarefa 6), e já ranqueou os 5 mais críticos (Tarefa 10). Esse exercício é a hora de juntar tudo isso numa única lista coerente, não de reconsiderar cada decisão do zero.

## Passo 2 — As 4 categorias não são um espelho direto das severidades do relatório (Crítico/Alto/Médio/Baixo)

Um achado rotulado "Alto" pelo scanner pode muito bem ser "Acionável Crítico" na sua classificação (se ele é o Achado 031, por exemplo — CVSS 9.8, ativo mais crítico do ambiente, mas rotulado só como "High" no relatório). E um achado rotulado "Crítico" pode, dependendo do seu julgamento sobre o ativo afetado, ser rebaixado. Use seu próprio julgamento acumulado, não copie a coluna de severidade do scanner direto pra coluna de categoria.

## Passo 3 — Achados "Informativo" no relatório não viram automaticamente "Informational" na sua triagem

Preste atenção especial aos achados que o scanner rotulou como "Informational" (027 a 030). Pelo menos um deles esconde uma vulnerabilidade real e explorável só porque está anexado a um dispositivo não documentado (shadow IT) — o rótulo "Informational" ali reflete a incerteza sobre o que é o dispositivo, não a gravidade da vulnerabilidade que roda nele. Não deixe o rótulo do scanner decidir por você nesses casos.

## Passo 4 — "Motivo" precisa caber numa frase, mas precisa ser específico o suficiente pra justificar a categoria sozinho

Imagine que alguém vai ler só essa lista, sem o resto do seu trabalho anterior — a frase de motivo precisa ser específica o bastante pra que a categoria escolhida faça sentido por si só (não "é grave" ou "é real", mas o porquê específico).

## Passo 5 — A ordenação de prioridade dentro de AC e AS é o teste final do seu julgamento acumulado

Não ordene simplesmente por CVSS decrescente — você já viu ao longo do bloco (Tarefas 10, 13) que isso nem sempre reflete a prioridade real. Use os mesmos critérios que already usou antes: qual ativo é afetado, existe exploit confirmado, o achado está numa kill chain documentada, etc.

## Onde entregar

O arquivo final vai como `16-triage.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. A triagem completa dos 31 achados, o Resumo da Triagem (contagem por categoria), e a Lista de Achados Acionáveis ordenada.
