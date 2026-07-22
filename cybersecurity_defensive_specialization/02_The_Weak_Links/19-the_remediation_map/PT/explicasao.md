# O que você precisa fazer

Essa tarefa continua com os mesmos 8 achados das Tarefas 17 e 18, mas muda completamente a pergunta: não é mais "quão grave é isso", é "o que exatamente eu faço a respeito, e o que pode dar errado ao fazer isso".

## Passo 1 — Escolha o Tipo de Resposta com cuidado — nem todo achado quer um "Patch"

O instinto mais comum é escrever "Patch" pra tudo. Pare e pergunte: esse achado existe por causa de código desatualizado (aí sim é Patch), por causa de uma configuração que alguém escolheu mal (Mudança de Configuração), por causa de algo que tecnicamente não dá pra corrigir agora (Controle Compensatório), ou por causa de algo que a organização vai formalmente decidir aceitar por enquanto (Exceção)? Vários dos seus 8 achados provavelmente não são "Patch" — releia as Tarefas 6 e 12 pra lembrar quais achados são configuração incorreta e quais são sistemas legados sem correção possível.

## Passo 2 — Pré-requisitos e Plano de Rollback precisam ser específicos DESSE host, não genéricos

"Fazer backup antes" vale pra qualquer patch do mundo. Pense no que é específico desse host: ele já quebrou antes de forma inesperada? Ele hospeda uma aplicação clínica em uso contínuo? Existe uma equipe (vendor, clínica) que precisa ser avisada antes, porque a mudança afeta o trabalho dela diretamente?

## Passo 3 — Prazo (Imediato/7/30/90 dias) pode não bater exatamente com a Prioridade Final da Tarefa 17

Um achado "Crítico" na Tarefa 17 pode ainda assim precisar de um Prazo de 30 dias aqui, se a remediação de verdade (não uma mitigação temporária) exige um projeto de segmentação de rede ou uma migração de sistema operacional — coisas que não se fazem em 48 horas mesmo sendo urgentes. Pense na diferença entre "isso é urgente" e "isso é rápido de resolver" — nem sempre são a mesma coisa.

## Passo 4 — Responsável não é sempre "TI" — pense em quem realmente tem que aprovar ou executar

Alguns achados (dispositivos médicos, por exemplo) exigem que a Engenharia Clínica esteja envolvida, não só TI. Um achado de configuração de sistema operacional legado pode depender de um fornecedor terceirizado (uma aplicação de faturamento específica, por exemplo) antes que a TI possa agir sozinha. Pense com cuidado em quem realmente segura a decisão final.

## Passo 5 — Custo Estimado é sobre esforço real, não sobre "parece caro"

Uma mudança de configuração que leva 20 minutos de trabalho de um administrador não custa $10-50K, mesmo que o achado seja Crítico. Já um projeto de segmentação de rede física (VLANs novas, regras de firewall, testes) custa mais mesmo que o achado individual pareça simples de descrever. Separe a gravidade do achado do custo real de implementar a correção — são perguntas diferentes.

## Onde entregar

O arquivo final vai como `19-remediation_map.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. O plano de remediação completo para cada um dos 8 achados.
