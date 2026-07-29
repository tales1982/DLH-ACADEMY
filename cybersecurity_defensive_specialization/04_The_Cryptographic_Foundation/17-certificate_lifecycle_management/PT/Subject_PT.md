# 17. Gerenciamento do Ciclo de Vida de Certificados

**Objetivo:** Projetar o programa de gerenciamento de certificados que impede a MedDefense de enfrentar de novo uma emergência do tipo "o certificado expira em 18 dias".

## Contexto

O certificado do portal do paciente é um sintoma, não a doença. A doença é que a MedDefense não tem inventário de certificados, não tem monitoramento de expiração, não tem processo de renovação e não tem política sobre tipos de certificado. Essa tarefa cria o programa.

## Instruções

Produza um Plano de Gerenciamento do Ciclo de Vida de Certificados pra MedDefense:

**Inventário de Certificados:** Liste todo certificado que a MedDefense deveria estar rastreando (portal do paciente, EHR interno, VPN, assinatura de e-mail, assinatura de código se aplicável). Pra cada um: o emissor atual, data de expiração (estimativa baseada nos achados) e o responsável.

**Estratégia de Renovação Automática:** Recomende se a MedDefense deveria usar ACME/Let's Encrypt (automatizado, gratuito, certificados de 90 dias) ou uma CA comercial (manual, pago, certificados de 1 ano). Pro portal do paciente especificamente, justifique sua escolha considerando os 800 pacientes diários e o impacto clínico de uma expiração.

**Monitoramento e Alertas:** Que sistema deveria monitorar a expiração de certificados? Em quais limiares os alertas deveriam disparar (90 dias, 60 dias, 30 dias, 7 dias)? Quem recebe cada alerta?

**Política de Certificados:** Redija 5 regras de política pro uso de certificados na MedDefense (exemplo: "Todos os serviços internos devem usar certificados assinados pela CA interna da MedDefense ou por uma CA pública confiável. Certificados autoassinados são proibidos em produção.").

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `17-certificate_lifecycle.md`
