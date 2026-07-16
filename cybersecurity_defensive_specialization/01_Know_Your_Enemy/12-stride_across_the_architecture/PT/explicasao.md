# O que você precisa fazer

Essa tarefa é a versão "de superfície" da Tarefa 11. Em vez de 2 ameaças profundas por categoria num único sistema, você faz 1 ameaça por categoria (a mais óbvia/crítica) em 3 sistemas diferentes. É triagem, não profundidade.

## Passo 1 — Não repita as ameaças do EHR aqui

O ponto do exercício é cobertura ampla. Se você perceber que está escrevendo praticamente a mesma ameaça de Spoofing que escreveu na Tarefa 11, pare e pense no que é *específico* desse sistema. Active Directory tem uma dinâmica de Spoofing bem diferente do EHR (pense em falsificação de identidade de domínio, não de usuário clínico individual).

## Passo 2 — Use as dicas entre parênteses de cada sistema como ponto de partida direto

O enunciado já te dá pistas fortes pra cada sistema (ex: "credenciais compartilhadas, SO legado" pro PACS). Não ignore essas pistas — elas são literalmente o material que deveria aparecer nas suas 6 linhas da tabela daquele sistema.

## Passo 3 — Severidade não precisa de justificativa longa, mas precisa ser consistente

Use a mesma escala (Crítico/Alto/Médio/Baixo) que você já usou em avaliações de risco no 1x00, e seja consistente entre os 3 sistemas — não classifique tudo como Crítico só pra parecer mais grave. Pense relativamente: dentro desse sistema específico, essa ameaça é a pior das 6 que você listou, ou é uma das mais leves?

## Passo 4 — Active Directory merece atenção redobrada no "E" (Elevação de Privilégio)

Pense no papel único do AD: se alguém eleva privilégio dentro do Active Directory, isso não afeta só um sistema — afeta a autenticação de *tudo*. Isso deveria se refletir tanto na descrição da ameaça quanto na severidade.

## Passo 5 — Ameaça Principal por sistema é uma escolha entre as 6 que você mesmo escreveu

Não precisa ser sempre a mesma letra STRIDE nos 3 sistemas. Pra Infraestrutura de Rede, por exemplo, pense se Denial of Service (o FortiGate sendo o único ponto de falha) não é mais crítico do que Spoofing nesse contexto específico.

## Onde entregar

O arquivo final vai como `12-stride_architecture.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
