# 7. A Atualização do Registro de Riscos

**Objetivo:** Atualizar o Registro de Riscos da MedDefense com a ameaça Crimson Tide, demonstrando que um Registro de Riscos é um documento vivo que responde a novas informações de inteligência.

## Contexto

Seu Registro de Riscos do 1x03 T10 tinha uma entrada de ransomware. Crimson Tide não é só "ransomware". É uma campanha específica com TTPs específicas mirando exatamente o perfil da MedDefense. A entrada existente precisa ser atualizada, e uma nova entrada para a vulnerabilidade do FortiGate precisa ser adicionada.

## Instruções

### Parte 1 — Atualizar Entrada Existente

Ache a entrada de risco de ransomware no seu Registro de Riscos do 1x03. Atualize-a com:

- Nova fonte de ameaça: grupo Crimson Tide (CT)
- Probabilidade atualizada: usando o novo ARO do T5
- ALE atualizado
- Justificativa de tratamento atualizada: a decisão de tratamento atual ainda se sustenta?
- Novo KRI: qual indicador específico sinalizaria que o Crimson Tide está mirando a MedDefense?

### Parte 2 — Nova Entrada: Vulnerabilidade do FortiGate

Adicione uma nova entrada de risco (`RISK-NEW-001`) para o CVE-2023-27997 no FortiGate:

- Preencha todos os campos do template do Registro de Riscos do 1x03
- Decisão de tratamento: o contrato de suporte do FortiGate custa $2.400 para renovar. O patch exige o contrato. Calcule se o custo do patch se justifica contra o ALE.

### Parte 3 — Teste de Governança do Registro

A nota de governança do Registro de Riscos do 1x03 definiu gatilhos de revisão. O alerta do Crimson Tide se qualifica como um gatilho de revisão fora de ciclo? Cite os critérios do gatilho e explique por que esse evento os atende.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x05_board_briefing`
- **Arquivo:** `7-risk_register_update.md`
