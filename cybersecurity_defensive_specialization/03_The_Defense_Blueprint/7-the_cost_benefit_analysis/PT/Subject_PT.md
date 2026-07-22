# 7. A Análise de Custo-Benefício

**Objetivo:** Avaliar 8 controles de segurança propostos usando análise formal de custo-benefício para determinar quais investimentos são financeiramente justificados.

## Contexto

Controles de segurança custam dinheiro. Alguns valem cada centavo. Alguns custam mais do que o risco que mitigam. O CFO não se importa com "boas práticas." O CFO se importa com retorno sobre investimento.

Um controle é financeiramente justificado quando: **(ALE antes do controle) menos (ALE depois do controle) é maior que (custo anual do controle).**

Se o controle custa mais do que a redução de risco que fornece, a decisão racional é aceitar o risco ou encontrar um controle mais barato. Isso não é opinião. É matemática.

## Instruções

Avalie os 8 controles propostos a seguir para a MedDefense. Alguns são vitórias óbvias. Alguns são limítrofes. Pelo menos um não é justificado financeiramente de forma alguma.

Para cada controle, você vai precisar estimar custos e impactos no ALE. Use seus cálculos de ALE da Tarefa 6 onde aplicável, e faça estimativas razoáveis com suposições declaradas para o resto.

```
Controle [N]: [Nome]
Referência do CIS Control: [Número]
Custo Anual: [Estimativa em $ com detalhamento: licença + mão de obra + manutenção]
Risco(s) Endereçado(s): [Quais risco(s) da T6]
Redução de ALE: [Estimativa em $: ALE antes - ALE depois]
Valor Líquido: Redução de ALE - Custo Anual = [$]
Veredito: [Justificado / Marginal / Não Justificado]
Recomendação: [Implementar / Adiar / Rejeitar, com justificativa de uma frase]
```

**Os 8 controles propostos:**

1. Segmentação de rede (implementação de VLAN para zonas de servidor, estação de trabalho, dispositivo médico e convidado)
2. Implantação de MFA em VPN e contas administrativas (usando licenças O365 E3 existentes)
3. Implantação de SIEM corporativo (Wazuh, open-source, apenas custo de mão de obra)
4. Replicação de backup externo (armazenamento imutável em nuvem, AWS S3 Glacier)
5. Upgrade de Endpoint Detection and Response (do Sophos básico para o Sophos Intercept X, todos os endpoints incluindo servidores)
6. Firewall dedicado para a Clínica Westside (substituindo o roteador doméstico)
7. Equipe de Security Operations Center 24/7 (SOC gerenciado terceirizado)
8. Isolamento total de rede dos dispositivos médicos com monitoramento dedicado

Depois dos 8, produza uma **Tabela Resumo de Custo-Benefício** ranqueada por Valor Líquido (maior primeiro) e identifique quais controles cabem no orçamento anual de $120.000.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `7-cost_benefit_analysis.md`
