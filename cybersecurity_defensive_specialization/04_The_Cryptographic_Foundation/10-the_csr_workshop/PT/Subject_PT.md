# 10. A Oficina de CSR

**Objetivo:** Gerar uma Certificate Signing Request (CSR) pro portal do paciente da MedDefense, tomando cada decisão de campo deliberadamente e documentando o raciocínio.

## Contexto

O certificado do portal do paciente expira em 18 dias. James Chen aprovou a renovação. Você está gerando a CSR que vai ser submetida à Autoridade Certificadora. Todo campo na CSR se torna um campo no certificado, e todo campo importa. Um Common Name errado bloqueia pacientes. Uma entrada SAN faltando quebra o acesso mobile. Um algoritmo de chave fraco compromete o propósito inteiro.

## Instruções

### Parte 1 - Decisão de Geração de Chave

Antes de gerar a CSR, decida: RSA-2048, RSA-4096 ou ECC P-256 pra chave privada?

Escreva uma justificativa de 3-4 frases pra sua escolha. Considere: nível de segurança, impacto de performance no servidor web lidando com 800 conexões de pacientes por dia, compatibilidade com navegadores/dispositivos mais antigos e as recomendações da sua Tabela de Referência de Algoritmos (T6).

Gere a chave com o algoritmo escolhido. Documente o comando.

### Parte 2 - Geração da CSR

Gere a CSR com os campos apropriados pro portal do paciente da MedDefense:

```
openssl req -new -key portal_key.pem -out portal.csr -config openssl.cnf
```

Você vai precisar criar um arquivo `openssl.cnf` (ou usar opções de linha de comando) pra incluir:

- Common Name: `portal.meddefense.local`
- Organization: MedDefense Health Systems
- Organizational Unit: Information Technology
- Locality, State, Country: apropriados pra MedDefense
- Subject Alternative Names: inclua tanto `portal.meddefense.local` quanto quaisquer outros hostnames que pacientes possam usar

Documente o processo completo de geração da CSR.

### Parte 3 - Inspeção da CSR

Inspecione sua CSR:

```
openssl req -text -noout -in portal.csr
```

Verifique que cada campo está correto. Documente a saída. Confirme que as entradas SAN estão presentes.

### Parte 4 - O Ciclo de Vida Completo

Escreva uma descrição passo a passo (não um script, mas um documento de procedimento) do ciclo de vida completo do certificado a partir deste ponto:

- CSR gerada (feito)
- Submissão à CA (qual CA? Let's Encrypt via ACME ou uma CA comercial?)
- Processo de validação (o que a CA verifica)
- Emissão do certificado
- Instalação no servidor web
- Verificação de que o novo certificado está servindo corretamente
- Descomissionamento do certificado antigo
- Monitoramento pra próxima renovação

Escreva um script `10-generate_csr.sh` que automatiza os passos 1-3 do processo de geração de chave e criação de CSR.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `10-generate_csr.sh`, `10-csr_workshop.md`
