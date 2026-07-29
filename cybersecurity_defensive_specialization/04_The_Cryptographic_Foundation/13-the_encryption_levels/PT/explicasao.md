# O que você precisa fazer

Essa tarefa é toda sobre uma ideia central: "criptografar" não é uma decisão binária, é uma escolha de ONDE na pilha (stack) você aplica a proteção — e cada camada tem um preço diferente.

## Passo 1 — Antes de preencher a tabela, ordene os 6 níveis mentalmente do mais "amplo" pro mais "granular"

Disco completo protege tudo, mas de forma grosseira (qualquer coisa com acesso ao sistema operacional já ligado vê tudo em claro). Registro protege quase nada de escopo, mas com precisão cirúrgica. Os quatro do meio (partição, volume, arquivo, banco de dados) ficam numa escala entre esses dois extremos. Ter esse espectro em mente ajuda a preencher a coluna de "Impacto de Performance" com coerência — geralmente, quanto mais granular o nível, maior o custo por operação.

## Passo 2 — A coluna de "Gerenciamento de Chaves" não é sobre "onde guardar a chave" — é sobre QUANTAS chaves e QUÃO COMPLEXO é rastreá-las

Disco completo tipicamente usa UMA chave pro disco inteiro. Nível de registro pode exigir uma chave diferente por campo, por usuário, ou por política de acesso. Pense em como esse número de chaves cresce entre os níveis, e o que isso significa em termos de operação real (quem rotaciona o quê, e com que frequência).

## Passo 3 — "Caso de uso" pede UMA frase — force-se a ser específico, não genérico

Não escreva "bom pra quando você precisa de segurança." Pensa no cenário EXATO em que aquele nível específico vence os outros cinco. Por exemplo: por que nível de banco de dados é melhor que nível de registro quando uma aplicação inteira precisa rodar consultas SQL normais sem restrição? Essa pergunta tem uma resposta concreta, não uma resposta vaga.

## Passo 4 — No Mapa da MedDefense, a resposta nem sempre é o nível "mais forte" possível

É tentador pensar que "nível de registro" é sempre a resposta mais segura e, portanto, a melhor — mas pense no que aconteceria com o PACS (imagens DICOM) se você tentasse aplicar criptografia de registro num sistema que nem armazena dados como registros de banco de dados relacional. A pergunta não é "qual nível é mais forte", é "qual nível se encaixa na forma como esse sistema específico realmente funciona".

## Passo 5 — Reaproveite decisões que você já tomou em tarefas anteriores deste mesmo bloco

Você já decidiu, em tarefas anteriores, que dados de cartão de crédito deveriam ser tokenizados em vez de criptografados (Tarefa 7), que o NAS-01 precisa de criptografia de volume via LUKS (Tarefa 12), e que dispositivos médicos embarcados têm restrições de hardware que favorecem ECC (Tarefa 2). Use essas decisões já justificadas como base pro seu mapa, em vez de reconsiderar tudo do zero.

## Passo 6 — Pra e-mail e laptops, pense no "formato" real do dado antes de escolher o nível

E-mail não é um banco de dados nem um disco só seu — é uma mensagem individual que viaja entre sistemas. Um laptop de funcionário não roda consultas de banco de dados o dia inteiro — ele é, na prática, um dispositivo físico que pode ser roubado. Deixe o formato real do dado guiar sua escolha de nível, não uma preferência abstrata por "mais criptografia é sempre melhor".

## Onde entregar

O arquivo final vai como `13-encryption_levels.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
