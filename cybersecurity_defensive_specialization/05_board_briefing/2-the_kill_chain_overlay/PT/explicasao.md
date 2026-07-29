# O que você precisa fazer

Essa tarefa testa se a sua modelagem de ameaças anterior (1x01) era só um exercício teórico ou se ela realmente previu algo útil. Você vai comparar seu modelo com um ataque real e depois checar se a defesa que você desenhou (1x03) realmente pararia esse ataque.

## Passo 1 — "Bater" não precisa significar idêntico

Sua Kill Chain #1 provavelmente tem fases mais genéricas (ex.: "Acesso Inicial", "Movimento Lateral") enquanto o Crimson Tide tem fases muito específicas (ex.: "exploração de CVE-2023-27997 no FortiGate"). Uma etapa "bate" quando a categoria geral está correta, mesmo que o vetor específico seja diferente do que você imaginou. O interessante de verdade é notar as vezes em que a técnica específica usada é diferente do que você tinha em mente — isso é aprendizado real, não falha do seu modelo.

## Passo 2 — Não confunda "planejado" com "implantado" no mapa de interceptação

Esse é o ponto central da tarefa. Um controle que está na sua Estratégia de Segurança mas ainda não foi implementado NÃO conta como proteção real hoje. A coluna "Status" existe justamente para você distinguir isso — e o exercício quer que você seja honesto sobre quantos dos seus controles ainda estão só no papel.

## Passo 3 — A Parte 3 é sobre risco residual, um conceito chave em segurança

Mesmo com a estratégia 100% implementada, é bem provável que 1 ou 2 fases do ataque ainda teriam sucesso (por exemplo, a extorsão em si — nenhum controle técnico impede alguém de tentar extorquir depois que já roubou dados). Isso não é um "erro" da sua estratégia. É a natureza da segurança: redução de risco, não eliminação de risco. O ponto da tarefa é você articular isso claramente.

## Onde entregar

O arquivo final vai como `2-kill_chain_overlay.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
