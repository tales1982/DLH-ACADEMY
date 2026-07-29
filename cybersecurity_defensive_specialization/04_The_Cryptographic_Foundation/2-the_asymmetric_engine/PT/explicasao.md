# O que você precisa fazer

Essa tarefa tem uma "pegadinha experimental" de propósito na Parte 1 — o enunciado literalmente pede pra você tentar algo que vai dar errado. Não tenha medo disso, é o ponto principal da tarefa.

## Passo 1 — Faça o roundtrip pequeno primeiro, sem pressa

Gere as chaves RSA-2048, criptografe o prontuário pequeno (o mesmo texto da tarefa anterior), descriptografe, e confirme com `diff` que voltou idêntico. Repare no tamanho do arquivo criptografado — ele não muda mesmo se o texto original for menor ou maior (dentro de certo limite). Guarde esse número, ele vai ser importante no próximo passo.

## Passo 2 — Deixe o erro acontecer, e depois investigue o porquê

Quando você tentar criptografar o arquivo de 100MB com RSA, você vai receber um erro real do OpenSSL, não um erro genérico. Leia a mensagem com atenção — ela menciona diretamente qual é o problema ("dado grande demais pro tamanho da chave"). A explicação de 2-3 frases que o enunciado pede não é sobre "RSA é lento" — é sobre uma limitação matemática específica: qual é o tamanho máximo de dado que RSA-2048 com padding PKCS#1 v1.5 consegue processar de uma vez, e por que esse limite existe (dica: tem a ver com o tamanho do módulo da chave, o mesmo número que você anotou no Passo 1).

## Passo 3 — A comparação ECC não é só "menor é melhor"

Gere as chaves ECC, compare os tamanhos de arquivo com o `ls -la`, calcule a razão. Mas o ponto que o enunciado quer não é só "ECC é menor" — é "ECC é menor E oferece segurança equivalente ou até maior". Pra explicar o "porquê" disso, pense na diferença entre o problema matemático que sustenta a segurança do RSA (fatoração de números grandes) e o que sustenta a segurança do ECC (logaritmo discreto em curva elíptica) — um deles tem ataques cada vez mais eficientes que forçam as chaves a crescerem, o outro não.

## Passo 4 — Conecte a Parte 2 com equipamento real da MedDefense

O enunciado já dá a dica (bombas de infusão, monitores) — pense em por que um dispositivo médico embarcado, com CPU e bateria limitadas, se beneficiaria de uma chave menor pra fazer a mesma operação criptográfica. E tem uma conexão possível com um achado de projeto anterior sobre esses mesmos tipos de dispositivo (1x02) que vale a pena buscar.

## Passo 5 — O modelo híbrido da Parte 3 tem um exemplo concreto bem na sua frente

Você acabou de ver, na prática, por que a criptografia assimétrica sozinha não serve pra dados grandes (Parte 1) e por que ela é útil pra estabelecer um segredo entre duas partes (o conceito geral de RSA/ECC). Junte essas duas peças: qual parte de uma conexão HTTPS faz sentido ser assimétrica (a decisão de "quem eu confio, qual chave vamos usar juntos") e qual parte faz sentido ser simétrica (o volume real de dados, como os que você mediu na tarefa anterior)? O portal do paciente da MedDefense já tem um achado documentado (1x02) sobre a camada de handshake que vale a pena referenciar aqui.

## Passo 6 — Na tabela da Parte 4, "Aprovado" não é a mesma coisa que "em uso hoje"

Ao classificar cada algoritmo como aprovado ou não pra um ambiente de saúde regulado, lembre que alguns desses algoritmos (DES, RC4) já apareceram em achados anteriores deste mesmo projeto como estando ativamente habilitados na MedDefense hoje — isso não muda o status de aprovação deles (continuam não aprovados), mas muda a urgência da recomendação. Vale marcar essa diferença explicitamente na coluna de uso.

## Onde entregar

O arquivo final vai como `2-asymmetric_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
