# O que você precisa fazer

Essa tarefa é sobre manutenção de um documento vivo, não sobre criar algo do zero. A ideia central é: um Registro de Riscos que nunca muda é um documento morto, e essa tarefa prova que o seu não é.

## Passo 1 — Não recrie a entrada de ransomware, EDITE-A

O ponto da Parte 1 é pegar a entrada exata que você já escreveu no 1x03 T10 e mostrar a versão "antes e depois". Se você escrever uma entrada nova do zero sem referenciar explicitamente o que mudou em relação à original, você perde o objetivo da tarefa, que é demonstrar rastreabilidade de uma decisão de risco ao longo do tempo.

## Passo 2 — O KRI (Key Risk Indicator) precisa ser algo observável, não uma sensação

Pense em sinais técnicos concretos que você conseguiria monitorar de verdade: tentativas de login na VPN fora do padrão, tráfego anômalo saindo pela FortiGate, presença de assinaturas de IOC do próprio alerta (como o padrão de URI `/remote/logincheck` com payload grande) nos logs do FortiGate. Um KRI vago como "atividade suspeita" não serve.

## Passo 3 — A decisão de tratamento do FortiGate é uma conta de ROI de segurança

Compare o custo de renovar o contrato ($2.400, que destrava o patch) contra o ALE atualizado que você calculou na Tarefa 5. Se o ALE está na casa de centenas de milhares ou milhões de dólares, e o custo de mitigação é $2.400, a justificativa deveria ser óbvia — mas escreva a conta explicitamente, não deixe implícito.

## Passo 4 — A Parte 3 quer que você cite as próprias regras que você escreveu antes

Volte no seu 1x03 e ache literalmente o texto que definia os "gatilhos de revisão fora de ciclo" (review triggers) do Registro de Riscos. Coisas como "nova vulnerabilidade crítica divulgada", "mudança significativa no cenário de ameaças" ou "alerta de agência governamental" são gatilhos típicos — cite o texto exato que você escreveu e mostre, ponto a ponto, como o alerta da CISA se encaixa nele.

## Onde entregar

O arquivo final vai como `7-risk_register_update.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
