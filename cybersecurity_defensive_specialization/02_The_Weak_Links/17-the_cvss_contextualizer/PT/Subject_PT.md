# 17. O Contextualizador de CVSS

**Objetivo:** Recalcular notas CVSS com métricas ambientais para produzir prioridades informadas por ameaça e contextualizadas ao negócio.

## Contexto

Esta é a tarefa-chave do projeto. Tudo converge aqui: pontuação técnica CVSS, criticidade de ativos do 1x00, posicionamento em kill chains do 1x01, e disponibilidade de exploit de tarefas anteriores neste projeto.

Abra a Calculadora CVSS do NIST mais uma vez.

## Instruções

Para os 8 achados "Acionáveis" mais importantes da sua triagem (T16), recalcule a prioridade usando 4 fatores contextuais:

Para cada achado:

```
Achado [ID] - [CVE ou descrição]
Nota Base CVSS: [Do scan/NVD]

Fator 1 - Criticidade do Ativo (do 1x00):
  Ativo: [Nome]
  Classificação CIA: [Da Matriz de Criticidade do 1x00]
  Impacto da Criticidade na Prioridade: [A importância do ativo aumenta ou diminui a urgência?]

Fator 2 - Posição na Kill Chain (do 1x01):
  Aparece na(s) Kill Chain(s): [Quais do 1x01 T10? Ou "Nenhuma identificada"]
  Papel na Cadeia: [É o ponto de acesso inicial, um facilitador de movimento lateral, ou um alvo final?]
  Impacto da Kill Chain na Prioridade: [A posição na cadeia aumenta ou diminui a urgência?]

Fator 3 - Explorabilidade (da T4):
  Nota de Explorabilidade: [1-5 da T4]
  CISA KEV: [Sim/Não]
  Impacto do Exploit na Prioridade: [A disponibilidade de exploit aumenta ou diminui a urgência?]

Fator 4 - Controles Compensatórios (do 1x00):
  Controles Existentes: [Da Matriz de Controle do 1x00 - alguma coisa mitiga parcialmente isso?]
  Impacto do Controle na Prioridade: [Controles existentes diminuem a urgência?]

CVSS Ambiental (recalculado):
  Métricas Ambientais Aplicadas: [Que ajustes você fez na Calculadora do NIST?]
  Nota Ajustada: [Nova nota]

Prioridade Final: [Crítico/Alto/Médio/Baixo]
Justificativa Final: [Um parágrafo sintetizando os 4 fatores]
```

Depois dos 8, produza uma **Tabela de Comparação de Prioridade** mostrando: Achado | CVSS Base | Prioridade Ajustada | Direção da Mudança (maior/igual/menor). Destaque qualquer achado onde a prioridade ajustada difere significativamente do CVSS base.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `17-cvss_contextualizer.md`
