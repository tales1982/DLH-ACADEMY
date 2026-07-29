# O que você precisa fazer

Essa é a última tarefa do bloco, e ela fecha o ciclo: você vai usar a mesma chave RSA que gerou lá na tarefa 2, e vai ver na prática por que "assinar" não é a mesma coisa que "criptografar".

## Passo 1 — Reaproveite as chaves, não gere novas

O enunciado é explícito: use o par de chaves RSA da T2 (`rsa_private.pem` / `rsa_public.pem`). Isso não é só economia de trabalho — é o ponto de continuidade do bloco inteiro: as mesmas chaves que criptografaram um dado na tarefa anterior agora vão assinar um dado nesta.

## Passo 2 — Assine, verifique, e olhe o tamanho do arquivo de assinatura

Depois de criar o `prescription.txt` e assinar com `openssl dgst -sha256 -sign`, repare no tamanho do arquivo `.sig` gerado. Ele te lembra alguma coisa da tarefa anterior? (Pista: tem a ver com o tamanho do módulo da chave RSA, o mesmo motivo por trás do tamanho fixo da criptografia RSA que você já documentou.)

## Passo 3 — O teste de adulteração é o coração da Parte 1

Depois de verificar que a assinatura original bate, mude UM único caractere no arquivo (o enunciado sugere algo pequeno, tipo um número da dosagem) e tente verificar de novo contra a mesma assinatura antiga. Isso deveria falhar, e a mensagem de erro que o OpenSSL retorna é real — documente ela exatamente como aparece, não parafraseie. Pense também: por que uma mudança de um único caractere é suficiente pra quebrar a verificação inteira? Você já tem a resposta matemática de uma tarefa anterior (efeito avalanche do hash).

## Passo 4 — O script da Parte 2 tem dois modos bem separados

`sign` precisa de um arquivo e uma chave privada, e produz um `.sig`. `verify` precisa de três coisas: o arquivo, o `.sig` e a chave PÚBLICA (não a privada — pense em por que faz sentido que a verificação use a chave pública). Teste os dois modos, teste o caso de falha proposital (arquivo adulterado contra assinatura antiga) e confirme que o código de saída reflete o resultado (sucesso vs. falha), não só a mensagem impressa na tela.

## Passo 5 — Feche a tarefa conectando com a exigência legal real

O contexto do enunciado menciona HIPAA e o ESIGN Act — não é decoração. Pense nas três propriedades que uma assinatura digital garante (integridade, autenticação, não-repúdio) e mapeie cada uma pra um motivo concreto de por que uma prescrição eletrônica sem assinatura seria um problema legal e prático, não só teórico. E pense: essa lacuna (dado que pode ser alterado sem ninguém perceber) é diferente ou parecida com as lacunas de criptografia que você documentou lá na Tarefa 0 (dados que podem ser lidos por quem não deveria)?

## Onde entregar

O arquivo final vai como `5-sign_verify.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
