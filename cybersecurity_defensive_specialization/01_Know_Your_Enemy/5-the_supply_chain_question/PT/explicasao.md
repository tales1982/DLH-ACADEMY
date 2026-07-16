# O que você precisa fazer

Para cada um dos 5 fornecedores, você está construindo um "caminho de ataque" mental: se esse fornecedor cair, como o atacante chega até a MedDefense a partir daí? Não é sobre avaliar a segurança do fornecedor em si — é sobre avaliar **o que a MedDefense perde se o fornecedor for a porta de entrada**.

## Passo 1 — Separe Tipo de Acesso de Escopo de Acesso

"Tipo de Acesso" é a categoria (rede, dado, físico, aplicação). "Escopo de Acesso" é a resposta em detalhe — o quê, exatamente. Um fornecedor pode ter mais de um tipo ao mesmo tempo (ex: a MedTech Solutions tem acesso de rede E de dado, porque acesso direto ao servidor de manutenção implica ambos).

## Passo 2 — O Cenário de Comprometimento precisa ser um caminho, não uma frase genérica

Não escreva "eles poderiam acessar dados sensíveis." Escreva o caminho passo a passo: fornecedor comprometido → qual credencial/acesso o atacante herda → qual sistema isso alcança → qual dado ou ativo fica exposto. Use os Registros de Ativos do 1x00 (Tarefa 7) pra nomear os ativos exatos, não genéricos.

## Passo 3 — Preste atenção especial ao Cenário Siemens

Esse é o mais sutil dos 5. O acesso é "só manutenção periódica" — parece pouco perigoso à primeira vista. Mas pense: em qual sistema operacional essa estação roda? O que isso implica sobre a superfície de ataque dela? (Dica: reveja o Registro de Ativos do 1x00 pra lembrar dos detalhes técnicos dessa estação.)

## Passo 4 — Não trate todos os 5 fornecedores como igualmente críticos

O objetivo final do exercício (o parágrafo de Resumo) só faz sentido se você realmente diferenciou os 5 pelo nível de dano potencial. Pergunte-se: qual fornecedor, se comprometido, atinge o ativo mais crítico da MedDefense (o EHR)? Qual tem o caminho mais direto (sem precisar de nenhum passo extra de escalada)?

## Passo 5 — O controle recomendado no resumo final deve ser genérico o bastante pra cobrir os 5

Pense em categorias de controle que reduzem risco de terceiros de forma geral: segmentação de rede, princípio do menor privilégio no acesso de fornecedor, contratos com SLA de segurança, monitoramento de acesso de terceiros, ou revisão periódica de acesso. Escolha o que resolveria o maior número de cenários ao mesmo tempo.

## Onde entregar

O arquivo final vai como `5-supply_chain_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
