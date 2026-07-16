# O que você precisa fazer

Essa é a tarefa de síntese do meio do projeto — ela puxa literalmente de todas as tarefas anteriores (T2, T3, T5, T6, T7, T8, T11, T12) pra construir 3 histórias de ataque completas. É parecida com a Tarefa 10 (kill chains), mas mais rica: agora você também conecta STRIDE e impacto de negócio, não só os passos técnicos.

## Passo 1 — Os 3 cenários já vêm com o ator e o vetor definidos, não invente novos

O enunciado já fixou: Cenário 1 é ransomware (BlackReef, da Tarefa 2), Cenário 2 é insider malicioso (um dos perfis da Tarefa 3), Cenário 3 é cadeia de suprimentos (um dos 5 fornecedores da Tarefa 5). Seu trabalho é escolher o vetor primário específico dentro dessas restrições e construir a sequência — não é escolher o ator do zero.

## Passo 2 — Motivação vem de uma lista fechada do Sec+ 2.1

As motivações padrão do Sec+ incluem: ganho financeiro, espionagem, ativismo político/social, vingança, guerra/desestabilização, notoriedade, diversão. Escolha a que melhor combina com o ator daquele cenário específico — ransomware quase sempre é ganho financeiro; insider malicioso pode ser vingança ou ganho financeiro, dependendo do perfil que você escolher da Tarefa 3.

## Passo 3 — A Sequência de Ataque reaproveita o formato da Tarefa 10, mas agora com tática ATT&CK em cada passo

Você já sabe construir uma sequência de passos desde a Tarefa 10. A diferença aqui é que cada passo agora também nomeia a tática do ATT&CK correspondente (mesma lista de 14 táticas da Tarefa 13). Isso deveria ficar mais fácil se você já tiver feito a Tarefa 13 antes desta.

## Passo 4 — Categorias STRIDE Acionadas conecta de volta às Tarefas 11 e 12

Não invente ameaças STRIDE novas aqui — referencie os IDs que você já escreveu (ex: "EHR-D1" ou o achado de Denial of Service do sistema de Rede na Tarefa 12). Pense: qual das ameaças STRIDE que você já catalogou esse cenário específico realmente aciona?

## Passo 5 — Oportunidades de Detecção é o campo que mais precisa de pensamento original

Diferente de "Pontos de Ruptura" da Tarefa 10 (que é sobre interromper o ataque), aqui o foco é sobre **detectar** — nem sempre a mesma coisa. Pergunte-se: em qual passo o comportamento do atacante deixaria um rastro observável (log incomum, tráfego de rede anormal, horário de acesso estranho) que uma ferramenta de monitoramento poderia pegar, mesmo que o ataque não seja bloqueado naquele momento?

## Onde entregar

O arquivo final vai como `14-threat_scenarios.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
