# 14. Os Três Cenários

**Objetivo:** Construir 3 cenários de ameaça completos e realistas, integrando todos os elementos produzidos neste projeto.

## Contexto

Tudo que você construiu — perfis de ator, análise de vetor, mapeamento de superfície, kill chains, ameaças STRIDE, mapeamentos ATT&CK — converge aqui. Você está construindo os cenários que o Conselho vai usar pra entender o que poderia acontecer com a MedDefense se os gaps não forem fechados.

Cada cenário precisa ser específico o bastante pra que um leitor consiga acompanhar o ataque passo a passo, realista o bastante pra que pudesse realmente acontecer, e conectado o bastante à sua avaliação de postura pra que toda fraqueza explorada tenha um gap documentado por trás.

## Instruções

Construa 3 cenários de ameaça contra a MedDefense. Cada um precisa envolver um tipo de ator de ameaça diferente e um vetor primário diferente.

- **Cenário 1 — Externo: Campanha de Ransomware.** Ator: Crime organizado / grupo RaaS (perfil BlackReef do T2). Vetor primário: Escolha da sua Matriz de Vetor-para-Ativo.
- **Cenário 2 — Interno: Exfiltração de Dados por Insider.** Ator: Insider malicioso (um dos perfis do T3). Vetor primário: Acesso legítimo abusado.
- **Cenário 3 — Terceiro: Comprometimento de Cadeia de Suprimentos.** Ator: Atacante externo usando um fornecedor como trampolim (do T5). Vetor primário: Caminho de acesso do fornecedor.

Para cada cenário:

```
Título: [Nome descritivo]
Ator de Ameaça: [Tipo + referência de perfil do T6]
Motivação: [Da lista do Sec+ 2.1]
Vetor Inicial: [Do T4/T8]
Superfície de Ataque Explorada: [Do T7 - externa/interna/humana]

Sequência de Ataque:
  Passo 1: [Ação + tática do ATT&CK]
  Passo 2: [Ação + tática do ATT&CK]
  Passo 3: [...]
  Passo 4: [...]
  Passo 5: [...]
  (quantos passos o cenário exigir)

Categorias STRIDE Acionadas: [Quais ameaças STRIDE do T11/T12 esse cenário ativa?]
Ativos da MedDefense Impactados: [Do Registro de Ativos]
Impacto de Negócio: [Clínico / Financeiro / Regulatório / Reputacional - seja específico]
Gaps Explorados: [Liste IDs de Gap do 1x00 com breve explicação de como cada um é explorado]
Oportunidades de Detecção: [Em qual(is) passo(s) a MedDefense PODERIA detectar esse ataque se tivesse os controles certos? Quais seriam esses controles?]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `14-threat_scenarios.md`
