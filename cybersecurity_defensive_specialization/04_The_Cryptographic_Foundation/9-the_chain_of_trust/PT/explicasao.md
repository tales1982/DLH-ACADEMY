# O que você precisa fazer

Essa tarefa continua direto de onde a Tarefa 8 parou — você já sabe inspecionar um certificado sozinho, agora vai ver como vários certificados se encadeiam pra formar confiança.

## Passo 1 — Capture a cadeia inteira, não só o certificado principal

Repare que o comando dessa tarefa usa `-showcerts`, diferente do comando da Tarefa 8 — essa flag é o que faz o servidor te devolver TODOS os certificados que ele envia na negociação, não só o do site em si. Conte quantos blocos `BEGIN CERTIFICATE`/`END CERTIFICATE` aparecem na saída — esse número é a resposta pra "quantos certificados tem na cadeia".

## Passo 2 — Separe os certificados em arquivos e monte o "quebra-cabeça" dos emissores

Depois de separar cada certificado num arquivo próprio, extraia o Subject e o Issuer de cada um (dá pra fazer isso com `openssl x509 -noout -subject -issuer`). Organize eles na ordem que aparecem na cadeia e confirme visualmente: o Issuer do certificado 0 deveria ser idêntico ao Subject do certificado 1, e assim por diante. Se algum desses não bater exatamente (nem uma letra diferente), você separou os arquivos na ordem errada ou entendeu a cadeia errado.

## Passo 3 — Uma observação honesta que vale a pena checar: o último certificado da cadeia é MESMO autoassinado?

Existe uma pegadinha real (não do enunciado, do próprio mundo real de PKI): o último certificado que um servidor envia nem sempre é a raiz autoassinada de verdade — às vezes é só mais um certificado intermediário/cross-signed, e a raiz de fato fica só no seu trust store local, nunca é enviada pela rede. Antes de assumir que o último certificado da cadeia é "a raiz", confira: o Subject dele é igual ao Issuer dele? Se não for, você encontrou exatamente esse caso — documente honestamente, é um detalhe interessante, não um erro seu.

## Passo 4 — A verificação manual da Parte 2 é onde a tarefa realmente "clica"

Rode `openssl verify` com a cadeia completa primeiro (deveria dar `OK`). Depois, literalmente remova o certificado intermediário do conjunto de arquivos que você está passando pro comando, e rode de novo. Você vai ver um erro específico — não é genérico, tem um código de erro numérico e uma frase padrão do OpenSSL. Documente o erro exato, e pense: por que um certificado ADICIONAL mais acima na cadeia (se você ainda tiver ele disponível) não resolve o problema de faltar o elo direto? É essa lacuna específica que a pergunta final da Parte 2 quer que você explique.

## Passo 5 — Nas Partes 3 e 4, pesquise com atenção às diferenças sutis

CRL e OCSP resolvem o mesmo problema (checar se um certificado foi revogado) de jeitos bem diferentes — não confunda "consultar uma lista inteira" com "fazer uma pergunta específica". E o "OCSP Stapling" não é uma terceira coisa completamente nova — é uma otimização de ONDE a consulta OCSP acontece. Pesquise quem faz a consulta em cada caso (o cliente ou o servidor) — essa é a diferença central.

## Passo 6 — No cenário de chave comprometida da MedDefense, pense na ORDEM das ações

Não é só "peça um novo certificado." Existe uma sequência lógica: você não pode simplesmente gerar um novo certificado com a MESMA chave comprometida (isso não resolveria nada) — o que precisa ser gerado de novo primeiro? E revogar o certificado antigo é uma ação separada de emitir o novo — ambas precisam acontecer, mas pense em qual delas é mais urgente fazer primeiro.

## Passo 7 — Na Parte 4, o número de CAs confiáveis pode te surpreender, e o período de validade da raiz também

Depois de encontrar onde os certificados raiz ficam no seu sistema, conte quantos existem — é provável que seja uma centena ou mais, bem mais do que a maioria das pessoas imagina. E ao inspecionar uma raiz específica, repare no período de validade dela comparado aos certificados "de folha" que você inspecionou na Tarefa 8 (que duram uns 90 dias) — a diferença de ordem de grandeza tem uma razão específica que vale a pena entender, não é só "CAs são preguiçosas".

## Onde entregar

O arquivo final vai como `9-chain_of_trust.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
