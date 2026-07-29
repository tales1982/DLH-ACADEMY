# 6. O Panorama de Algoritmos

**Objetivo:** Construir a tabela de referência definitiva de algoritmos criptográficos, mapeada contra o uso atual e recomendado da MedDefense, identificando cada algoritmo obsoleto ainda em produção.

## Contexto

O exame Security+ espera que você saiba quais algoritmos são atuais, quais são obsoletos e quais estão quebrados. Mais importante, ele espera que você saiba POR QUE certos algoritmos são inadequados pra certos usos. Essa tarefa constrói a referência que você vai carregar pro exame e pra sua carreira.

Todo algoritmo na tabela se conecta com algo que você já viu na MedDefense.

## Instruções

Produza uma Tabela de Referência de Algoritmos organizada por tipo:

- **Simétrico:** AES-128, AES-192, AES-256, DES, 3DES, ChaCha20-Poly1305, RC4, Blowfish
- **Assimétrico:** RSA-2048, RSA-4096, ECC P-256, ECC P-384, Diffie-Hellman, ECDHE
- **Hash:** MD5, SHA-1, SHA-256, SHA-512, SHA-3
- **Derivação de Chave:** PBKDF2, bcrypt, Argon2, scrypt

Para cada algoritmo:

| Campo | O que documentar |
|---|---|
| Tipo | Simétrico / Assimétrico / Hash / KDF |
| Tamanho de Chave/Saída | Em bits |
| Caso de Uso Principal | Pra que ele foi projetado |
| Status | Atual / Obsoleto / Quebrado |
| Por Que Obsoleto/Quebrado | Se aplicável, uma frase |
| Uso na MedDefense | Onde esse algoritmo é ou deveria ser usado na MedDefense |

Depois da tabela, produza uma **Análise de Lacunas Criptográficas da MedDefense**: compare o que a MedDefense usa atualmente (da T0 e dos achados do 1x02) contra o que ela deveria usar. Identifique pelo menos 4 casos onde a MedDefense usa um algoritmo obsoleto ou quebrado e recomende a substituição específica.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `6-algorithm_landscape.md`
