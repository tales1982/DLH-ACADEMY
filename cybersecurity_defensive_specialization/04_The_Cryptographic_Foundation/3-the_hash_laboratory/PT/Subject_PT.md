# 3. O Laboratório de Hash

**Objetivo:** Explorar hashing através de experimentação: observar o efeito avalanche, quebrar hashes fracos, entender salting e key stretching, e construir uma ferramenta de verificação de integridade.

## Contexto

Hashing não é criptografia. Criptografia é reversível (com a chave). Hashing é de mão única. Essa distinção importa muito porque a MedDefense armazena hashes de senha no Active Directory, e a diferença entre uma senha bem "hasheada" e uma mal "hasheada" é a diferença entre "o atacante tem os hashes mas não consegue usá-los" e "o atacante tem a senha de todo mundo em 30 minutos."

## Instruções

### Parte 1 — O Efeito Avalanche

Faça o hash da string "MedDefense" com SHA-256:

```
echo -n "MedDefense" | sha256sum
```

Agora faça o hash de "MedDefense1" (um caractere adicionado). Compare os dois hashes. Quantos caracteres da saída em hexadecimal são diferentes? Isso é o efeito avalanche: uma mudança de um único bit na entrada deveria mudar aproximadamente 50% da saída. Repita com MD5. Documente os quatro hashes.

### Parte 2 — Colisões de Hash e o Problema do Aniversário

O MD5 produz um hash de 128 bits. O SHA-256 produz um hash de 256 bits. Calcule: quantas saídas únicas possíveis cada um produz? (Expresse como uma potência de 2.)

Explique em 3-4 frases por que um hash mais curto é mais suscetível a ataques de colisão e o que um ataque de aniversário explora. Faça referência ao Finding 018 do 1x02 (criptografia fraca do Kerberos): se o AD da MedDefense usa RC4 pros tickets Kerberos, que depende de MD5 internamente, qual é a implicação prática pra segurança de senhas?

### Parte 3 — Demonstração de Rainbow Table

Faça o hash da senha "password123" com MD5:

```
echo -n "password123" | md5sum
```

Vá até o crackstation.net e procure o hash resultante. Documente o que você encontrar.

Agora faça o hash de "password123" com um salt:

```
echo -n "s4lt9xQ2:password123" | md5sum
```

Procure esse hash "salgado" no crackstation.net. Documente o resultado. Explique em 3-4 frases por que o salting derrota rainbow tables e por que cada usuário precisa de um salt único.

### Parte 4 — Key Stretching

Pesquise sobre bcrypt, PBKDF2 e Argon2. Pra cada um, explique em 2-3 frases: o que ele faz de diferente de um hash simples, por que ele é mais resistente a força bruta e o que o parâmetro de "fator de custo" ou "contagem de iterações" controla.

Qual você recomendaria pro armazenamento de senha de aplicação da MedDefense, e por quê? Qual é usado pelo Active Directory por padrão (pesquise isso) e ele é adequado?

### Parte 5 — O Script de Verificação de Integridade

Escreva um script `3-hash_verify.sh` que:

- Recebe dois argumentos: o caminho de um arquivo e um hash SHA-256 esperado
- Calcula o hash SHA-256 do arquivo
- Compara com o hash esperado
- Exibe "INTEGRITY OK" se combinarem, "INTEGRITY FAILED - expected [hash] got [hash]" se não combinarem
- Retorna código de saída 0 em caso de sucesso, 1 em caso de falha

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `3-hash_verify.sh`, `3-hash_analysis.md`
