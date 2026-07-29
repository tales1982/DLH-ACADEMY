# O que você precisa fazer

Essa tarefa é a mais "enciclopédica" do bloco — 23 algoritmos no total, organizados em 4 categorias. Não é difícil, mas exige organização e pesquisa cuidadosa em vez de chutes.

## Passo 1 — Não confunda "Obsoleto" com "Quebrado"

O enunciado pede três status possíveis, e a diferença entre eles importa: "Quebrado" significa que existe um ataque prático e viável hoje (DES e RC4 se encaixam aqui, MD5 também). "Obsoleto" significa que o algoritmo não é mais recomendado pra uso novo, mas não necessariamente tem um ataque trivial contra ele em todo cenário (3DES e SHA-1 se encaixam melhor aqui, cada um com sua própria razão específica — pesquise qual é o ataque real por trás de cada rótulo, não generalize).

## Passo 2 — Onde você já tem a resposta de tarefas anteriores, reuse — não repesquise do zero

Boa parte dessa tabela já foi coberta em detalhe nas tarefas anteriores deste mesmo bloco: os tamanhos de chave equivalentes de RSA/ECC (T2), os tempos de performance do AES (T1), os motivos de PBKDF2/bcrypt/Argon2 serem diferentes entre si (T3). Você não precisa refazer esses cálculos — só precisa consolidar o que já sabe numa linha da tabela.

## Passo 3 — "Diffie-Hellman" e "ECDHE" não são a mesma coisa, apesar de nomes parecidos

Preste atenção na diferença entre o DH "clássico" (campo finito, o que você simulou na Tarefa 4) e o ECDHE (Diffie-Hellman sobre curva elíptica, efêmero). Pesquise por que o "E" de "efêmero" no ECDHE importa especificamente pra uma propriedade de segurança chamada "forward secrecy" (sigilo de encaminhamento) — essa é uma diferença real de segurança, não só de nome.

## Passo 4 — Na Análise de Lacunas, use achados REAIS de projetos anteriores, não hipotéticos

O enunciado pede pelo menos 4 casos onde a MedDefense usa algo obsoleto/quebrado. Você já tem esses achados documentados em projetos anteriores (1x02, e a própria Tarefa 0 deste bloco) — não invente cenários novos, procure exatamente quais achados de vulnerabilidade e quais notas de auditoria já confirmaram algoritmos fracos em uso real na MedDefense hoje, e recomende a substituição específica (não "melhore a segurança", mas "troque X por Y, especificamente").

## Passo 5 — Uma recomendação de substituição precisa ser específica, não genérica

Não basta escrever "use algo mais forte." Se você está substituindo o DES no Kerberos, diga exatamente qual tipo de criptografia Kerberos deveria substituí-lo. Se está substituindo o TLS 1.0 do portal, diga exatamente qual versão mínima de TLS e quais conjuntos de cifras deveriam ficar habilitados. A especificidade é o que separa uma recomendação útil de uma frase de efeito.

## Onde entregar

O arquivo final vai como `6-algorithm_landscape.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
