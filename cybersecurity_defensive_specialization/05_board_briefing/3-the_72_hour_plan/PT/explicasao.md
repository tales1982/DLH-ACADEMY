# O que você precisa fazer

Essa tarefa é sobre triagem sob restrição de tempo e recursos — a diferença entre um plano perfeito (impossível em 72h) e um plano realista que reduz o máximo de risco possível com o que você tem em mãos hoje.

## Passo 1 — Leia as restrições como regras rígidas, não como sugestões

Cada restrição no contexto existe para forçar uma decisão. "2 pessoas de TI disponíveis" significa que você não pode colocar 5 ações paralelas que dependem da Sarah ao mesmo tempo. "Renovação de contrato antes do firmware" significa que a ação de patchear o FortiGate tem um pré-requisito administrativo, não é "só instalar". Trate essas restrições como você trataria uma limitação técnica real.

## Passo 2 — O isolamento do backup é a ação mais fácil e mais óbvia — não a esconda no meio do plano

Repare que o enunciado já entrega de bandeja que isso "pode ser feito hoje à noite" com uma desconexão física. Essa é uma ação de Nível 1 clássica: zero custo, zero aprovação, risco de disrupção quase nulo, e bloqueia diretamente a Fase 5 (Destruição de Backup) do Crimson Tide. Se ela não estiver no seu Nível 1, revise o plano.

## Passo 3 — Cuidado com ações que parecem "rápidas" mas têm risco escondido

Mudar a configuração Kerberos do AD é tentador de colocar no Nível 1 porque tecnicamente é "só uma configuração" — mas o próprio enunciado avisa que isso exige uma janela de manutenção e tem risco de quebrar a autenticação. Isso é claramente Nível 2 ou 3, não Nível 1. Use o "Risco da Ação" para justificar por que algo tecnicamente simples ainda não é algo para fazer sem planejamento.

## Passo 4 — O Conflito de Recursos é o teste real de que você entendeu a restrição de pessoal

Com só 3 pessoas de TI disponíveis (Sarah + 2), é bem provável que duas ações "urgentes" do seu plano peçam a mesma pessoa ao mesmo tempo. Ache esse conflito de propósito e proponha uma solução real (ordem de execução, trazer alguém externo, adiar uma ação de risco baixo). Se o seu plano não tem nenhum conflito, provavelmente você não colocou ações suficientes nos Níveis 1 e 2.

## Onde entregar

O arquivo final vai como `3-emergency_plan.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
