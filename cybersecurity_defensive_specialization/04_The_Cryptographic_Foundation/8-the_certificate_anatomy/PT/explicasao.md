# O que você precisa fazer

Essa tarefa te tira do lab isolado e te coloca inspecionando certificados de sites reais na internet — os comandos são curtos, mas você precisa realmente rodá-los, não presumir o que eles retornariam.

## Passo 1 — O comando de captura tem uma pegadinha de sintaxe comum

`openssl s_client -connect site:443` sozinho abre uma conexão interativa que não termina sozinha — você precisa alimentar alguma entrada (mesmo vazia, com `echo |`) e depois passar a saída pro `openssl x509 -noout -text` pra extrair só o certificado em formato legível. Se o comando "travar" sem retornar, é isso que está acontecendo.

## Passo 2 — Escolha os três sites com propósito, não aleatoriamente

O primeiro (Let's Encrypt) e o segundo (CA comercial) devem parecer bem parecidos na maioria dos campos — a diferença real que vale a pena notar é quem assina (Issuer) e se aparecem os mesmos campos de AIA (Authority Information Access). Já o terceiro (badssl.com) é imperfeito de propósito — antes de escolher qual dos três tipos de quebra usar (expirado, hostname errado, autoassinado), pense em qual desses três vai te dar a explicação mais interessante de escrever na Parte 2.

## Passo 3 — Na Parte 2, não descreva o problema — prove que você confirmou ele

Não basta dizer "o certificado expirou." Rode o comando de verificação (o `openssl s_client` já mostra isso no meio da negociação, procure por "Verify return code") e cite o código de retorno exato que o OpenSSL te dá. Esse número tem um significado específico documentado, e citar ele com precisão é mais forte do que só descrever o sintoma.

## Passo 4 — A pergunta final da Parte 2 quer sua opinião profissional, não uma resposta óbvia

"Você aconselharia um paciente a prosseguir?" parece uma pergunta retórica, mas vale a pena responder com justificativa real: o que exatamente está em jogo se alguém clica em "avançar mesmo assim" numa tela de aviso de certificado? Pense na conexão com o que você aprendeu na Tarefa 4 sobre man-in-the-middle — um aviso de certificado ignorado é exatamente o tipo de sinal que um ataque desse tipo dispararia.

## Passo 5 — Na Parte 3, use os DOIS certificados "bons" que você acabou de inspecionar como referência

Você não precisa inventar do zero o que é "ideal" pro portal da MedDefense — você literalmente acabou de inspecionar dois certificados reais e em produção agora mesmo. Que tipo de certificado eles usam? Que período de validade? Que algoritmo de chave? Isso não é coincidência — é o padrão atual da indústria, e sua recomendação pra MedDefense pode (e deveria) se apoiar diretamente nisso, com justificativa.

## Passo 6 — A decisão de wildcard vs. domínio único conecta com um raciocínio de segurança, não só de conveniência

Pense: um certificado wildcard cobre muitos subdomínios com UMA chave só. O que isso significa se essa chave for comprometida? Você já documentou, em tarefas anteriores deste mesmo projeto, vários sistemas internos da MedDefense com segurança fraca — isso deveria influenciar quão concentrado você quer deixar o "poder" de uma única chave.

## Onde entregar

O arquivo final vai como `8-certificate_anatomy.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
