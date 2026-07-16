# 10. A Matriz de Controles Completa

**Objetivo:** Produzir um inventário de controles consolidado e autoritativo que integre todos os controles identificados ao longo do projeto, mapeados contra os ativos que eles protegem.

## Contexto

Agora você tem controles vindos de múltiplas fontes: a análise de artefatos (Task 4), as observações físicas (Task 3), os controles compensatórios que você desenhou (Task 6), e várias menções ao longo da análise de incidentes e do mapeamento de dados. James Chen precisa de um único documento definitivo.

> "Quando o Conselho perguntar 'que segurança nós temos?', eu preciso entregar uma página. Não cinco documentos."

## Instruções

Produza uma **Matriz de Controles Completa** que consolide todo controle de segurança identificado ao longo do projeto inteiro. Este é o documento de referência autoritativo.

### Parte 1: Registro de Controles (Atualizado)

Atualize seu inventário de controles do Task 4 com quaisquer controles adicionais que você identificou nas tasks seguintes. Cada entrada de controle precisa incluir:

```
Control ID | Nome do Controle | Categoria | Função | Ativo(s) Protegido(s) | Efetividade (Forte/Adequada/Fraca) | Evidência/Fonte
```

A coluna **Efetividade** é nova. Avalie cada controle com base nas suas observações:

- **Forte:** Configurado corretamente, cobrindo o escopo certo, mantido ativamente.
- **Adequada:** Existe, mas com limitações (ex: lacunas de cobertura, regras desatualizadas).
- **Fraca:** Existe no papel, mas mal implementado ou facilmente contornável.

### Parte 2: Matriz Resumo de Controles Atualizada

Reproduza a matriz Categoria × Função do Task 4, agora incluindo todos os controles identificados ao longo do projeto. Marque cada célula com a contagem de controles e sua efetividade média.

### Parte 3: Mapa de Cobertura de Controles

Para cada um dos seus 5 Ativos Mais Críticos (Task 8), liste os controles que o protegem e identifique quais categorias/funções de controle estão faltando.

```
Ativo Crítico | Preventivo | Detectivo | Corretivo | Compensatório | Avaliação de Cobertura
```

A **Avaliação de Cobertura** é seu julgamento profissional: Bem Protegido / Parcialmente Protegido / Sub-Protegido / Desprotegido.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `10-complete_control_matrix.md`
