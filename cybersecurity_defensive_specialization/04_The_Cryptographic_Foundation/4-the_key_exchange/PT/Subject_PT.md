# 4. A Troca de Chaves

**Objetivo:** Simular uma troca de chaves Diffie-Hellman com OpenSSL pra entender como duas partes concordam num segredo compartilhado por um canal inseguro, e depois analisar a vulnerabilidade de man-in-the-middle que os certificados existem pra resolver.

## Contexto

O problema fundamental da criptografia simétrica é a distribuição de chaves: Alice e Bob precisam da mesma chave, mas não podem enviá-la pela rede porque a Eve está escutando. Em 1976, Whitfield Diffie e Martin Hellman resolveram esse problema com matemática. Você está prestes a reproduzir a solução deles com OpenSSL.

Mas a solução deles tem uma fraqueza. Se a Eve não está só escutando, mas ativamente interceptando e modificando o tráfego, o Diffie-Hellman sozinho não consegue detectá-la. É por isso que os certificados existem. A conexão entre troca de chaves e PKI é o fio condutor que atravessa o resto deste projeto.

## Instruções

### Parte 1 — A Simulação do DH

Simule uma troca de chaves Diffie-Hellman entre Alice e Bob usando OpenSSL. Documente cada comando e sua saída:

1. Gere os parâmetros DH compartilhados: `openssl dhparam -out dhparams.pem 2048`
2. Gere a chave privada da Alice a partir dos parâmetros
3. Extraia a chave pública da Alice
4. Repita pro Bob
5. Derive o segredo compartilhado do lado da Alice usando a chave pública do Bob
6. Derive o segredo compartilhado do lado do Bob usando a chave pública da Alice
7. Compare os dois segredos: `diff alice_secret.bin bob_secret.bin`

### Parte 2 — A Explicação

Em 5-6 frases, explique o que acabou de acontecer de um jeito que um não-criptógrafo (por exemplo, Robert Kim, o CFO) conseguiria entender. Alice e Bob nunca trocaram uma chave secreta, mas os dois chegaram na mesma. Como? O que a Eve (escutando na rede) teria visto, e por que ela não conseguiria derivar o mesmo segredo?

### Parte 3 — O Ataque MITM

Descreva em 4-5 frases como um ataque man-in-the-middle derrota o Diffie-Hellman puro. A Eve intercepta a chave pública da Alice, faz sua própria troca DH com a Alice e com o Bob separadamente, e agora tem dois segredos compartilhados diferentes. Conecte isso com a MedDefense: se o túnel de VPN entre Central e Westside usa DH sem autenticação baseada em certificado, o que um atacante no caminho da rede poderia fazer? Como os certificados previnem isso?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `4-key_exchange.md`
