# O que você precisa fazer

Essa tarefa mostra, na prática, algo que é fácil só "saber de cabeça" mas raramente se pratica: risco não é uma nota fixa, ele muda quando chega inteligência nova. Você vai recalcular um número que já existia (1x03 T6) e mostrar o efeito em cascata dessa mudança.

## Passo 1 — O ARO Atualizado exige uma conta, não um chute

O alerta te dá um dado concreto: 5 ataques confirmados em 10 dias, no cenário/setor relevante. Isso é uma taxa de incidentes observada que você pode converter em uma frequência anualizada aproximada (pense em quantos incidentes por ano essa taxa de 10 dias projetaria, e depois pondere isso pelo quão parecida a MedDefense é com os hospitais atingidos — porte, geografia, mesmas vulnerabilidades). O ponto não é a precisão matemática perfeita, é mostrar que o novo ARO é significativamente mais alto que a estimativa original de 0.2-0.33, e justificar o porquê com números do próprio alerta.

## Passo 2 — Não esqueça de mostrar o SLE original — ele pode ou não mudar

Repare que a tarefa fala em recalcular o ALE, mas o SLE (perda esperada por incidente) pode continuar o mesmo do 1x03, a menos que você tenha uma razão específica para ajustá-lo também (por exemplo, os valores de resgate reais mencionados no alerta — $1.2M a $3.5M — podem te dar uma base melhor para revisar o SLE também, se o seu SLE original estava desatualizado).

## Passo 3 — A Parte 2 é o motivo pelo qual essa tarefa existe

Um ALE maior muda a matemática de justificativa de qualquer controle: (ALE × redução de risco do controle) vs. (custo do controle). Controles que antes pareciam caros demais para o risco pequeno podem agora ter ROI positivo. Vá especificamente atrás dos itens que você mesmo classificou como "Não Justificado" em 1x03 T7 e refaça a conta com o ALE novo — não assuma, calcule.

## Passo 4 — A pergunta sobre o orçamento de $120.000 é sobre julgamento, não só matemática

Mesmo que o ROI matemático aponte para "sim, gaste mais", pense em como você apresentaria essa recomendação para uma diretoria em uma reunião de emergência amanhã de manhã — que evidência (o ALE atualizado, o alerta da CISA, os hospitais já atingidos na região) sustenta pedir mais orçamento do que o aprovado.

## Onde entregar

O arquivo final vai como `5-ale_update.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
