# O que você precisa fazer

Essa é a tarefa mais estruturalmente rígida do projeto: 6 categorias fixas (STRIDE), pelo menos 2 ameaças específicas em cada uma, focadas num único sistema (o EHR). O risco aqui é escrever ameaças genéricas que poderiam se aplicar a qualquer sistema de qualquer empresa — o exercício exige o oposto.

## Passo 1 — Memorize o que cada letra realmente pergunta

- **S (Spoofing):** alguém consegue se passar por outra pessoa ou sistema? (ex: um usuário se autentica como outro; um servidor falso finge ser o `ehr-srv-01`)
- **T (Tampering):** alguém consegue alterar dados ou código sem permissão? (ex: alterar um registro de prescrição no banco)
- **R (Repudiation):** alguém consegue negar que fez uma ação, por falta de rastro? (ex: sem logs de auditoria, ninguém prova quem acessou um prontuário)
- **I (Information Disclosure):** dado sensível vaza pra quem não deveria ver? (ex: dados em trânsito sem criptografia)
- **D (Denial of Service):** o sistema fica indisponível quando deveria estar disponível? (ex: um ataque de ransomware travando o `ehr-srv-01`)
- **E (Elevation of Privilege):** alguém ganha mais acesso do que deveria ter? (ex: um usuário comum conseguindo permissões de administrador do banco)

## Passo 2 — "Específico da MedDefense" significa nomear o componente exato

Não escreva "um atacante pode adulterar dados" — escreva qual componente (aplicação, banco, estação clínica, rede entre eles) e como especificamente, usando o que você já sabe da arquitetura do 1x00 (ex: PostgreSQL sem criptografia em repouso, ou rede plana permitindo interceptação entre estação e servidor).

## Passo 3 — Vetor de Ataque conecta de volta pra Tarefa 8

Você já catalogou 6 categorias de vetor técnico na Tarefa 8. Reuse-as aqui: uma ameaça de Elevação de Privilégio no EHR provavelmente se conecta a "Credenciais Padrão" ou "Rede Insegura" da Tarefa 8. Não invente vetores novos do zero.

## Passo 4 — Controle Existente vs. Gap é um "ou exclusivo"

Cada ameaça deveria ter OU um Controle Existente (algo do 1x00 que já mitiga, mesmo que parcialmente) OU um Gap (nada mitiga isso hoje) — raramente os dois ao mesmo tempo. Se você está com dificuldade de encontrar um controle real do 1x00, é bem provável que a resposta correta seja "não há controle, ver GAP-XXX."

## Passo 5 — O Resumo final exige comparação entre as 6 categorias, não só descrição de uma

Depois de escrever as 12+ ameaças, releia todas e pergunte: qual categoria tem as consequências mais graves *especificamente num hospital* (pense em segurança do paciente, não só em dado)? Denial of Service, por exemplo, costuma ser argumentável como o mais grave num contexto clínico, porque afeta diretamente o cuidado em tempo real — mas defenda sua escolha com as ameaças específicas que você mesmo escreveu.

## Onde entregar

O arquivo final vai como `11-stride_ehr.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
