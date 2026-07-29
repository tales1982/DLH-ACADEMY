# 5. Assinaturas Digitais na Prática

**Objetivo:** Assinar e verificar arquivos com OpenSSL, e depois conectar as propriedades criptográficas das assinaturas digitais com exigências reais do setor de saúde onde o não-repúdio é obrigatório por lei.

## Contexto

Uma assinatura digital fornece três propriedades simultaneamente: integridade (o conteúdo não foi modificado), autenticação (o assinante é quem diz ser) e não-repúdio (o assinante não pode negar ter assinado). No setor de saúde, essas propriedades não são opcionais. Prescrições eletrônicas, termos de consentimento de estudos clínicos e logs de auditoria precisam de assinaturas digitais pra serem legalmente válidos sob a HIPAA e o ESIGN Act.

## Instruções

### Parte 1 — Assinar e Verificar

Usando seu par de chaves RSA da T2:

1. Crie um arquivo `prescription.txt` com o conteúdo: `Patient: John Smith | MRN: MED-10042 | Rx: Metoprolol 50mg | Prescriber: Dr. Patel`
2. Assine o arquivo com SHA-256 e sua chave privada RSA. Documente o comando.
3. Verifique a assinatura com a chave pública. Documente o comando e a saída.
4. Modifique um caractere em `prescription.txt`. Verifique de novo. Documente a saída de falha.

### Parte 2 — O Script de Assinatura

Escreva um script `5-sign_verify.sh` que:

- Aceita um argumento de modo: `sign` ou `verify`
- No modo `sign`: recebe o caminho de um arquivo e o caminho de uma chave privada, produz um arquivo de assinatura `.sig`
- No modo `verify`: recebe o caminho de um arquivo, o caminho de um arquivo de assinatura e o caminho de uma chave pública, exibe o resultado da verificação

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `5-sign_verify.sh`
