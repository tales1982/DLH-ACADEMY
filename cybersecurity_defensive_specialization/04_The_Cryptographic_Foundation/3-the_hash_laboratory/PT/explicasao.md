# O que você precisa fazer

Essa é a tarefa com mais partes do bloco (5 no total), mas cada uma é curta. O segredo aqui é não rodar os comandos de qualquer jeito e copiar os números — o valor está em medir a diferença certa e explicar o "porquê" por trás dela.

## Passo 1 — No efeito avalanche, meça a coisa certa

Depois de gerar os quatro hashes, não conte só "quantos caracteres hexadecimais mudaram" — isso super-representa a mudança real, porque um único bit diferente dentro de um "nibble" hexadecimal (4 bits) já muda aquele caractere inteiro. Se você quiser ser mais preciso (e mais fiel ao que "efeito avalanche" realmente significa), converta os hashes pra binário e compare bit a bit. Você vai ver os dois números — e eles não são iguais.

## Passo 2 — Na Parte 2, calcule primeiro, explique depois

As potências de 2 são diretas (128 bits e 256 bits). A parte que exige pensar é: por que um ataque de aniversário não precisa de 2^128 tentativas pra achar uma colisão em MD5, e sim de algo em torno da raiz quadrada disso? Pense no paralelo com salas de aniversário — você não está procurando uma pessoa específica que faça aniversário num dia específico, está procurando QUALQUER par de pessoas que compartilhem um aniversário, e isso muda a matemática completamente.

## Passo 3 — Conecte a Parte 2 com o Finding 018 de verdade

O enunciado pergunta especificamente sobre RC4/Kerberos/MD5. Pesquise (ou lembre de projetos anteriores) o que é "Kerberoasting" e por que ele depende exatamente da fraqueza que você acabou de calcular matematicamente — a resposta não é "RC4 é ruim" de forma genérica, é sobre o que um atacante consegue fazer offline, sem tocar de novo no controlador de domínio, uma vez que ele tem um ticket criptografado com uma chave derivada de um hash quebrado.

## Passo 4 — Na Parte 3, tente mesmo ir até o crackstation.net — mas não se surpreenda se travar

Se você tentar automatizar essa consulta (por script, por exemplo), você provavelmente vai esbarrar num CAPTCHA que bloqueia submissões automáticas — isso é intencional por parte do site, não um bug. Isso, aliás, é em si um detalhe interessante de documentar: por que um serviço de "crackeamento de hash" se preocuparia em bloquear scripts especificamente? Se você fizer a consulta manualmente num navegador, deve conseguir o resultado sem problema pro hash sem sal — mas pense bem no motivo de ele "existir" em algum banco de dados de hashes pré-computados: não é mágica, é porque a senha original é extremamente comum. Já o hash com salt não vai aparecer em lugar nenhum — e a razão por trás disso é o próprio ponto da Parte 3.

## Passo 5 — A pergunta final da Parte 3 quer o "porquê" geral, não só sobre esses dois hashes específicos

Depois de ver a diferença prática entre os dois lookups, explique o princípio por trás: o que faz uma rainbow table funcionar economicamente (pré-computação reutilizável), e o que exatamente o salt quebra nessa economia. E não esqueça a segunda pergunta: por que um salt compartilhado entre todos os usuários resolveria menos do que parece.

## Passo 6 — Na Parte 4, pesquise de verdade — não adivinhe

bcrypt, PBKDF2 e Argon2 têm diferenças reais e específicas (um é resistente a GPU por usar muita memória, outro é baseado em HMAC repetido, outro é baseado numa cifra de bloco). Pesquise cada um antes de escrever. E a pergunta sobre o Active Directory tem uma resposta que pode surpreender: pesquise qual algoritmo de hash o AD usa por padrão pra armazenar senhas (não é nenhum dos três que você acabou de pesquisar) e se isso é adequado pros padrões de hoje.

## Passo 7 — O script da Parte 5 é o mais direto de todo o bloco

Ele só precisa: validar os dois argumentos, calcular o SHA-256 do arquivo, comparar strings, e sair com o código certo. Teste os quatro cenários possíveis: hash bate, hash não bate, arquivo não existe, argumentos errados — e confirme que cada um sai com o código de saída certo (0 ou 1), não só a mensagem certa.

## Onde entregar

Os arquivos finais vão como `3-hash_verify.sh` e `3-hash_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
