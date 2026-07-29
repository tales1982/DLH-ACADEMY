# O que você precisa fazer

Essa tarefa é mais conceitual que as de laboratório — não tem comando de terminal pra rodar, mas tem uma armadilha clássica de confundir conceitos que parecem parecidos e não são.

## Passo 1 — Na Parte 1, a pergunta "quem consegue recuperar o original" é a chave de tudo

Pra cada uma das 5 técnicas, existe uma resposta diferente pra "isso pode ser desfeito, e por quem". Hashing tem uma resposta radicalmente diferente das outras quatro (você já sabe disso da Tarefa 3) — vale a pena começar por ele, já que é o mais fácil de errar por confusão com criptografia. Tokenização e mascaramento parecem parecidos à primeira vista ("os dois escondem parte do dado"), mas um deles guarda o dado real em outro lugar completamente separado, e o outro só oculta a exibição de um dado que ainda existe no mesmo registro — essa diferença é o que separa os dois casos de uso.

## Passo 2 — No design de tokenização (Parte 2), pense em "onde fica o dado real" antes de tudo

O ponto central do design não é "gerar um token aleatório" (isso é a parte fácil) — é decidir onde o mapeamento token-para-cartão-real vai morar, e como esse lugar é protegido. Pense num erro que você já viu documentado num projeto anterior deste mesmo bloco (Tarefa 0, sobre o NAS de backup): o que acontece se você criptografa um cofre de dados e guarda a chave de criptografia no mesmo lugar? Esse mesmo raciocínio se aplica aqui.

## Passo 3 — A pergunta "o que acontece se o cofre for comprometido" tem duas respostas diferentes dependendo do QUE foi comprometido

Comprometer o banco de faturamento (que só tem tokens) é bem diferente de comprometer o cofre de tokenização em si (que tem o mapeamento real). Trate essas duas situações separadamente na sua resposta — são níveis de gravidade completamente diferentes.

## Passo 4 — Tokenização vs. criptografia não é "qual é melhor" de forma absoluta

A pergunta pede vantagens E desvantagens dos dois lados. Pense especificamente em: o que acontece com o "raio de explosão" (blast radius) se um sistema que usa cada abordagem for comprometido? E pesquise rapidamente sobre "escopo de PCI-DSS" — é um conceito real de compliance que muda dependendo de qual abordagem você escolhe, e que faz uma diferença prática enorme pra um departamento de faturamento.

## Passo 5 — Na Parte 3, "nível de mascaramento apropriado" depende só de uma pergunta: essa pessoa PRECISA ver isso pro trabalho dela?

Pra cada célula da tabela, não pense em "o que seria mais seguro" de forma abstrata — pense literalmente no que aquele papel específico faz no dia a dia. Um enfermeiro cuidando de um paciente tem uma necessidade de saber completamente diferente da recepção que só está confirmando um agendamento. Alguns campos vão ter a mesma resposta pra dois papéis diferentes, e está tudo bem — não force uma variação artificial onde a necessidade de saber é genuinamente igual.

## Passo 6 — Na Parte 4, pense em POR QUE esse vetor específico é difícil de pegar

A maioria das ferramentas de DLP procura por padrões reconhecíveis (números de CPF, formatos de cartão) dentro de texto. Pense: uma imagem médica de dezenas de megabytes, cheia de dados binários de pixel, se parece "suspeita" pra esse tipo de ferramenta? E depois pense num tipo diferente de controle — não baseado em conteúdo, mas em comportamento/volume — que você já viu ser recomendado num projeto anterior (1x03) e que poderia pegar esse tipo de exfiltração de um jeito completamente diferente.

## Onde entregar

O arquivo final vai como `7-obfuscation_toolkit.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
