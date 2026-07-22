# O que você precisa fazer

Essa tarefa pega os 5 riscos que você mesmo construiu na Tarefa 6 e testa 8 controles concretos contra eles — o enunciado já avisa que pelo menos um dos 8 não vai passar no teste.

## Passo 1 — Nem todo controle vai mapear limpo pra um dos seus 5 riscos da Tarefa 6 — e tudo bem

Alguns dos 8 controles (por exemplo, o firewall de Westside) provavelmente não têm um risco correspondente exato na sua lista de 5. Quando isso acontecer, não force uma conexão artificial — construa uma estimativa independente e honesta (mesmo que mais simples), e diga claramente que esse controle está fora do escopo dos 5 riscos principais.

## Passo 2 — Cuidado com "dupla contagem" quando dois controles endereçam o mesmo risco

Se você já usou um controle específico como a "correção proposta" de um risco na Tarefa 6, e agora esse mesmo controle aparece de novo aqui (talvez numa versão mais ampla ou mais estreita), pense em como isso afeta o cálculo — você não pode contar a mesma redução de ALE duas vezes como se fossem dois benefícios separados.

## Passo 3 — Pense se a versão "completa" de um controle é sempre a melhor versão

Um dos 8 controles pede um upgrade que cobre TODOS os endpoints. Antes de aceitar esse escopo cheio, pergunte-se: será que uma parte dos ativos já tem alguma proteção parcial, tornando essa parte do gasto menos urgente que a outra parte? Às vezes um escopo mais estreito, mirado exatamente no que falta, é uma compra mais inteligente que a versão "completa".

## Passo 4 — Ache o controle que NÃO se justifica — o enunciado avisa que existe um

Pelo menos um dos 8 controles vai ter um Valor Líquido negativo. Geralmente isso acontece quando um controle é uma versão "premium" de algo que outro controle da lista já resolve de forma mais barata — o custo incremental da versão premium não compensa o benefício incremental que ela adiciona. Procure esse padrão especificamente.

## Passo 5 — A Tabela Resumo final não é só ranquear — é decidir o que cabe no orçamento

Depois de ranquear os 8 por Valor Líquido, verifique a soma total do custo de todos eles (vai ultrapassar os $120.000 de propósito). Identifique quais combinações cabem no orçamento — isso não precisa ser a resposta final e definitiva (essa vem na Tarefa 8), mas já dá pra apontar uma seleção inicial óbvia.

## Onde entregar

O arquivo final vai como `7-cost_benefit_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. Os 8 controles avaliados, mais a Tabela Resumo de Custo-Benefício.
