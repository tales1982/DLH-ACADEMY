# 14. Segurança de Hardware e Gerenciamento de Chaves

**Objetivo:** Avaliar as tecnologias TPM, HSM e enclave seguro, e projetar uma estratégia de gerenciamento de chaves pra MedDefense que resolva o problema de "onde você guarda as chaves?".

## Contexto

Todo esquema de criptografia tem uma fraqueza fatal: a chave. Se você criptografa 50.000 prontuários de pacientes com AES-256 e guarda a chave num arquivo de configuração em texto puro no mesmo servidor, você não protegeu nada de verdade. Você só adicionou uma lombada na estrada.

O Sec+ 1.4 identifica três tecnologias de segurança de hardware projetadas pra resolver esse problema: TPM (Trusted Platform Module), HSM (Hardware Security Module) e enclaves seguros. Cada uma opera numa escala e custo diferente, e a MedDefense precisa escolher qual é apropriada pro orçamento e perfil de risco dela.

## Instruções

### Parte 1 - Comparação de Tecnologias

Pesquise e compare:

| Tecnologia | O Que É | O Que Protege | Custo Típico | Implantação Típica |
|---|---|---|---|---|
| TPM | ? | ? | ? | ? |
| HSM | ? | ? | ? | ? |
| Enclave Seguro | ? | ? | ? | ? |
| KMS (Software) | ? | ? | ? | ? |

### Parte 2 - Design de Gerenciamento de Chaves da MedDefense

A MedDefense agora tem criptografia em: o banco de dados de pacientes (recomendação da T13), o armazenamento de backup (T12), o TLS do portal (T10) e os túneis de VPN. Cada um desses tem pelo menos uma chave de criptografia.

Projete um Plano de Gerenciamento de Chaves que aborde:

- Onde cada chave é armazenada (qual sistema/dispositivo)
- Quem tem acesso a cada chave (qual papel, da sua estrutura de governança do 1x03)
- Como as chaves são rotacionadas (frequência e processo)
- O que acontece se uma chave for comprometida (procedimento de revogação e substituição)
- O que acontece se uma chave for perdida (procedimento de recuperação, key escrow se apropriado)

### Parte 3 - A Decisão do HSM

Usando os cálculos de ALE do 1x03, avalie se a MedDefense deveria investir num HSM pro gerenciamento de chaves de criptografia do banco de dados. Estime o custo de um HSM (opções de HSM-as-a-Service na nuvem estão disponíveis por aproximadamente $1-2/chave/mês). Compare isso com o risco de comprometimento de chave (referencie o risco relevante do seu Registro de Riscos). O investimento se justifica?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `14-key_management.md`
