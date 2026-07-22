# O que você precisa fazer

Essa tarefa é a virada de chave do bloco: a Tarefa 5 foi treino com dados prontos; agora você monta os números de verdade, escolhendo VOCÊ MESMO quais são os 5 riscos que mais importam pra MedDefense.

## Passo 1 — Escolher os 5 riscos é a decisão mais importante da tarefa inteira

Antes de calcular qualquer coisa, pense em quais combinações de Gap+Vulnerabilidade+Ameaça contam a história mais completa e diversa. Não escolha 5 variações do mesmo tipo de risco (por exemplo, 5 cenários de ransomware) — prefira uma seleção que cubra tipos de ator diferentes (externo oportunista, ransomware organizado, insider), tipos de ativo diferentes (financeiro, clínico, dispositivo médico), e níveis de gravidade diferentes. Essa variedade vai facilitar muito as Tarefas 7 a 10, que reaproveitam esses mesmos 5 riscos.

## Passo 2 — "Fonte" exige que você junte três coisas de três projetos diferentes numa frase só

Não é suficiente citar um Gap ID sozinho. Pra cada risco, você precisa nomear explicitamente o Gap (1x00), o Achado de Vulnerabilidade específico (1x02) e o Ator de Ameaça com a Kill Chain ou Cenário correspondente (1x01) — essa é a "cadeia de rastreabilidade" que a Tarefa 3 já te ensinou a construir. Reaproveite esse hábito aqui.

## Passo 3 — Ao decidir o AV, pense se algum componente já está "escondido" dentro de outro

Alguns dos seus riscos vão envolver dados de fontes diferentes que podem se sobrepor parcialmente (por exemplo, um custo médio de mercado que já inclui algo que você também está contando separadamente). Antes de somar tudo, pergunte-se explicitamente: "esses componentes são realmente independentes, ou algum já embute o outro?"

## Passo 4 — O EF não precisa ser sempre 100% — pense na HISTÓRIA real da MedDefense

Pra pelo menos um dos seus riscos, considere se a MedDefense já teve uma versão MENOR desse mesmo tipo de incidente antes (releia o 1x00 Task 1 e Task 2). Se o pior cenário nunca aconteceu completamente na prática, mesmo com o ataque tendo ocorrido, isso é uma pista real pra calibrar o EF abaixo de 100%.

## Passo 5 — O "Controle Proposto" não precisa ser genérico — conecte com o que você já validou nas Tarefas 2 e 3

Pra cada risco, pense: qual CIS Control específico (já pontuado na Tarefa 2) resolveria isso, e qual seria o custo realista de implementá-lo na MedDefense especificamente (não um preço de mercado genérico)? Isso já vai te preparar diretamente pra Tarefa 7.

## Passo 6 — A tabela final de Priorização por ALE pode surpreender — e tudo bem se surpreender

O risco com o ALE mais alto nem sempre vai ser o que "parece" mais grave à primeira vista (patrimonial vs. segurança do paciente, por exemplo, têm dinâmicas de probabilidade × impacto bem diferentes). Se sua tabela final não bater com sua intuição inicial de "o que é mais importante", isso não é um erro — é exatamente o tipo de insight que a análise quantitativa existe pra revelar. Vale a pena comentar essa diferença explicitamente.

## Onde entregar

O arquivo final vai como `6-ale_workshop.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. Os 5 riscos completos com todos os campos, mais a tabela de Priorização de Risco por ALE.
