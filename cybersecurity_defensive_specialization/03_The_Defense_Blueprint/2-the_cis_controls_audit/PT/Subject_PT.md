# 2. A Auditoria dos CIS Controls

**Objetivo:** Pontuar a MedDefense contra os 18 Controles Principais do CIS para produzir uma avaliação de maturidade de segurança concreta e acionável.

## Contexto

O NIST CSF diz quais funções endereçar. O CIS Controls diz exatamente o que implementar, em que ordem. Os CIS Controls são organizados em três Grupos de Implementação:

- **IG1 (Essencial):** O padrão mínimo que toda organização deveria atender. 56 salvaguardas. Pense nisso como "higiene básica."
- **IG2 (Fundamental):** Salvaguardas adicionais para organizações com ambientes mais complexos. Constrói em cima do IG1.
- **IG3 (Organizacional):** Salvaguardas avançadas para organizações com equipes de segurança dedicadas lidando com ataques sofisticados.

A MedDefense, como organização de saúde lidando com dados regulados e uma equipe de segurança pequena, deveria ter como meta o IG1 totalmente implementado e o IG2 parcialmente implementado dentro de 6 meses.

## Arquivos Fornecidos

- `cis-controls-summary.txt` (todos os 18 controles com descrições de salvaguardas IG1/IG2)

## Instruções

Pontue a MedDefense contra cada um dos 18 CIS Controls usando uma escala simples de 3 níveis:

| Nota | Significado |
|---|---|
| Implemented (Implementado) | O controle está em vigor e funcionando |
| Partial (Parcial) | Alguns elementos do controle existem mas a cobertura está incompleta |
| Not Implemented (Não Implementado) | O controle está ausente |

Para cada controle:

- **CIS Control [#]:** [Nome]
- **Nota:** [Implemented / Partial / Not Implemented]
- **Evidência:** [Uma frase referenciando um achado específico do 1x00, 1x01 ou 1x02]

Depois de pontuar todos os 18, produza:

1. **Resumo do Scorecard:** Contagem de Implemented / Partial / Not Implemented
2. **Top 5 Controles Prioritários:** Os 5 controles cuja implementação teria o maior impacto na postura de segurança da MedDefense. Justifique cada escolha em uma frase.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `2-cis_controls_audit.md`
