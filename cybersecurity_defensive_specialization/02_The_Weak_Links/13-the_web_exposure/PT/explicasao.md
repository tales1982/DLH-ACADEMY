# O que você precisa fazer

Esse exercício quer que você agrupe achados por host antes de analisar, ao invés de tratar cada achado isoladamente — porque o risco real muitas vezes só aparece quando você olha o conjunto.

## Passo 1 — Primeiro monte os grupos, só depois analise

Releia o relatório de scan e separe fisicamente (numa lista, numa tabela) quais achados pertencem a qual host. Você vai perceber que alguns hosts têm só 1 achado web e outros têm 3-4 — isso já é uma pista de onde o risco combinado importa mais.

## Passo 2 — "Exposição" não é igual pra todo mundo, e isso muda tudo

Antes de classificar um host como "exposto à internet," volte no Mapa de Superfície de Ataque do 1x01 (Task 7) e confira qual host está de fato na tabela de Superfície Externa. Um host pode parecer "público" só porque roda um servidor web, mas isso não significa que está na internet — releia com atenção qual host específico já foi confirmado como alvo de ataques externos reais no passado (1x00/1x01), porque isso é uma evidência mais forte do que só "roda Apache."

## Passo 3 — "Risco Combinado" não é a soma das severidades individuais

Pra um host com 3-4 achados de severidade Média cada, o risco combinado pode ser maior ou menor que a soma simples, dependendo se os achados se conectam (um habilita o outro) ou são só sintomas paralelos do mesmo problema. Pergunte-se: será que esses achados, juntos, descrevem um caminho de ataque coerente, ou são só uma lista de coisas pra corrigir sem relação entre si?

## Passo 4 — Cenário de Ataque: procure literalmente no arquivo de Kill Chains antes de inventar um cenário novo

Antes de criar seu próprio cenário do zero, abra `10-kill_chains.md` do 1x01 e veja se algum host do seu grupo já aparece citado num passo específico de alguma das 5 kill chains. Se aparecer, use essa referência direta — é uma evidência mais forte do que um cenário hipotético que você mesmo constrói.

## Passo 5 — Prioridade relativa: "exposto à internet" não significa automaticamente "primeiro da fila"

Essa é a virada de chave do exercício. Um host interno, na rede plana, pode merecer prioridade mais alta que um host exposto à internet, se o achado interno já tem exploração confirmada ativa e o achado externo só descreve fraquezas de hardening sem caminho direto de comprometimento. Não assuma que "internet-facing" = "mais urgente" sem checar o que cada achado realmente permite um atacante fazer.

## Passo 6 — A pergunta final é sobre disciplina de triagem, não sobre o Achado 031 especificamente

Você já investigou o Achado 031 em detalhes nas tarefas anteriores. Aqui a pergunta é mais ampla: o que esse episódio específico ensina sobre como tratar QUALQUER achado futuro que revele informação de versão, mesmo quando rotulado como "Médio"? Pense na resposta como uma regra geral de triagem, não como um resumo do que já aconteceu.

## Onde entregar

O arquivo final vai como `13-web_exposure.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. A análise completa por host, mais o parágrafo final sobre achados Médios reveladores de versão.
