# 2. O Motor Assimétrico

**Objetivo:** Gerar pares de chaves RSA e ECC, descobrir a limitação de tamanho da criptografia assimétrica por meio de experimentação, e entender por que o modelo híbrido existe.

## Contexto

Se a criptografia simétrica é o cavalo de batalha, a criptografia assimétrica é o aperto de mão. Ela resolve o problema de distribuição de chaves que a criptografia simétrica sozinha não consegue resolver: como duas partes que nunca se encontraram concordam num segredo compartilhado? A resposta envolve pares de chaves, onde uma chave criptografa e a outra descriptografa. Mas essa elegância vem com um custo que você está prestes a medir.

## Instruções

### Parte 1 — Geração de Chaves RSA e Criptografia

Gere um par de chaves RSA-2048:

```
openssl genrsa -out rsa_private.pem 2048
openssl rsa -in rsa_private.pem -pubout -out rsa_public.pem
```

Criptografe um arquivo pequeno (o mesmo prontuário de paciente da T1) com a chave pública. Descriptografe com a chave privada. Documente os comandos.

Agora tente criptografar o arquivo de teste de 100MB da T1 com RSA. O que acontece? Documente a mensagem de erro. Explique em 2-3 frases por que o RSA não consegue criptografar arquivos grandes diretamente e o que essa limitação significa pro uso no mundo real.

### Parte 2 — Geração de Chaves ECC

Gere um par de chaves ECC usando a curva P-256:

```
openssl ecparam -genkey -name prime256v1 -out ecc_private.pem
openssl ec -in ecc_private.pem -pubout -out ecc_public.pem
```

Compare os tamanhos de arquivo de `rsa_private.pem` e `ecc_private.pem`. Qual é a proporção? Explique em 2-3 frases por que o ECC alcança segurança equivalente com chaves muito menores e por que isso importa pra ambientes com restrição de recursos (pense: as bombas de infusão BD Alaris e os monitores Philips da MedDefense, com poder de processamento limitado).

### Parte 3 — O Modelo Híbrido

Na prática, o TLS e a maioria das comunicações criptografadas usam uma abordagem híbrida: criptografia assimétrica pra trocar uma chave simétrica, depois criptografia simétrica pros dados reais. Descreva esse modelo híbrido em 4-5 frases. Por que essa combinação é superior a usar qualquer uma das duas abordagens sozinha? Conecte isso ao portal do paciente da MedDefense: quando um paciente se conecta via HTTPS, qual parte do protocolo cuida da troca de chaves e qual parte cuida da criptografia dos dados em massa?

### Parte 4 — A Tabela de Tamanhos de Chave

Produza uma tabela comparativa cobrindo os algoritmos que o Sec+ 1.4 espera:

| Algoritmo | Tipo | Tamanhos de Chave | Segurança Equivalente | Status | Uso na MedDefense |
|---|---|---|---|---|---|

Cubra: AES (128/192/256), RSA (2048/4096), ECC (P-256/P-384), DES, 3DES, ChaCha20-Poly1305, RC4. Pra cada um, declare se ele é aprovado pra uso num ambiente de saúde que lida com dados regulados.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `2-asymmetric_analysis.md`
