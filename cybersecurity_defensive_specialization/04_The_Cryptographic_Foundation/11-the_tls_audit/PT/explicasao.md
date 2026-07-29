# O que você precisa fazer

Essa tarefa te faz usar uma ferramenta pública de verdade (SSL Labs) e depois aplicar o que você aprender num cenário que você não pode testar diretamente (o portal interno da MedDefense).

## Passo 1 — Escolha os sites da Parte 1 com uma pitada de ceticismo

O enunciado sugere `cloudflare.com` como exemplo de nota A/A+ — mas antes de assumir isso, teste de verdade. Sites grandes às vezes têm configurações mais complicadas do que se espera (por exemplo, suportar protocolos antigos por compatibilidade com clientes legados pode derrubar a nota mesmo num site bem administrado). Documente o resultado real que você encontrar, mesmo que não seja o que o enunciado sugeriu como exemplo — isso é mais valioso do que forçar um resultado "limpo".

## Passo 2 — Pro segundo site, você pode escolher um alvo que você SABE que vai ser ruim

Diferente do primeiro site (onde você está observando uma configuração real do mundo em produção), aqui você pode escolher deliberadamente algo pra ilustrar um problema específico — por exemplo, um subdomínio do badssl.com dedicado a demonstrar exatamente um tipo de fraqueza (protocolo antigo, cifra quebrada). Isso não é "trapacear", é ilustrar o conceito com um exemplo didaticamente claro.

## Passo 3 — Ao comparar os dois resultados, procure o padrão real, não só a nota final

A pergunta mais interessante não é "qual nota cada um tirou" — é "o que especificamente fez cada nota cair". Você pode descobrir que o certificado em si estava perfeitamente correto nos dois casos, e o problema real estava inteiramente na escolha de protocolos/cifras. Esse padrão (certificado bom + configuração de protocolo ruim = nota ruim mesmo assim) é exatamente o que você vai usar pra prever a nota do portal da MedDefense na Parte 2.

## Passo 4 — Na Parte 2, você não tem acesso ao site — então argumente com o que você JÁ SABE

Você não pode testar o portal da MedDefense no SSL Labs porque ele é interno, mas você já tem dois achados documentados e específicos (Finding 005 e Finding 013) de um projeto anterior. Use esses achados como evidência concreta, e conecte cada um a um critério real de pontuação do SSL Labs que você acabou de observar na Parte 1 (por exemplo: suportar TLS 1.0 junto com TLS 1.2 é literalmente o mesmo padrão que você viu derrubar a nota de um site real).

## Passo 5 — Pense no que aconteceria se o certificado estivesse VENCIDO no momento do teste, não só "perto de vencer"

O Finding 013 fala em dias até o vencimento — pense bem no que aconteceria com a nota (ou com a própria possibilidade de conexão) se o teste fosse feito depois do vencimento, não antes. Você já viu exatamente esse comportamento acontecer com um certificado real numa tarefa anterior (Tarefa 8) — use essa observação real como parte da sua previsão.

## Passo 6 — Na Parte 3, cada linha de configuração precisa de uma frase de justificativa, não uma lista de comandos sem explicação

O enunciado pede explicitamente "uma frase explicando o porquê" pra cada escolha. Não escreva só a diretiva de configuração — escreva por que aquele valor especificamente (por exemplo: por que 1 ano de HSTS e não 1 semana? por que desabilitar session tickets?). Use o que você já sabe de tarefas anteriores (T6 pros algoritmos aprovados, T9 pro OCSP Stapling) como base pra cada justificativa.

## Passo 7 — Na Parte 4, pense na sequência exata do ataque, não só no conceito geral

"Downgrade" não é um conceito abstrato — pense mecanicamente em COMO um atacante posicionado na rede consegue fazer um cliente, que prefere naturalmente a versão mais nova/forte de TLS, terminar usando a versão mais fraca. E a pergunta final ("qual é o jeito mais simples de prevenir isso") tem uma resposta que você já escreveu, sem perceber, na Parte 3 — pense em qual linha da sua configuração já resolve esse problema estruturalmente.

## Onde entregar

O arquivo final vai como `11-tls_audit.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
