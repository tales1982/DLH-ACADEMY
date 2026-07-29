# 11. A Auditoria de TLS

**Objetivo:** Avaliar configurações reais de TLS usando o SSL Labs, produzir um plano de remediação pro portal do paciente da MedDefense, e escrever uma configuração de TLS reforçada.

## Contexto

O Finding 005 da sua avaliação de vulnerabilidades (1x02) identificou que o portal do paciente ainda suporta TLS 1.0 junto com TLS 1.2. Esse achado está parado na lista de remediação há 3 semanas. Agora você tem o conhecimento pra corrigir isso. Mas antes de escrever a configuração, você precisa entender como é uma boa configuração de TLS e como é uma ruim, usando dados reais de sites reais.

## Instruções

### Parte 1 - Análise do SSL Labs

Vá até ssllabs.com/ssltest e teste 2 sites reais:

- Um site com classificação A ou A+ (exemplo: cloudflare.com)
- Um site com classificação mais baixa (B ou inferior), se você conseguir encontrar um

Pra cada um, documente:

- A nota geral
- Suporte a protocolos (quais versões de TLS)
- Força da troca de chaves
- Força do conjunto de cifras
- Detalhes do certificado
- Quaisquer avisos ou fraquezas sinalizadas

### Parte 2 - Avaliação do Portal da MedDefense

Você não pode testar o `portal.meddefense.local` no SSL Labs (ele é interno). Com base no Finding 005 do 1x02 (TLS 1.0 habilitado, TLS 1.2 suportado) e no Finding 013 (certificado perto de expirar), preveja qual nota o portal receberia se estivesse publicamente acessível. Liste cada problema que reduziria a nota.

### Parte 3 - A Configuração Reforçada

Escreva uma configuração de TLS recomendada pro portal do paciente da MedDefense (formato Apache ou Nginx, sua escolha). A configuração precisa especificar:

- Versões de protocolo suportadas (somente TLS 1.2 e TLS 1.3)
- Seleção de conjunto de cifras (ordenada por preferência, com justificativa pra cada escolha)
- Header HSTS (com max-age apropriado)
- Quaisquer outros parâmetros de reforço de TLS (session tickets, renegociação, etc.)

Pra cada escolha, escreva uma frase explicando o porquê.

### Parte 4 - O Ataque de Downgrade

Explique em 3-4 frases como um ataque de downgrade de TLS funciona. Se o portal da MedDefense suporta tanto TLS 1.0 quanto TLS 1.2, como um atacante forçaria um cliente a usar o protocolo mais fraco? Qual é o jeito mais simples de prevenir esse ataque?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `11-tls_audit.md`
