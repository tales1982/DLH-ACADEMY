# O que você precisa fazer

7 cenários, cada um explorando um vetor humano diferente do Sec+ 2.2. O truque aqui é não confundir vetores parecidos — vários cenários se parecem à primeira vista, mas o **canal** usado é o que define o termo exato.

## Passo 1 — Identifique o canal primeiro, depois a técnica

- **Canal e-mail** → pode ser Phishing, BEC, ou Brand Impersonation, dependendo de quem finge ser.
- **Canal telefone** → Vishing.
- **Canal SMS** → Smishing.
- **Canal site/domínio falso** → Typosquatting (nome parecido) ou Brand Impersonation (visual idêntico) — repare que o Cenário 6 tem os dois ao mesmo tempo.
- **Canal presencial** → Impersonation (fingir ser alguém que tem motivo de estar ali).
- **Site legítimo comprometido que infecta visitantes** → esse é um termo específico, não é phishing nem site falso — é sobre "esperar a vítima vir até um lugar que ela já confia".

## Passo 2 — Cenário 2 merece atenção redobrada

Repare que esse cenário tem duas coisas acontecendo: é um e-mail (phishing), MAS especificamente finge ser um executivo pedindo uma transferência financeira urgente — isso tem um nome mais específico no Sec+ do que só "phishing". Pense em qual dos termos da lista descreve esse padrão exato (fraude via e-mail corporativo, mirando quem tem autoridade pra mover dinheiro).

## Passo 3 — Alavanca psicológica: não repita "urgência" em tudo

Vários cenários realmente usam urgência, mas nem todos. O Cenário 3 (a ligação da "TI") se apoia mais em autoridade + prestatividade (a enfermeira quer ajudar, e confia que quem liga é quem diz ser) do que em urgência pura. O Cenário 7 se apoia em familiaridade (o uniforme, o crachá, o gesto caloroso) mais do que em medo. Escolha a alavanca que mais explica por que a vítima cairia, não só a primeira que vier à cabeça.

## Passo 4 — Sinais de alerta específicos, não genéricos

"Parecia suspeito" não vale. Cada cenário já tem pistas escondidas no próprio texto — releia procurando o detalhe que dá a resposta (ex: o domínio no Cenário 1 não é o domínio real da Fortinet; o crachá no Cenário 7 tem uma data de validade vencida). Encontre pelo menos 3 por cenário.

## Onde entregar

O arquivo final vai como `4-social_engineering_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
