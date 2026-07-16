# 5. A Questão da Cadeia de Suprimentos

**Objetivo:** Mapear e avaliar a exposição a risco de terceiros em todo o ecossistema de fornecedores da MedDefense.

## Contexto

Em dezembro de 2020, o caso SolarWinds ensinou ao mundo uma lição que a maioria das organizações ainda não internalizou totalmente: sua segurança é tão forte quanto seu fornecedor menos seguro. A MedDefense não opera isolada. Ela depende de uma rede de fornecedores de tecnologia, contratados de serviço e administradoras de prédio, cada um com algum nível de acesso ao ambiente ou aos dados da MedDefense. Se qualquer um deles for comprometido, a MedDefense herda as consequências.

A pergunta do James Chen é específica:

> "Se a MedTech Solutions for violada amanhã, o que acontece com a gente? Eles têm acesso de manutenção ao nosso servidor de EHR. O que exatamente eles conseguem alcançar?"

## Instruções

Usando seu pacote de integração (1x00 T0), os contratos de fornecedor e o Registro de Ativos (1x00 T7), mapeie a exposição de risco de terceiros para 5 fornecedores críticos. Para cada um:

```
Fornecedor: [Nome]
Serviço: [O que eles fornecem]
Tipo de Acesso: [Rede / Dado / Físico / Aplicação - seja específico]
Escopo do Acesso: [O que exatamente eles conseguem alcançar? Quais sistemas, quais dados?]
Cenário de Comprometimento: [Se esse fornecedor for violado, qual é o caminho de ataque até a MedDefense? Seja específico.]
Controles Existentes: [O que limita o acesso desse fornecedor? Referencie a Matriz de Controles do 1x00]
Avaliação de Risco: [Crítico / Alto / Médio / Baixo - justifique]
```

### Os 5 Fornecedores a Avaliar

1. **MedTech Solutions:** fornecedor de manutenção do EHR (contrato anual de $145.000, SLA de resposta em 4h, acesso direto ao servidor para manutenção).
2. **Microsoft:** O365 E3 (e-mail de toda a organização, SharePoint, OneDrive; gerencia identidade se o Entra ID for usado).
3. **Sophos:** proteção de endpoint (agente instalado em todos os endpoints gerenciados, capacidade de empurrar atualizações e configurações).
4. **Siemens:** fabricante do aparelho de MRI (manutenção periódica da estação Windows XP, atualizações de firmware).
5. **Greenfield Building Management:** prédio da Corporate HQ (gerencia a infraestrutura de rede do prédio; a MedDefense tem uma VLAN na rede deles).

Depois das 5 avaliações individuais, produza um **Resumo de Risco de Cadeia de Suprimentos** (um parágrafo): Qual comprometimento de fornecedor único causaria mais dano à MedDefense, e por quê? Qual é o primeiro controle que a MedDefense deveria implementar para reduzir o risco de cadeia de suprimentos em todos os fornecedores?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `5-supply_chain_assessment.md`
