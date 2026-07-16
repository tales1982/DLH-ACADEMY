# 8. A Avaliação de Criticidade

**Objetivo:** Avaliar a criticidade de cada categoria de ativo usando análise baseada na Tríade CIA, calibrada para o contexto operacional específico de uma organização de saúde.

## Contexto

> "Nem todo ativo é igual," diz James Chen. "Se o painel digital de cardápio do refeitório cair, ninguém morre. Se o EHR cair, os médicos estão prescrevendo às cegas. Preciso que você me diga quais ativos importam mais e por quê, em termos que o Conselho vai entender."

## Instruções

Usando seu Registro de Ativos (Task 7), agrupe os ativos em categorias lógicas (ex: Sistema EHR, PACS/Imagem, Infraestrutura de Faturamento, Núcleo de Rede, IoT Médico, Endpoints Clínicos, Endpoints Administrativos, Sistemas de Segurança Física). Você deve chegar a 8-10 categorias.

Para cada categoria, avalie a criticidade em cada pilar CIA usando uma escala de 4 níveis:

| Nível | Definição |
|---|---|
| **Crítico** | O comprometimento ameaça diretamente a segurança do paciente, causa violação regulatória ou paralisa operações clínicas |
| **Alto** | O comprometimento causa disrupção operacional significativa, perda financeira ou exposição de dados |
| **Médio** | O comprometimento causa disrupção moderada, recuperável dentro dos procedimentos padrão |
| **Baixo** | O comprometimento tem impacto operacional ou de segurança mínimo |

Produza uma **Matriz de Criticidade de Ativos**:

```
Categoria de Ativo | Confidencialidade | Integridade | Disponibilidade | Criticidade Geral | Justificativa
```

A **Criticidade Geral** é a classificação mais alta entre os três pilares. A **Justificativa** precisa explicar a classificação no contexto das operações da MedDefense. Justificativas genéricas valem zero.

> "Contém dados de paciente" não é suficiente. "Contém informação de saúde protegida de 50.000 pacientes ativos; uma violação aciona notificação regulatória obrigatória, litígio potencial e dano reputacional estimado em milhões" é o que um Conselho precisa ouvir.

Depois da matriz, identifique e classifique os **5 Ativos Mais Críticos**, com um parágrafo breve para cada um explicando por que ele ocupa essa posição.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `8-criticality_assessment.md`
