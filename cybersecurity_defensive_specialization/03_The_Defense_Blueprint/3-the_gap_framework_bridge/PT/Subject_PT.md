# 3. A Ponte Entre Gaps e Frameworks

**Objetivo:** Conectar cada gap significativo dos projetos anteriores a um controle de framework específico, transformando achados brutos em itens de ação estruturados e alinhados a frameworks.

## Contexto

Você tem gaps do 1x00, ameaças do 1x01, vulnerabilidades do 1x02, e notas de framework da T1 e T2. Agora mesmo, elas existem em documentos separados. Esta tarefa conecta tudo numa única cadeia de rastreabilidade: **Gap → Vulnerabilidade → Ameaça → Controle de Framework → Ação Recomendada.**

Essa ponte é o que torna uma estratégia crível. Quando o Conselho perguntar "Por que deveríamos implementar segmentação de rede?", a resposta não é "porque é uma boa prática." A resposta é: "Porque o Gap GAP-003 (rede plana) habilita a Kill Chain #1 (ransomware), é explorado pelo Achado de Vulnerabilidade 003 (acesso irrestrito ao PostgreSQL), mapeia para o CIS Control 12 (Gestão de Infraestrutura de Rede) no IG1, e fechá-lo reduz nosso ALE de ransomware em aproximadamente $180.000 por ano."

## Instruções

Selecione os 8 gaps de maior prioridade do seu trabalho anterior (use a lista re-priorizada do 1x01 T15 e os achados do 1x02). Para cada um:

- **Referência do Gap:** [ID do 1x00/1x02]
- **Descrição:** [Uma linha]
- **Evidência de Vulnerabilidade:** [ID(s) do Achado do 1x02]
- **Contexto de Ameaça:** [Tipo de ator + kill chain do 1x01]
- **Função do NIST CSF:** [Em qual função esse gap se encaixa?]
- **CIS Control:** [Qual CIS Control endereça esse gap? Inclua o número do controle.]
- **Ação Recomendada:** [Uma frase: o que a MedDefense deveria fazer]

Depois dos 8, produza uma **Tabela de Resumo de Rastreabilidade** mostrando a cadeia completa numa única visão.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `3-gap_framework_bridge.md`
