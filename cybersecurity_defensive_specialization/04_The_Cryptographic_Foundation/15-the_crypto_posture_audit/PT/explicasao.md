# O que você precisa fazer

Essa é a tarefa final do bloco, e ela não pede conhecimento novo — ela pede que você junte tudo que já construiu nas 15 tarefas anteriores num único documento coerente. É mais um trabalho de síntese e organização do que de pesquisa nova.

## Passo 1 — Comece literalmente reabrindo o documento da Tarefa 0

Antes de escrever qualquer achado, volte no seu próprio Mapa de Proteção de Dados da Tarefa 0 e liste, célula por célula, quais foram marcadas "Fraca" ou "Ausente" (ignore as marcadas "Adequada" ou "N/A" — essas não precisam de achado novo). Esse levantamento é o esqueleto inteiro da tarefa — sem ele, é fácil esquecer uma célula ou inventar uma que não estava lá.

## Passo 2 — Cada achado é um exercício de "conectar os pontos", não de análise nova

Repare que praticamente todo campo do formato de achado pede uma referência a algo que você já escreveu: a Referência de Vulnerabilidade vem do 1x02, a Referência de Risco vem do 1x03, a Avaliação do Algoritmo vem da T6, o Nível de Criptografia vem da T13, o Gerenciamento de Chaves vem da T14. Isso significa que, pra cada achado, seu trabalho real é ir buscar a peça certa em cada um desses documentos anteriores — não inventar uma resposta nova do zero.

## Passo 3 — Nem toda célula "Ausente" tem uma solução puramente criptográfica — e está tudo bem admitir isso

Algumas das células do T0 descrevem problemas de controle de acesso ou de política (por exemplo, uma tela de computador que não trava automaticamente), não a ausência de um algoritmo de criptografia. Force-se a resistir à tentação de inventar uma "solução criptográfica" forçada pra esses casos — é mais honesto (e mais correto tecnicamente) marcar esses campos como "Não aplicável" onde de fato não se aplicam, e recomendar o controle certo (que pode não ser cripto de jeito nenhum).

## Passo 4 — Na Referência de Risco, às vezes a conexão é temática, não literal — documente isso com honestidade

Nem todo achado vai ter um RISK-ID do registro de riscos que fala EXATAMENTE sobre aquele dado específico. Às vezes o link certo é "esse mesmo ativo aparece nesse risco" ou "esse é o mesmo tipo de consequência final que esse risco já quantifica, mesmo que o caminho técnico do ataque seja um pouco diferente". Quando a conexão for desse tipo mais indireto, diga isso explicitamente em vez de fingir que é uma correspondência exata.

## Passo 5 — A Pontuação de Postura pede uma conta específica, não uma opinião geral

Pense com cuidado no denominador certo: das 21 células originais do mapa, quantas são realmente "aplicáveis" (excluindo as marcadas N/A)? Dessas aplicáveis, quantas já eram adequadas desde a Tarefa 0, e quantas agora têm um caminho de remediação documentado nesta auditoria? A "pontuação" final deveria ser uma fração clara e verificável, não um número solto.

## Passo 6 — No Top 3, "maior impacto combinado" significa olhar pro ALE, não só pra quantidade de achados

Um achado sozinho às vezes não conta a história toda — por exemplo, os três estados (em repouso, em trânsito, em uso) de uma mesma categoria de dado podem ser agrupados como "um" item no seu ranking, porque juntos eles apontam pro mesmo risco financeiro quantificado. Use os valores de ALE reais do registro de riscos (1x03) como critério de desempate objetivo pra decidir a ordem do seu Top 3, em vez de uma impressão subjetiva de "isso parece mais grave".

## Onde entregar

O arquivo final vai como `15-crypto_posture_audit.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
