# 9. A Cadeia de Confiança

**Objetivo:** Capturar e verificar uma cadeia completa de certificados, entender como a confiança se propaga da raiz até a folha, e analisar o que acontece quando a cadeia quebra.

## Contexto

Um certificado só é tão confiável quanto a cadeia por trás dele. O navegador do paciente confia no certificado do portal porque confia na CA intermediária que o assinou, que ele confia porque confia na CA raiz no seu repositório de confiança (trust store). Se qualquer elo dessa cadeia for inválido, expirado, revogado ou não confiável, a conexão inteira falha.

## Instruções

### Parte 1 - Capture a Cadeia Completa

Use `openssl s_client -showcerts` pra capturar a cadeia completa de certificados de um site com pelo menos 2 certificados na cadeia (a maioria dos sites comerciais se qualifica). Salve cada certificado em um arquivo separado. Documente:

- Quantos certificados tem na cadeia
- O papel de cada um (folha, intermediário, raiz)
- O Subject e o Issuer de cada um (mostre como o Issuer de um combina com o Subject do próximo)

### Parte 2 - Verificação Manual da Cadeia

Use `openssl verify` pra verificar manualmente a cadeia. Documente o comando e a saída. Depois remova o certificado intermediário e tente verificar de novo. Documente o erro. Explique em 2-3 frases o que isso demonstra sobre por que servidores precisam enviar a cadeia completa (não só o certificado folha).

### Parte 3 - Mecanismos de Revogação

Pesquise e explique:

- **CRL (Certificate Revocation List):** O que é, como um cliente a usa, e sua principal limitação (dica: tamanho e frequência de atualização).
- **OCSP (Online Certificate Status Protocol):** O que é, como ele melhora em relação às CRLs, e o que o OCSP Stapling adiciona.

Pra MedDefense: Se a chave privada do portal fosse comprometida amanhã (como na questão de múltipla escolha T25 do 1x03, onde uma chave foi exposta num repositório Git), descreva a sequência exata de ações necessárias pra revogar e substituir o certificado.

### Parte 4 - Exploração do Trust Store

Na sua máquina Linux, encontre onde os certificados raiz confiáveis do sistema são armazenados (tipicamente `/etc/ssl/certs/` ou similar). Quantas CAs raiz seu sistema confia? Escolha um certificado de CA raiz e inspecione com `openssl x509 -text`. Qual é o período de validade dele? Isso te surpreende?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `9-chain_of_trust.md`
