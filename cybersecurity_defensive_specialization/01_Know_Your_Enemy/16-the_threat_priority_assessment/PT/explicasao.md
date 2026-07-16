# O que você precisa fazer

Essa é a síntese final de tudo que veio antes. Você não está criando ameaças novas — está escolhendo, entre tudo que já analisou (atores, vetores, cenários, gaps), quais 5 combinações merecem o topo do ranking.

## Passo 1 — "Threat" aqui não é um ator sozinho, é uma combinação

Uma linha do Top 5 não é "ransomware gangs" nem "Sarah Park sendo phishada" isoladamente — é a combinação ator + vetor + alvo que forma um risco concreto e nomeável. Pense em cada linha como um resumo de um caminho de ataque completo que você já mapeou em tarefas anteriores (kill chains do T10, cenários do T14).

## Passo 2 — Probabilidade e Impacto são avaliados separadamente, depois combinados

Não pule direto pra "Prioridade Geral." Primeiro decida Probabilidade (isso realmente vai acontecer? há dados do setor saúde que sustentam isso? há algo específico da MedDefense — como o histórico do ataque de ransomware de janeiro — que aumenta a chance?). Depois decida Impacto (usando a criticidade dos ativos que você já definiu no 1x00). Só depois combine os dois numa Prioridade Geral coerente — uma ameaça de Probabilidade Alta + Impacto Crítico não é automaticamente igual a uma de Probabilidade Crítica + Impacto Médio; pense em qual pesa mais no contexto da MedDefense.

## Passo 3 — Gap Chave exige um único gap, não uma lista

Isso força você a priorizar dentro da priorização. Entre todos os gaps do 1x00 relacionados a essa ameaça específica, qual é o único cujo fechamento reduziria mais o risco? Se você está em dúvida entre dois, pense em qual está mais cedo na kill chain — fechar um gap no início do caminho de ataque geralmente vale mais do que fechar um no meio.

## Passo 4 — Ação Recomendada precisa ter um verbo de ação e um esforço real

"Melhorar a segurança de e-mail" não serve. "Implementar autenticação multifator obrigatória pra todos os acessos remotos ao EHR — Curto Prazo" serve. A classificação de esforço (Vitória Rápida / Curto Prazo / Longo Prazo) deve refletir realisticamente o que aparece no seu Registro de Ativos e Matriz de Controles do 1x00 — uma mudança de política é Vitória Rápida, uma migração de infraestrutura é Longo Prazo.

## Passo 5 — A Recomendação Estratégica é sobre escolher, não listar tudo

O ponto do "só 2 iniciativas" é forçar corte. Não tente cobrir as 5 ameaças com 2 iniciativas genéricas — escolha as 2 que, juntas, atacam o maior número de Gaps Chave e Ameaças Críticas ao mesmo tempo (dica: revise "Os Críticos Três" da Tarefa 15).

## Onde entregar

O arquivo final vai como `16-threat_priority_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
