# 16. A Superfície de Ataque Criptográfico

**Objetivo:** Mapear os ataques criptográficos contra as fraquezas específicas da MedDefense, mostrando quais ataques são viáveis hoje e quais controles neutralizariam eles.

## Contexto

Ataques de downgrade, ataques de colisão, ataques de aniversário e mais. Esses não são conceitos abstratos. Cada um deles mapeia pra uma fraqueza real na MedDefense.

## Instruções

Pra cada um dos tipos de ataque a seguir, produza:

```
Ataque: [Nome]
Mecanismo: [Como funciona, 2-3 frases]
Vulnerabilidade da MedDefense: [Qual sistema/configuração específica é suscetível?]
Evidência: [Referência a um achado do 1x02 ou análise da T0/T6]
Viável Hoje: [Sim/Não, com justificativa]
Mitigação: [Qual controle específico ou mudança de configuração neutraliza esse ataque?]
```

Ataques a cobrir:

- Downgrade de TLS (forçar TLS 1.0 no portal do paciente)
- Ataque de Colisão (explorando MD5 em tickets Kerberos)
- Ataque de Aniversário (teórico, explique a matemática e a relevância)
- Kerberoasting (explorando RC4/DES no Kerberos pra cracking offline)
- On-path/MITM em canais não criptografados (tráfego DICOM, conexões de banco de dados não criptografadas)
- Recuperação de Chave da Memória (se um atacante tem root no billing-srv-01, ele consegue extrair chaves AES da RAM?)

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `16-crypto_attack_surface.md`
