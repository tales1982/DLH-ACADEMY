# 5. The Risk Equation

**Goal:** Master quantitative risk analysis by calculating SLE, ARO and ALE for concrete MedDefense scenarios.

## Context

Up to this point, you have assessed risk qualitatively: Critical, High, Medium, Low. That is useful for triage but useless for budgeting. A CFO does not fund "High risk." A CFO funds "$180,000 in expected annual loss that we can reduce to $12,000 for a $40,000 investment."

Quantitative risk analysis replaces opinions with math:

- **Asset Value (AV):** What is the asset worth? (Replacement cost + revenue loss + regulatory fines + reputation damage)
- **Exposure Factor (EF):** If the threat materializes, what percentage of the asset value is lost? (0% to 100%)
- **Single Loss Expectancy (SLE):** AV × EF = the cost of one incident
- **Annualized Rate of Occurrence (ARO):** How many times per year do we expect this incident? (Can be less than 1, for example 0.2 means once every 5 years)
- **Annualized Loss Expectancy (ALE):** SLE × ARO = the expected annual cost of this risk

The math is simple. The judgment behind the numbers is what matters.

## Provided Files

- `risk-scenarios.txt` (5 risk scenarios with data for calculation)

## Instructions

Work through the 5 risk scenarios provided. Each gives you an asset, a threat, supporting data and some numbers to work with. For each scenario:

1. Identify or estimate the Asset Value (AV) with reasoning
2. Determine the Exposure Factor (EF) with reasoning
3. Calculate SLE = AV × EF
4. Determine the ARO using the data provided and your threat landscape knowledge
5. Calculate ALE = SLE × ARO
6. State your confidence level in the ALE (High / Medium / Low) and explain what assumption, if wrong, would change the number most dramatically

Show all work. The math is not the hard part. The judgment calls (what is the AV of patient trust? what is the realistic ARO for a ransomware attack?) are where the learning happens.

## Repo

- **GitHub repository:** `dlh-cyber_security`
- **Directory:** `blue_team/1x03_defense_blueprint`
- **File:** `5-risk_equation.md`
