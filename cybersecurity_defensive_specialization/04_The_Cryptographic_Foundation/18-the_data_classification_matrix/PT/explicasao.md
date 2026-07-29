# O que você precisa fazer

Essa tarefa é sobre construir a "régua" que decide quanta proteção cada dado merece — sem essa régua, toda decisão de criptografia anterior deste bloco fica sem um critério consistente de aplicação.

## Passo 1 — Na Parte 1, não tenha medo de colocar o mesmo dado em mais de uma categoria

O enunciado avisa isso explicitamente: "alguns dados podem pertencer a múltiplos tipos." Um prontuário de paciente, por exemplo, é claramente um dado Regulado (PHI) — mas também é PII (contém nome, data de nascimento). Não force uma categoria única artificial; liste as sobreposições reais que você encontrar.

## Passo 2 — Na Parte 2, cada nível precisa responder às TRÊS perguntas, não só definir um rótulo

"Quem pode acessar" não é a mesma pergunta que "que criptografia é exigida", que por sua vez não é a mesma coisa que "o que acontece se vazar". Um nível de classificação malfeito costuma responder só uma dessas três e deixar as outras vagas. Force-se a preencher as três de forma concreta pra cada um dos 4 níveis.

## Passo 3 — Os requisitos de criptografia deveriam ficar mais rigorosos conforme o nível sobe — e você já tem a base pra isso

Você já construiu, em tarefas anteriores deste mesmo bloco, uma tabela inteira de algoritmos aprovados (Tarefa 6) e recomendações de nível de criptografia (Tarefa 13). Use essas decisões já tomadas como base pros requisitos de cada nível de classificação, em vez de inventar novos algoritmos do zero.

## Passo 4 — Na árvore de decisão (Parte 3), pense na ORDEM das perguntas com cuidado

Uma árvore de decisão só funciona bem se as perguntas mais "decisivas" vierem primeiro. Por exemplo: se um dado é claramente prontuário de paciente, isso já deveria bastar pra classificá-lo como Restrito, sem precisar passar por mais perguntas — não force o usuário a responder perguntas irrelevantes depois de já ter uma resposta clara. Pense em qual pergunta, se respondida "sim", já encerra a decisão imediatamente.

## Passo 5 — A árvore de decisão precisa ter um caminho pra "eu não sei classificar isso"

Nem todo dado novo vai se encaixar perfeitamente numa das perguntas óbvias. Uma árvore de decisão robusta tem um caminho final pra "escale isso pra alguém com autoridade de decidir" em vez de forçar o funcionário a chutar. E pense: quando alguém está genuinamente em dúvida entre dois níveis, qual dos dois é a escolha mais segura por padrão?

## Passo 6 — Na Parte 4, separe "confidencialidade" de "jurisdição legal" — são preocupações diferentes

É tentador responder "encriptar os dados resolve o problema de soberania inteiro." Mas pense com mais cuidado: criptografia impede que alguém LEIA o dado sem a chave — isso resolve totalmente a questão de QUEM TEM AUTORIDADE LEGAL sobre esse dado, ou onde ele fisicamente reside? Pesquise rapidamente sobre por que isso importa especificamente pra saúde (pense em quais leis diferentes podem se aplicar dependendo de onde o dado está fisicamente armazenado).

## Onde entregar

O arquivo final vai como `18-data_classification.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
