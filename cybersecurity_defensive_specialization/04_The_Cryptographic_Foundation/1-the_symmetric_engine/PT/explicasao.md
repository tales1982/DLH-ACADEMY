# O que você precisa fazer

Essa é uma tarefa de "mão na massa" de verdade — você vai rodar os comandos, não só ler sobre eles. E tem uma pegadinha real esperando por você na Parte 1, não uma pegadinha de enunciado, uma pegadinha do próprio OpenSSL.

## Passo 1 — Comece pelo arquivo pequeno, com calma

Crie o arquivo de texto do jeito que o enunciado pede e rode as três criptografias, uma de cada vez. Depois de cada uma, olhe o tamanho do arquivo de saída e pergunte: por que esse número específico? (Dica: modo de bloco e padding têm uma relação direta com o tamanho final, e isso vai importar de novo lá na frente quando você comparar com RSA na próxima tarefa.)

## Passo 2 — Quando o GCM não funcionar do jeito que você espera, não desista — investigue

Se você tentar rodar `openssl enc -aes-256-gcm` do mesmo jeito que rodou o CBC, você vai levar um erro. Isso não é você fazendo algo errado — é uma limitação real e documentada do subcomando `enc` do OpenSSL. Antes de sair procurando outra ferramenta, confirme que é isso mesmo: tente variações do comando, confira se `aes-256-gcm` aparece como cifra disponível (`openssl list -cipher-algorithms`), e só então decida como contornar. Essa investigação é parte do aprendizado, não um desvio dele.

## Passo 3 — Uma vez contornado o problema do GCM, teste a diferença que realmente importa

O GCM é chamado de "criptografia autenticada" — isso não é só um nome bonito. Depois de conseguir criptografar com GCM (por qualquer ferramenta que funcione), tente uma coisa: modifique um único byte do arquivo criptografado e tente descriptografar. Depois faça o mesmo teste com o arquivo CBC. Os dois resultados vão ser bem diferentes, e essa diferença é o ponto central da Parte 1.

## Passo 4 — Na medição de performance, cuidado com comparações injustas

Se você precisou usar ferramentas diferentes pra CBC e pra GCM (por causa do Passo 2), o tempo de parede (`time`) medido pra cada um pode não estar comparando a mesma coisa — uma ferramenta pode ter overhead de inicialização que a outra não tem. Existe um jeito de medir a velocidade "pura" das cifras dentro do próprio OpenSSL, sem depender de qual ferramenta externa você usou pra cada uma. Vale a pena procurar por ele (dica: é um subcomando do próprio `openssl`, não do `enc`).

## Passo 5 — Se o resultado da performance parecer contraintuitivo, não corrija ele — explique ele

Tem uma expectativa comum de que "mais seguro = mais lento". Quando você comparar os números reais entre os três modos, pode ser que o resultado não bata com essa expectativa. Se isso acontecer, isso não é um erro de medição — é uma característica real de como os modos de operação funcionam internamente (um deles pode ser processado em paralelo, o outro não). Vale a pena entender o "porquê" por trás do número, não só reportar o número.

## Passo 6 — O script da Parte 3 precisa lidar com a mesma limitação do Passo 2

Se o seu script vai suportar tanto `cbc` quanto `gcm`, e o `openssl enc` sozinho não suporta GCM, o script precisa ter alguma solução pro modo GCM que não seja só "chamar o enc e torcer". Pense também em segurança básica de script: a senha de criptografia deveria aparecer como texto puro na lista de processos do sistema (visível pra qualquer usuário com `ps`), ou existe um jeito mais seguro de passar ela pro programa?

## Onde entregar

O arquivo final vai como `1-symmetric_encrypt.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`. Documente os comandos, tempos e comandos da Parte 1/2 num arquivo de análise separado, já que o enunciado pede pra "documentar o comando exato" de cada parte.
