# 15. A Correlação Gap-Ameaça

**Objetivo:** Cruzar as lacunas (gaps) identificadas no 1x00 com as ameaças identificadas no 1x01 pra produzir uma priorização atualizada, informada por ameaças reais.

## Contexto

Sua avaliação de postura no 1x00 classificou os gaps olhando pra dentro: quão crítico é o ativo, quão exposto ele está, quais controles estão faltando. Isso era necessário, mas incompleto. Agora você tem a outra metade: quem exploraria cada gap, com qual técnica e com qual objetivo.

Um gap num sistema que nenhum atacante alvejaria continua sendo um gap, mas não é urgente. Um gap num sistema que aparece em toda kill chain que você construiu é uma emergência. Essa tarefa recalibra suas prioridades.

## Instruções

Pegue sua Análise de Gaps do 1x00 (Tarefa 12, atualizada na Tarefa 13). Para cada gap, adicione o contexto de ameaça:

```
ID do Gap: [Do 1x00]
Descrição do Gap: [Breve]
Nível de Risco Original: [Do 1x00]
Atores de Ameaça: [Quais tipos de ator do T6 explorariam esse gap?]
Kill Chains: [Quais das 5 kill chains do T10 passam por esse gap?]
Cenários: [Quais dos 3 cenários do T14 dependem desse gap?]
Nível de Risco Atualizado: [Igual / Elevado / Reduzido]
Justificativa: [Por que o nível mudou ou se manteve, referenciando evidência de ameaça]
```

Depois da correlação completa, produza:

- **Lista de Gaps Re-priorizada:** Os gaps ranqueados pelo novo nível de risco informado por ameaça. Destaque quaisquer gaps que subiram ou desceram.
- **Os Críticos Três:** Identifique os 3 gaps que aparecem com mais frequência em kill chains e cenários. Esses são os gaps cujo fechamento interromperia o maior número de caminhos de ataque.
- **A Surpresa:** Identifique pelo menos 1 gap que você classificou como Médio ou Baixo no 1x00, mas que, após a análise de ameaça, deveria ser elevado. Explique o que mudou no seu entendimento.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `15-gap_threat_correlation.md`
