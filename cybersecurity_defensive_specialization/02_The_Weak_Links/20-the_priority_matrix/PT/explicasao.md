# O que você precisa fazer

Essa tarefa muda de escala: ao invés de 8 achados escolhidos a dedo, agora são TODOS os 24 achados Acionáveis (Crítico + Padrão) da sua triagem do Task 16, organizados por quando cada um precisa ser resolvido.

## Passo 1 — Use a triagem que você já fez, não reclassifique do zero

Volte no `16-triage.md` e pegue a lista de Actionable Critical + Actionable Standard (24 achados no total, se você seguiu a mesma estrutura). Esse é o seu conjunto de entrada completo — não é pra adicionar os Falsos Positivos nem os Informativos aqui.

## Passo 2 — Os 4 horizontes não são "traduções" da sua categoria AC/AS

Um achado "Acionável Crítico" da Task 16 pode legitimamente cair no horizonte de 30 dias aqui, se a remediação de verdade for um projeto (segmentação de rede, por exemplo) que não é fisicamente possível em 48 horas, mesmo sendo urgente. E um achado "Acionável Padrão" pode cair em "Imediato" se for uma mudança de configuração de 10 minutos com risco alto. Releia o critério de cada horizonte com atenção — ele fala de **combinação** de fatores (exploit + ativo + ameaça), não de gravidade isolada.

## Passo 3 — Cada linha da tabela precisa caber numa frase, então escolha as palavras com cuidado

"Descrição" e "ação de remediação" de uma linha cada força você a resumir o essencial. Se você não conseguir resumir um achado numa frase, provavelmente você ainda não decidiu qual é a ação específica — volte e decida antes de escrever a linha.

## Passo 4 — Antes de somar o orçamento, pesquise se o valor de $120.000 já está inteiro disponível

O enunciado menciona o orçamento anual de $120.000 do 1x00 — mas não assuma que esse valor está intocado. Volte no 1x00 (Task 14, decisões de tratamento de risco) e veja se alguma parte desse orçamento já foi comprometida com prioridades daquele projeto. Isso muda completamente a resposta de "quanto sobra" pra comparar com o custo total que você calculou aqui.

## Passo 5 — "O que precisa ser adiado, e por quê" é a pergunta mais importante do resumo

Não basta dizer "sobrou pouco dinheiro". Pense em qual seria a recomendação real que você daria: dá pra financiar os itens mais urgentes sem pedir orçamento novo? Vale a pena realocar dinheiro que já tinha outro destino, se os achados desta avaliação forem mais urgentes que aquele destino original? Em que ponto fica inevitável pedir orçamento suplementar, e como você justificaria esse pedido?

## Onde entregar

O arquivo final vai como `20-priority_matrix.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Os 4 horizontes com todos os 24 achados distribuídos, mais o Resumo de Orçamento completo.
