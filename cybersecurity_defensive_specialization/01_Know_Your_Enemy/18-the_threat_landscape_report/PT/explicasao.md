# O que você precisa fazer

Essa é a tarefa capstone do projeto 1x01 — o equivalente ao "CISO Briefing" que você fez na Tarefa 17 do 1x00, mas em formato de relatório completo, não resumo de uma página. Você não está criando conteúdo novo aqui: está **compilando e sintetizando** tudo que já produziu nas Tarefas 0 a 17 num único documento coeso.

## Passo 1 — Trate isso como montagem, não como redação do zero

Antes de escrever a primeira palavra, monte uma lista do que cada seção puxa de qual tarefa anterior:
- Seção 3 (Panorama do Setor) ← Tarefa 0 (briefing de inteligência) + conhecimento geral do setor
- Seção 4 (Perfis de Ator) ← Tarefas 1, 2, 3 (taxonomia, ransomware, insider)
- Seção 5 (Superfície de Ataque) ← Tarefas 7, 8, 9
- Seção 6 (Caminhos Críticos) ← Tarefa 10 (kill chains)
- Seção 7 (STRIDE) ← Tarefas 11, 12
- Seção 8 (Cenários) ← Tarefa 14
- Seção 9 (Correlação) ← Tarefa 15
- Seção 10 (Recomendações) ← Tarefas 16, 17

Ter essa lista na sua frente evita que você "esqueça" de puxar alguma tarefa e evita inventar conteúdo novo que não foi analisado antes.

## Passo 2 — O Resumo Executivo é a parte mais difícil, escreva por último

Mesmo aparecendo primeiro no documento, escreva o Resumo Executivo só depois de ter as outras 9 seções prontas. Só assim você sabe de verdade qual é "a ameaça mais perigosa" e quais são as "Top 3 recomendações" — tentar adivinhar isso antes de terminar a análise geralmente produz um resumo desalinhado com o corpo do relatório.

## Passo 3 — "Autocontido" é o critério mais fácil de falhar

Releia cada seção perguntando: "se eu não tivesse lido as Tarefas 0-17, essa frase faria sentido?" Isso significa nomear os ativos, atores e gaps por extenso na primeira menção de cada seção (não assumir que o leitor sabe o que é "GAP-004" sem contexto), mesmo que isso implique repetir informação entre seções.

## Passo 4 — Cuidado com o tamanho

Esse é o relatório mais longo do projeto. Se você estiver enviando isso pra um sistema de correção automática, releia a disciplina de tamanho que você já aplicou em relatórios grandes do 1x00: frases diretas, tabelas compactas, evite parágrafos genéricos de transição. Prefira "porquê" direto em vez de introduções longas pra cada seção.

## Passo 5 — A conexão com o 1x02 é literal, não decorativa

A última linha da Seção 10 deveria realmente apontar pra frente: qual é a pergunta que a avaliação de vulnerabilidade (próximo projeto) vai responder que esse relatório não responde? (Dica: esse relatório fala de *quem* ataca e *como*; uma avaliação de vulnerabilidade fala de *onde exatamente* as portas estão destrancadas.)

## Onde entregar

O arquivo final vai como `18-threat_landscape_report.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`. Esse é o último exercício do projeto 1x01.
