# 10. As Kill Chains

**Objetivo:** Construir cadeias de ataque completas, do acesso inicial ao impacto final, para os 5 caminhos de ameaça mais críticos contra a MedDefense.

## Contexto

Um ataque nunca é um evento único. É uma sequência: uma entrada, um ponto de apoio, uma progressão, um objetivo. Cada passo explora uma fraqueza diferente. Cada passo também é um ponto onde a cadeia pode ser quebrada. Entender kill chains é como você para de pensar em ameaças como categorias abstratas e passa a pensar nelas como sequências operacionais com pontos de intervenção específicos.

## Instruções

Selecione os 5 caminhos mais críticos da sua Matriz de Vetor-para-Ativo (Tarefa 9). Para cada um, construa uma kill chain completa:

```
Kill Chain #[N]: [Título descritivo]
Ator de Ameaça: [Tipo do T6, com referência de perfil]
Ativo Alvo: [Do Registro de Ativos do 1x00]
Impacto Esperado: [Consequência de negócio + pilar da CIA]

Passo 1 - Acesso Inicial:
  Vetor: [Vetor específico]
  Superfície: [Externa / Interna / Humana]
  Detalhe: [Como o atacante consegue seu primeiro ponto de apoio]

Passo 2 - Estabelecer Ponto de Apoio:
  Ação: [O que o atacante faz pra manter o acesso]
  Fraqueza da MedDefense: [O que habilita esse passo]

Passo 3 - Movimento Lateral / Escalada:
  Ação: [Como o atacante se move em direção ao alvo]
  Fraqueza da MedDefense: [O que habilita esse passo, a rede plana vai aparecer com frequência]

Passo 4 - Execução do Objetivo:
  Ação: [O que o atacante faz ao alcançar o alvo]
  Dado/Sistema Afetado: [Específico]

Passo 5 - Impacto:
  Impacto de Negócio: [Clínico, financeiro, regulatório, reputacional]
  Pilares da CIA: [Quais são afetados e como]

Gaps Explorados: [Liste IDs de Gap específicos do 1x00]
Pontos de Ruptura: [Em qual(is) passo(s) um controle poderia ter interrompido essa cadeia? Qual controle?]
```

A seção **Pontos de Ruptura** é crítica. Ela conecta a análise de ameaça à ação defensiva. Para cada kill chain, identifique pelo menos 2 passos onde um controle (existente ou ausente) poderia interromper a sequência.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `10-kill_chains.md`
