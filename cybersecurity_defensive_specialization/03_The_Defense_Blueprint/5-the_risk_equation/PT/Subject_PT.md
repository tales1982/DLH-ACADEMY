# 5. A Equação de Risco

**Objetivo:** Dominar a análise quantitativa de risco calculando SLE, ARO e ALE para cenários concretos da MedDefense.

## Contexto

Até agora, você avaliou risco qualitativamente: Crítico, Alto, Médio, Baixo. Isso é útil pra triagem mas inútil pra orçamento. Um CFO não financia "risco Alto." Um CFO financia "$180.000 em perda anual esperada que podemos reduzir pra $12.000 com um investimento de $40.000."

A análise quantitativa de risco substitui opiniões por matemática:

- **Asset Value (AV) — Valor do Ativo:** Quanto o ativo vale? (Custo de reposição + perda de receita + multas regulatórias + dano reputacional)
- **Exposure Factor (EF) — Fator de Exposição:** Se a ameaça se concretizar, que porcentagem do valor do ativo é perdida? (0% a 100%)
- **Single Loss Expectancy (SLE) — Expectativa de Perda Única:** AV × EF = o custo de um incidente
- **Annualized Rate of Occurrence (ARO) — Taxa Anualizada de Ocorrência:** Quantas vezes por ano esperamos esse incidente? (Pode ser menor que 1; por exemplo, 0.2 significa uma vez a cada 5 anos)
- **Annualized Loss Expectancy (ALE) — Expectativa de Perda Anualizada:** SLE × ARO = o custo anual esperado desse risco

A matemática é simples. O julgamento por trás dos números é o que importa.

## Arquivos Fornecidos

- `risk-scenarios.txt` (5 cenários de risco com dados para cálculo)

## Instruções

Trabalhe nos 5 cenários de risco fornecidos. Cada um te dá um ativo, uma ameaça, dados de apoio e alguns números pra trabalhar. Para cada cenário:

1. Identifique ou estime o Asset Value (AV) com justificativa
2. Determine o Exposure Factor (EF) com justificativa
3. Calcule SLE = AV × EF
4. Determine o ARO usando os dados fornecidos e seu conhecimento do panorama de ameaças
5. Calcule ALE = SLE × ARO
6. Declare seu nível de confiança no ALE (Alto / Médio / Baixo) e explique qual suposição, se errada, mudaria o número mais drasticamente

Mostre todo o trabalho. A matemática não é a parte difícil. As decisões de julgamento (qual é o AV da confiança do paciente? qual é o ARO realista pra um ataque de ransomware?) são onde o aprendizado acontece.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `5-risk_equation.md`
