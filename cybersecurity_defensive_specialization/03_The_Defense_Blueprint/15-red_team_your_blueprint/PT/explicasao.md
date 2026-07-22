# O que você precisa fazer

Essa é a última tarefa do bloco até agora, e ela pede algo que nenhuma tarefa anterior pediu: vire contra o próprio trabalho. Ninguém aprende mais sobre as fraquezas de um plano do que a pessoa que tenta ativamente quebrá-lo.

## Passo 1 — Antes de "atacar," releia sua própria Tarefa 8 com uma pergunta específica: o que ficou de fora?

A resposta mais interessante pra "qual kill chain ainda é viável" quase nunca é sobre um controle que falhou tecnicamente — é sobre um risco que nunca chegou a competir pelo orçamento em primeiro lugar. Volte na Tarefa 7 e confira: os 8 controles que você avaliou lá cobrem TODOS os 10 riscos do seu Registro (Tarefa 10), ou alguns riscos tiveram seu próprio controle específico (calculado lá atrás na Tarefa 6) que nunca foi formalmente colocado na disputa de orçamento da Tarefa 8? Essa pergunta sozinha pode revelar o achado mais forte dessa tarefa inteira.

## Passo 2 — Ao construir o caminho de ataque alternativo, procure um controle que resolve o PROBLEMA ERRADO

Alguns controles corrigem exatamente o mecanismo que você imaginou quando os projetou, mas deixam passar uma variação do mesmo problema. Pense na regra de segmentação que você escreveu na Tarefa 14 pro banco de dados do EHR — ela foi desenhada pra impedir acesso de QUALQUER lugar da rede. Mas existe algum caminho legítimo, que você mesmo permitiu na sua própria arquitetura, que já tem acesso ao banco por definição? Um atacante que já está NAQUELE caminho permitido não precisa "contornar" a regra — ele já está dentro dela.

## Passo 3 — Pra "cenário de ameaça interna," não invente um cenário novo — reaproveite um que você já quantificou

Você já tem um risco de insider completo (com ALE calculado) desde a Tarefa 6. Pense se esse risco específico tem, de fato, um controle técnico funcionando contra ele agora — ou se ele meio que "escapou" do processo de orçamento por nunca ter competido com os outros 8 controles avaliados.

## Passo 4 — A classificação de Risco Residual não pode ser nem "Baixo" nem "Crítico" sem uma justificativa muito forte

Se você achou pelo menos um caminho de ataque real e funcional no red team, "Baixo" não é defensável. Mas se os caminhos mais prováveis e mais historicamente comprovados (aqueles com histórico real de já terem acontecido) foram genuinamente fechados, "Crítico" também não é honesto. Pense em Médio como o ponto de partida mais realista, e ajuste só se sua análise mostrar razão forte pra outra direção.

## Passo 5 — A recomendação pro próximo ano não precisa esperar o próximo ano, se o achado for barato o suficiente

Se o "maior gap remanescente" que você encontrar for algo que já foi quantificado e custa pouco (releia os números da Tarefa 6/8), pergunte-se: por que isso esperaria até o próximo ciclo de orçamento? Às vezes a recomendação mais honesta de um red team não é "peça mais dinheiro ano que vem" — é "isso deveria ter sido corrigido ontem, com o dinheiro que já sobrou."

## Onde entregar

O arquivo final vai como `15-red_team_blueprint.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. As duas partes completas: A Perspectiva do Atacante e A Avaliação Honesta.
