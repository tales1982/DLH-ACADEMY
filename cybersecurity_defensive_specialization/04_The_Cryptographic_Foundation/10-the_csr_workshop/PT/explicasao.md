# O que você precisa fazer

Essa é a última tarefa do bloco, e ela é a mais "operacional" de todas — no final das contas, é literalmente o trabalho que você faria antes do certificado real da MedDefense expirar em 18 dias.

## Passo 1 — A decisão da Parte 1 não é sobre qual algoritmo é "melhor" em teoria

Você já comparou RSA e ECC em detalhe na Tarefa 2, e já construiu uma tabela de recomendações inteira na Tarefa 6 — use as duas. Mas tem um dado novo aqui que muda o cálculo: "800 conexões de pacientes por dia" não é um número decorativo, é uma pista sobre qual das opções tem menor custo de CPU por handshake. Pense também: os dois certificados reais que você inspecionou na Tarefa 8 (Let's Encrypt e GitHub) usavam qual algoritmo? Isso não é coincidência.

## Passo 2 — Gere a chave primeiro, sozinha, antes de gerar a CSR

Não pule direto pro comando de CSR do enunciado. Gere a chave escolhida na Parte 1 primeiro, confirme que o arquivo foi criado, e só então prossiga. Isso te dá uma chance de conferir o tamanho do arquivo de chave gerado contra o que você já viu em tarefas anteriores (por exemplo, uma chave ECC P-256 tem um tamanho de arquivo bem característico, que você já documentou na Tarefa 2).

## Passo 3 — O arquivo de configuração é onde a maioria dos erros reais acontece

O comando `openssl req -new` sozinho, sem um arquivo de configuração bem feito, não inclui automaticamente os campos SAN — e um certificado sem SAN é rejeitado por praticamente todo navegador moderno hoje em dia, mesmo que o Common Name esteja certo. Monte o arquivo `.cnf` com cuidado especial na seção de `subjectAltName`, e não esqueça de referenciar essa seção nas extensões de requisição (`req_extensions`) — esse é o elo que várias pessoas esquecem e que faz o SAN sumir silenciosamente da CSR final.

## Passo 4 — Ao decidir os hostnames extras da SAN, pense como um paciente de verdade, não como um administrador

O enunciado pede "qualquer outro hostname que pacientes possam usar" — pense em hábitos reais: alguém digitando `www.` na frente por costume, ou um app móvel que possa usar um subdomínio próprio. Não precisa ser uma lista longa, só precisa ser realista.

## Passo 5 — Na Parte 3, confirme cada campo individualmente, não só "rode o comando e cole a saída"

Depois de inspecionar a CSR, vá campo por campo: o Common Name está exatamente certo? A Organização bate com o que foi pedido? O algoritmo de chave pública é o mesmo que você escolheu na Parte 1? E o mais importante: as entradas SAN aparecem, e são exatamente as que você configurou? Essa checagem deliberada é o que a tarefa está testando, não só "o comando funcionou sem erro".

## Passo 6 — Na Parte 4, o "ciclo de vida" tem uma ordem lógica que não pode ser embaralhada

Pense na sequência real: você não instala um certificado antes dele ser emitido, e não pode descomissionar o antigo antes de confirmar que o novo está funcionando de verdade em produção (não só "parece ter instalado"). Ao decidir entre Let's Encrypt/ACME e uma CA comercial, pense no problema que está te dando essa tarefa em primeiro lugar: um processo manual de renovação foi o que deixou o certificado chegar a 18 dias do vencimento. Qual das duas opções ataca essa causa raiz diretamente?

## Passo 7 — O script da Parte 4 deve automatizar exatamente os passos 1-3, nem mais nem menos

O enunciado é específico: só os passos de geração de chave, geração de CSR e inspeção. Não inclua submissão à CA ou instalação no script — isso não faz parte do que foi pedido, e tentar automatizar etapas que dependem de uma CA externa real seria inventar um comportamento que o script não pode genuinamente executar.

## Onde entregar

Os arquivos finais vão como `10-generate_csr.sh` e `10-csr_workshop.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
