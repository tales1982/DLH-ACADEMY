# 16. O Filtro de Ruído

**Objetivo:** Triar cada achado do relatório de scan em categorias de ação para separar sinal de ruído.

## Contexto

Trinta e um achados. Você já investigou muitos deles individualmente. Agora dê um passo atrás e organize o relatório inteiro. Essa é a disciplina diária da gestão de vulnerabilidades: todo scan produz mais achados do que você consegue agir sobre. A triagem determina o que é corrigido, o que é monitorado, e o que é arquivado.

## Instruções

Classifique cada achado (todos os 31) do relatório de scan em uma das 4 categorias:

| Categoria | Definição | Ação Necessária |
|---|---|---|
| Actionable Critical (Acionável Crítico) | Explorável, em ativo crítico, alto impacto | Correção imediata (24-48h) |
| Actionable Standard (Acionável Padrão) | Vulnerabilidade real, exige correção planejada | Correção agendada (7-30 dias) |
| Informational (Informativo) | Observação real, baixo risco ou sem ação direta necessária | Documentar e monitorar |
| False Positive (Falso Positivo) | Não é uma vulnerabilidade real nesse contexto | Documentar e descartar |

Formato:

```
Achado [ID] | [CVSS ou Severidade] | [Host] | Categoria: [AC/AS/I/FP] | Motivo: [uma frase]
```

Depois da triagem completa, produza:

1. **Resumo da Triagem:** Contagem por categoria
2. **Lista de Achados Acionáveis:** Os achados AC e AS, ordenados por prioridade dentro de cada categoria

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `16-triage.md`
