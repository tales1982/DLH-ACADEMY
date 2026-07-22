# O que você precisa fazer

Essa tarefa é a mais "arqueológica" do bloco até agora: você vai precisar abrir de verdade os arquivos de três projetos diferentes e montar uma cadeia de causa-efeito completa pra cada gap escolhido.

## Passo 1 — Não escolha os 8 gaps só pela nota "Crítico" — escolha pelos que têm evidência de vulnerabilidade REAL

O enunciado pede pra usar "a lista re-priorizada do 1x01 T15" — releia esse arquivo (`15-gap_threat_correlation.md`) com atenção, ele já tem uma lista de gaps Críticos maior que 8. Seu trabalho aqui é filtrar: prefira os gaps que você consegue conectar a um Achado NUMERADO específico do relatório de scan do 1x02, não só a um conceito geral. Um gap sem um Achado de Vulnerabilidade concreto quebra a cadeia de rastreabilidade que essa tarefa inteira existe pra provar.

## Passo 2 — "Contexto de Ameaça" não é escrever de novo o que já está no 1x01 — é resumir com precisão

Volte no arquivo `15-gap_threat_correlation.md` (1x01) pra cada gap escolhido — ele já te diz exatamente quais atores de ameaça e quais kill chains se aplicam a cada gap, numa análise já pronta. Não invente uma correlação nova; extraia a que já foi construída e documentada.

## Passo 3 — Mapear pro NIST CSF e pro CIS Control exige que você pense "que categoria de comportamento é essa", não só "que palavra-chave bate"

Um gap sobre rede exposta pode se encaixar tanto em Protect quanto em Identify, dependendo de qual ângulo você está enfatizando. Não existe resposta única errada aqui, mas você precisa justificar a escolha — pense em qual categoria descreve melhor o resultado que estaria faltando se esse gap nunca fosse corrigido.

## Passo 4 — A Ação Recomendada precisa ser algo que a MedDefense poderia literalmente começar a fazer amanhã

Evite recomendações vagas tipo "melhorar a segurança de rede." Seja tão específico quanto os exemplos que você já viu nas Tarefas 19 e 20 do bloco anterior (1x02) — uma ação de uma frase que um técnico conseguiria pegar e executar sem perguntar "mas o que exatamente eu faço?"

## Passo 5 — A Tabela de Resumo de Rastreabilidade é o produto final que prova que a cadeia funciona

Depois de escrever os 8 blocos detalhados, a tabela final deveria permitir que qualquer pessoa — inclusive alguém que nunca leu os projetos anteriores — veja a cadeia completa numa linha só, da esquerda pra direita: gap, evidência, ameaça, framework, ação. Se uma linha da tabela não faz sentido sozinha, sem contexto adicional, ela precisa ser reescrita.

## Onde entregar

O arquivo final vai como `3-gap_framework_bridge.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. Os 8 gaps completos com os 6 campos cada, mais a Tabela de Resumo de Rastreabilidade.
