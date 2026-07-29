# 8. A Anatomia do Certificado

**Objetivo:** Inspecionar certificados X.509 reais de sites ao vivo usando OpenSSL, identificar cada campo que importa pra segurança, e diagnosticar certificados intencionalmente quebrados.

## Contexto

Toda vez que um paciente abre o portal da MedDefense, o navegador dele faz uma verificação de certificado em milissegundos: Isso é realmente a MedDefense? O certificado ainda é válido? Foi emitido por uma autoridade confiável? Você precisa entender exatamente o que o navegador está checando, porque em 18 dias, o certificado da MedDefense expira e você é a pessoa que vai substituí-lo.

## Instruções

### Parte 1 - Inspecione Três Certificados Reais

Use `openssl s_client` pra baixar e inspecionar o certificado de 3 sites diferentes:

- Um site com certificado Let's Encrypt (exemplo: letsencrypt.org)
- Um site com certificado de CA comercial (exemplo: github.com)
- Um site com certificado quebrado do badssl.com (escolha um: expired.badssl.com, wrong.host.badssl.com, ou self-signed.badssl.com)

Pra cada certificado, use `openssl x509 -text` pra extrair e documentar:

- Subject (CN, O, L, ST, C)
- Issuer (quem assinou)
- Período de validade (Not Before, Not After)
- Número de série
- Algoritmo de assinatura
- Algoritmo e tamanho da chave pública
- Subject Alternative Names (extensão SAN)
- Key Usage e Extended Key Usage
- Authority Information Access (URL do OCSP, URL do CA Issuer)

### Parte 2 - O Certificado Quebrado

Pro seu certificado do badssl.com, explique precisamente o que está errado. Que erro um navegador exibiria? Que risco essa configuração incorreta cria? Você aconselharia um paciente a prosseguir pra um portal que exibe esse tipo de erro?

### Parte 3 - Perfil de Certificado da MedDefense

Com base no que você aprendeu, descreva o certificado ideal pro portal do paciente da MedDefense:

- Que tipo (DV, OV, EV) e por quê
- Que CA deveria emiti-lo e por quê
- Que entradas SAN ele deveria incluir
- Que algoritmo e tamanho de chave
- Que período de validade
- Se um certificado wildcard ou de domínio único é mais apropriado

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `8-certificate_anatomy.md`
