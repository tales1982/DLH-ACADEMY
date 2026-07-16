# 12. A Análise de Lacunas

**Objetivo:** Realizar uma análise de lacunas formal, cruzando sistematicamente a criticidade dos ativos, a cobertura de controles e as fragilidades identificadas, para produzir uma lista priorizada de lacunas de segurança.

## Contexto

Você construiu três documentos fundamentais: um Registro de Ativos com classificações de criticidade, um Mapa de Dados com lacunas de proteção, e uma Matriz de Controles Completa com avaliações de cobertura. Agora você precisa juntar tudo isso.

> "Essa é a análise que importa," diz James Chen. "Tudo que você fez até agora são blocos de construção. É aqui que isso vira uma história sobre a qual o Conselho pode agir."

Uma análise de lacunas não é uma lista de problemas. É uma avaliação estruturada que conecta o que você precisa proteger (ativos e dados críticos) com o que existe de proteção (controles), e identifica onde a distância entre os dois é inaceitável.

## Instruções

Cruze sua Avaliação de Criticidade de Ativos (Task 8), o Mapa de Dados (Task 9), a Matriz de Controles Completa (Task 10) e os achados de Shadow IT (Task 11) para produzir uma **Análise de Lacunas Priorizada**.

Identifique no mínimo **10 lacunas**. Para cada lacuna, documente:

```
Gap ID: [GAP-001, etc.]
Título: [Descrição em uma linha]
Ativo(s) Afetado(s): [Do Registro de Ativos, com classificação de criticidade]
Dado em Risco: [Do Mapa de Dados, com nível de classificação]
Status Atual do Controle: [O que existe -- referencie a Matriz de Controles]
O que Está Faltando: [Categoria/função de controle específica ausente ou inadequada]
Nível de Risco: [Crítico / Alto / Médio / Baixo]
Justificativa do Risco: [Por que esse nível -- conecte criticidade do ativo, sensibilidade do dado e ausência de controle]
Impacto Potencial: [O que acontece se essa lacuna for explorada -- seja específico à MedDefense]
```

### Regras de Priorização

- **Crítico:** A lacuna afeta um ativo classificado como Crítico ou dado Restrito **E** não tem nenhum controle detectivo ou corretivo.
- **Alto:** A lacuna afeta um ativo classificado como Alto ou dado Confidencial **E** tem cobertura de controle incompleta.
- **Médio:** A lacuna afeta um ativo classificado como Médio **OU** tem controles parciais que reduzem mas não eliminam o risco.
- **Baixo:** A lacuna afeta um ativo classificado como Baixo **E** tem medidas compensatórias parciais.

Depois da lista de lacunas, produza um **Resumo de Distribuição de Lacunas** mostrando:

1. Quantas lacunas caem em cada nível de risco.
2. Quais categorias de ativo têm mais lacunas.
3. Se as lacunas estão concentradas numa categoria ou função de controle específica.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `12-gap_analysis.md`
