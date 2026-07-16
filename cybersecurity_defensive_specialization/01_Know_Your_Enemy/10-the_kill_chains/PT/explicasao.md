# O que você precisa fazer

Você já tem os "ingredientes" prontos da Tarefa 9 (células preenchidas da matriz). Agora você pega os 5 caminhos mais preocupantes e expande cada um numa história completa de 5 passos, do primeiro clique até o dano final.

## Passo 1 — Escolha os 5 caminhos pelos critérios certos

Não escolha os 5 primeiros que você preencheu na Tarefa 9. Escolha combinando: caminhos que terminam nos ativos mais críticos, caminhos que envolvem os atores de maior prioridade (Tarefa 6), e idealmente pelo menos um caminho de cada superfície (externa, interna, humana) pra ter cobertura variada.

## Passo 2 — Os 5 passos têm papéis fixos, não é livre

Passo 1 é sempre "como ele entra." Passo 2 é sempre "como ele garante que não vai perder esse acesso" (isso é diferente de já estar avançando — pense em persistência, não em movimento). Passo 3 é sempre sobre se mover de onde ele entrou até perto do alvo real. Passo 4 é a ação no próprio alvo. Passo 5 é a consequência pro negócio. Não pule etapas mesmo que pareça óbvio.

## Passo 3 — "Fraqueza da MedDefense" ≠ "Vetor" ≠ "Gap"

Esses três campos parecem repetir a mesma coisa, mas são camadas diferentes: o Vetor é a técnica (ex: phishing); a Fraqueza é a condição específica do ambiente que permite aquele passo funcionar (ex: ausência de MFA); o Gap é a referência formal do 1x00 que documenta essa fraqueza (ex: GAP-004). Preencha os três com esse nível de distinção.

## Passo 4 — Pontos de Ruptura é a parte que prova que você entendeu o exercício

Pra cada kill chain, pare depois de escrever os 5 passos e pergunte: "se eu fosse a MedDefense, em qual desses 5 pontos eu colocaria um controle pra travar isso, mesmo sem impedir o passo anterior?" O objetivo é mostrar que quebrar a cadeia em qualquer ponto impede o impacto final — isso é o argumento central de defesa em profundidade.

## Passo 5 — Impacto Esperado no topo e Impacto no Passo 5 devem bater

O campo "Impacto Esperado" logo no início é um resumo do que você vai detalhar no Passo 5. Escreva o resumo por último, depois de já ter decidido o impacto de negócio completo — evita contradição entre o topo e o final da kill chain.

## Onde entregar

O arquivo final vai como `10-kill_chains.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
