# 1. O Motor Simétrico

**Objetivo:** Dominar a criptografia simétrica através de operações práticas com OpenSSL, comparando modos, medindo performance e construindo um script de automação.

## Contexto

A criptografia simétrica é o cavalo de batalha da criptografia moderna. Todo arquivo criptografado em repouso, todo campo de banco de dados protegido, todo túnel de VPN carregando dados entre os sites da MedDefense usa criptografia simétrica no seu núcleo. O AES é o padrão. Mas "usar AES" não é uma resposta completa. AES-128 ou AES-256? Modo CBC ou GCM? Quais são as implicações de performance?

Você vai descobrir isso na prática.

## Instruções

### Parte 1 — Criptografia e Descriptografia AES

Crie um arquivo de teste contendo o texto: `Patient: Jane Doe | DOB: 1985-03-14 | MRN: MED-50421 | Diagnosis: Atrial Fibrillation`

Criptografe esse arquivo usando OpenSSL com três configurações diferentes e documente o comando exato de cada uma:

- AES-256-CBC (o modo tradicional)
- AES-256-GCM (o modo de criptografia autenticada)
- AES-128-CBC (chave de tamanho reduzido)

### Parte 2 — A Medição de Performance

Crie um arquivo de teste de 100MB: `dd if=/dev/urandom of=testfile bs=1M count=100`

Criptografe-o com cada uma das três configurações acima e meça o tempo gasto em cada uma.

### Parte 3 — O Script

Escreva um script `1-symmetric_encrypt.sh` que recebe três argumentos: um arquivo de entrada, um arquivo de saída e um modo (`cbc` ou `gcm`). O script deve criptografar o arquivo de entrada com AES-256 no modo especificado e produzir o resultado.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `1-symmetric_encrypt.sh`
