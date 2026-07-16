# O que você precisa fazer

Esse exercício é o oposto do Task 4: lá você procurava o que **existe**. Aqui você vai olhar pra mesma Matriz Resumo de Controles que fizemos e procurar **o que não existe** — pelo menos 6 lacunas (gaps) significativas.

## Passo 1 — Entenda os 3 jeitos diferentes de uma lacuna aparecer

O enunciado dá 3 padrões possíveis. Não são a mesma coisa:

1. **Um ativo crítico não tem uma função de controle específica.** Ex: um sistema tem cadeado (Preventivo) mas ninguém percebe se alguém tentou arrombar (Detectivo).
2. **Uma função inteira está faltando numa categoria.** Isso você lê **direto da Matriz** — é literalmente uma coluna vazia numa linha inteira.
3. **O controle existe, mas não cobre tudo que deveria.** Aqui o controle não está "ausente" — ele só é incompleto. Ex: um antivírus que protege só parte das máquinas.

## Passo 2 — Vá até a Matriz do Task 4 e leia as células vazias

Olhe a matriz que já montamos:

| | Preventivo | Detectivo | Corretivo | Compensatório | Dissuasório |
|---|---|---|---|---|---|
| **Técnico** | C-001... | C-005, C-013 | C-009 | *(vazio)* | *(vazio)* |
| **Administrativo** | C-006, C-012 | *(vazio)* | *(vazio)* | *(vazio)* | *(vazio)* |
| **Físico** | C-010 | C-011 | *(vazio)* | *(vazio)* | *(vazio)* |

Cada célula vazia é uma **lacuna candidata** do tipo 2 (função inteira faltando numa categoria). Por exemplo: a linha Administrativo não tem nenhum Detectivo, nenhum Corretivo, nenhum Compensatório, nenhum Dissuasório — só Preventivo. Isso já é bastante coisa pra transformar em 2-3 gaps bem fundamentados.

## Passo 3 — Procure lacunas do tipo 1 e tipo 3 nos próprios artefatos (não só na matriz)

Releia as falas do James e as notas dos artefatos — muitas delas **já apontam a lacuna de propósito**:

- James disse: *"Temos um firewall, mas nada que nos avise se alguém passar por ele."* Isso é uma pista direta: no Artefato 8, tem escrito **"No automated alerting on security events"**. Ligue esses dois pontos.
- James disse: *"Temos backup, mas nenhum procedimento de recuperação testado."* Isso também está literalmente no Artefato 5: **"Full DR test: Never performed"**. O controle de backup existe (C-009, Corretivo) — mas ele nunca foi comprovado que funciona de verdade.
- No Artefato 4 (antivírus), repare que a cobertura **não é completa**: estações Windows estão cobertas, mas servidores Windows e servidores Linux explicitamente **não estão**. Isso é uma lacuna do tipo 3 — o controle existe, mas não cobre ativos críticos (como o `ehr-srv-01`, que é Linux).

## Passo 4 — Como preencher cada campo

- **Gap ID:** G-001, G-002... (igual fizemos com os Control ID).
- **Gap Description:** o que está faltando, especificamente — não escreva algo genérico tipo "falta segurança", diga exatamente o quê.
- **Category x Function Missing:** copie o formato do exemplo do enunciado, tipo "Technical Detective".
- **Affected Asset(s) or Zone:** quem fica exposto por causa dessa lacuna.
- **Risk if Unaddressed:** aqui você usa a mesma habilidade do Task 1 — nomeie o(s) pilar(es) CIA que ficam em risco se ninguém corrigir isso.
- **Evidence:** de onde você tirou a certeza de que isso está faltando — pode citar a Matriz do Task 4, um artefato específico, ou uma observação do Task 3.

## Passo 5 — A pergunta final (2-3 frases)

O enunciado pergunta se a postura da MedDefense é mais voltada pra **prevenção** ou pra **detecção**. Olhe pra sua própria Matriz: quantos controles caíram na coluna Preventivo comparado com Detectivo, Corretivo, Compensatório e Dissuasório? A resposta está nos números que você mesmo já levantou. Depois, pense: se um ataque conseguir passar pelos poucos controles preventivos que existem (como aconteceu com o minerador de criptomoeda no Task 2), o que a MedDefense tem pra perceber isso rápido, ou pra se recuperar bem? Essa é a implicação que o enunciado quer que você conecte.

## Passo 6 — Onde entregar

O arquivo final vai como `5-control_gaps.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.

---

Quer tentar montar o primeiro gap sozinho (usando uma das células vazias da matriz como ponto de partida), ou prefere que eu monte um como modelo primeiro?
