# 19. O Checkpoint Criptográfico da HIPAA

**Objetivo:** Mapear os requisitos de criptografia da HIPAA contra o estado atual da MedDefense e identificar cada lacuna de conformidade.

## Contexto

A MedDefense é uma "covered entity" (entidade coberta) sob a HIPAA. A Regra de Segurança da HIPAA (45 CFR §164.312) tem requisitos específicos pra criptografia de ePHI (Informação de Saúde Protegida eletrônica). Esses requisitos são "endereçáveis" (addressable), o que significa que a MedDefense precisa implementar a criptografia especificada OU documentar por que uma alternativa equivalente está em vigor. "Nós não sabíamos" não é uma alternativa aceitável.

## Instruções

Pesquise os requisitos de criptografia da Regra de Segurança da HIPAA. Depois produza uma Tabela de Conformidade Criptográfica da HIPAA:

| Requisito HIPAA | Citação | Estado Atual da MedDefense | Conforme? | Lacuna / Remediação |
|---|---|---|---|---|

Cubra no mínimo:

- §164.312(a)(2)(iv): Criptografia e descriptografia de ePHI
- §164.312(e)(1): Segurança de transmissão
- §164.312(e)(2)(ii): Criptografia de ePHI em trânsito
- §164.312(d): Autenticação

Pra cada requisito: o que ele exige, o que a MedDefense faz atualmente (referencie seu inventário da T0 e os achados do 1x02), se está em conformidade e qual é a remediação específica se não estiver.

Depois da tabela, responda em um parágrafo: A MedDefense passaria numa auditoria de segurança da HIPAA hoje? O que o auditor citaria como a deficiência de criptografia mais crítica?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `19-hipaa_checkpoint.md`
