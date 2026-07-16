# O que você precisa fazer

Diferente da Tarefa 7 (que mapeava pontos de entrada), aqui você aprofunda em 6 categorias técnicas específicas do Sec+ 2.2 e conecta cada uma a um cenário de exploração concreto e a um ator que a usaria.

## Passo 1 — "Evidência na MedDefense" precisa ser um dado, não uma categoria

Não escreva "há software desatualizado." Escreva o item exato: versão, sistema, porta. O enunciado já te dá boa parte disso entre parênteses em cada categoria — use como ponto de partida, mas confira contra o Registro de Ativos e a Varredura de Rede do 1x00 pra pegar qualquer detalhe adicional (versão exata, hostname).

## Passo 2 — "Ator Mais Provável de Explorar" te obriga a revisitar a Tarefa 6

Não escolha aleatoriamente. Pense: quem exploraria credenciais padrão do PACS? Provavelmente um atacante oportunista ou um insider, não necessariamente um Estado-Nação. Quem exploraria a rede plana pra movimento lateral depois de um acesso inicial? Isso é mais genérico — vários atores se beneficiam. Combine a sofisticação exigida pelo vetor com a capacidade do ator.

## Passo 3 — Cenário de Exploração: pense em "e depois?"

Não descreva só o vetor em si — descreva o que o atacante ganha ao explorá-lo. "Um atacante escaneia a rede, encontra a porta 5432 aberta, e..." (e o quê?). Termine a frase com o que ele alcança a partir dali (leitura direta do banco, extração de dados, etc.).

## Passo 4 — Proteção Atual pode legitimamente estar vazia ou fraca

Nem toda categoria vai ter um controle real do 1x00 cobrindo ela — é esperado que algumas digam algo como "nenhum controle documentado" ou "controle parcial e insuficiente." Não force uma resposta artificial só pra preencher o campo; isso é informação real sobre a postura da MedDefense.

## Passo 5 — Cuidado pra não misturar as 6 categorias

Repare que "Redes Inseguras" (rede plana) e "Portas de Serviço Abertas" (MySQL/PostgreSQL) estão relacionadas mas são categorias diferentes do Sec+. A rede plana é sobre a *ausência de segmentação em si*; as portas abertas são sobre *serviços específicos expostos*. Trate como conceitos distintos, mesmo compartilhando causa raiz.

## Onde entregar

O arquivo final vai como `8-technical_vectors.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
