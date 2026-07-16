# O que você precisa fazer

Diferente das tarefas anteriores (que eram sobre pessoas ou atores), essa é essencialmente uma auditoria sistemática de "onde estão as portas." Você vai puxar quase tudo direto do Resumo de Varredura de Rede e do Registro de Ativos do 1x00 — o trabalho aqui é organizar, não descobrir informação nova.

## Passo 1 — Não confunda superfície com vulnerabilidade

Releia a analogia da porta trancada no enunciado. Na sua tabela, "o que é" e "o que protege" são sobre a superfície; "qual gap está documentado" é onde a vulnerabilidade entra. Não pule direto pros gaps sem primeiro descrever o ponto de entrada em si.

## Passo 2 — Superfície Interna: a rede plana é o fio condutor

Toda entrada dessa seção deveria, de alguma forma, remeter ao fato de que não existe segmentação. Pergunte-se pra cada item: "se um atacante já está dentro da rede (por qualquer meio), o que essa falta de segmentação permite que ele alcance a partir daqui?" Isso conecta MySQL, PostgreSQL, NAS, FortiGate admin e os sistemas legados numa história coerente, não numa lista solta.

## Passo 3 — Superfície Humana: reutilize sua análise das Tarefas 3 e 4, não repita do zero

Você já mapeou insiders (Tarefa 3) e vetores de engenharia social por cenário (Tarefa 4). Aqui você está reorganizando essa informação por **cargo**, não por cenário — pra cada papel (clínico, recepção, TI, executivo, contratado), puxe o que já sabe sobre a vulnerabilidade dele.

## Passo 4 — O Resumo final exige uma escolha real

Não escreva "todas as três superfícies são importantes." Escolha uma. Pense em qual delas tem: (a) mais pontos de entrada documentados, (b) menos controles existentes cobrindo esses pontos, e (c) conexão mais direta com os ativos mais críticos da MedDefense. A superfície interna, dado o achado de rede plana, é frequentemente o argumento mais forte — mas defenda com evidência específica, não intuição.

## Onde entregar

O arquivo final vai como `7-attack_surface_map.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
