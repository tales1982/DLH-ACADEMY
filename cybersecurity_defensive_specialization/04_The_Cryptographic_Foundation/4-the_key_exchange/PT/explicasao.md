# O que você precisa fazer

Essa tarefa tem uma sequência de comandos mais longa que as anteriores, mas cada passo é mecânico — o valor real está nas Partes 2 e 3, onde você precisa explicar o que aconteceu sem usar jargão.

## Passo 1 — Siga a sequência de comandos na ordem exata

Gere os parâmetros DH primeiro (isso é o "acordo público" que Alice e Bob vão usar como ponto de partida — repare que essa etapa demora mais que as outras, porque envolve testar se um número gigante é primo). Depois gere um par de chaves pra Alice e um par pra Bob, sempre a partir dos MESMOS parâmetros. Por fim, derive o segredo de cada lado usando a chave PÚBLICA do outro lado (não a própria). Se você usar a chave errada nesse último passo, o resultado final não vai bater — e essa é uma boa forma de testar se você entendeu o mecanismo.

## Passo 2 — Confirme a mágica com o `diff`

O ponto central da Parte 1 é que os dois arquivos de segredo, gerados separadamente por "Alice" e por "Bob" com peças diferentes de informação, deveriam ser idênticos byte a byte. Se o `diff` não sair vazio, algo foi trocado errado nos comandos anteriores — volte e confira qual chave pública foi usada em qual derivação.

## Passo 3 — Na Parte 2, não explique com matemática — explique com uma analogia

O enunciado já avisa: a explicação é pro CFO, não pra você. Tente pensar numa analogia física (misturar tintas é uma clássica, mas qualquer uma que mostre "combinar publicamente + um ingrediente secreto de cada lado = mesmo resultado final, sem nunca revelar o ingrediente secreto" funciona). A parte mais importante de responder é: por que a Eve, vendo tudo que passou pela rede, não consegue reconstruir o segredo final? A resposta tem a ver com uma operação matemática que é fácil de fazer num sentido e difícil de desfazer no outro — familiar de alguma forma? (Pista: você já viu essa ideia de "mão única" na tarefa de hashing.)

## Passo 4 — Na Parte 3, o ataque MITM não quebra a matemática — quebra uma suposição

O Diffie-Hellman garante que ninguém que só observa a conversa consegue derivar o segredo. Mas ele não garante NADA sobre quem realmente está do outro lado da conversa. Pense: se a Eve consegue se posicionar no meio do caminho e fingir ser o Bob pra Alice, e fingir ser a Alice pro Bob, o protocolo em si funciona perfeitamente duas vezes — só que com a pessoa errada dos dois lados. Isso é o que você precisa descrever.

## Passo 5 — Conecte com o cenário real da MedDefense

O enunciado te dá o cenário exato: o túnel de VPN entre Central e Westside. Você já sabe de um projeto anterior que uma das pontas desse túnel termina num equipamento de consumidor com histórico de firmware desconhecido — isso é relevante aqui porque é exatamente o tipo de ponto fraco que tornaria um ataque de posicionamento na rede mais plausível. E pra fechar: por que um certificado resolve o problema que o DH puro não resolve? Pense em "provar identidade" versus "estabelecer um segredo" — são dois problemas diferentes, e o DH só resolve um deles.

## Onde entregar

O arquivo final vai como `4-key_exchange.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
