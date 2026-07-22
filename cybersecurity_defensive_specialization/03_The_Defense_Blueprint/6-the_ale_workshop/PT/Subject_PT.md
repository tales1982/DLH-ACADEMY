# 6. O Workshop de ALE

**Objetivo:** Calcular o ALE dos 5 riscos reais de maior prioridade da MedDefense e usar os resultados para conectar a análise de risco ao investimento em controles.

## Contexto

Os cenários de risco da Tarefa 5 foram exercícios com dados fornecidos. Agora você constrói os cálculos de ALE reais para a MedDefense, usando os riscos que VOCÊ identificou ao longo de três projetos, os valores de ativos que VOCÊ avaliou, e as frequências de ameaça da inteligência que VOCÊ coletou.

Esse é o ponto onde todo o seu trabalho se converte em números que direcionam decisões.

## Instruções

Selecione os 5 riscos de maior prioridade do seu trabalho (combinando gaps, vulnerabilidades e ameaças dos três projetos anteriores). Para cada risco, produza um cálculo completo de ALE:

```
Risco: [Nome descritivo, ex: "Ransomware criptografa o sistema EHR"]
Fonte: [ID do Gap + Achado de Vulnerabilidade + Ator de Ameaça dos projetos anteriores]

Ativo: [Nome, do Registro de Ativos do 1x00]
Asset Value (AV): [Valor em $, com justificativa]
  Custo de reposição/recuperação: [$]
  Perda de receita durante inatividade: [$ por dia × dias estimados]
  Multas regulatórias: [$]
  Impacto na confiança/reputação do paciente: [$, estimado]

Exposure Factor (EF): [%]
  Justificativa: [Por que essa porcentagem?]

SLE: AV × EF = [$]

ARO: [Frequência]
  Justificativa: [Baseado em dados setoriais do 1x01 + fatores específicos da MedDefense]

ALE: SLE × ARO = [$]

Controle Proposto: [O que mitigaria esse risco?]
Custo Anual do Controle: [$]
ALE Estimado Após o Controle: [$, com novo ARO ou EF]
Benefício Líquido: (ALE Antes) - (ALE Depois) - (Custo do Controle) = [$]
```

Depois dos 5, produza uma **tabela de Priorização de Risco por ALE** ranqueando os riscos do maior para o menor ALE.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `6-ale_workshop.md`
