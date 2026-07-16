# O que você precisa fazer

Diferente das tarefas anteriores, aqui você não está analisando o presente da MedDefense — está projetando o futuro. Cada cenário muda uma variável de negócio, e você precisa rastrear como essa mudança se propaga por todo o modelo de ameaça que você já construiu.

## Passo 1 — Pense em "o que esse cenário adiciona ao Registro de Ativos"

Antes de responder qualquer pergunta, pergunte-se: se esse cenário fosse real, o que mudaria no Registro de Ativos do 1x00? Novo servidor? Novo tipo de dado (dados de pesquisa clínica valem mais que dados de faturamento pra certos atores)? Novo terceiro com acesso (a universidade, os 3 institutos internacionais, a MedTech como provedor de nuvem)? Essa é a base de tudo que vem depois.

## Passo 2 — Novos Atores: pense em quem lucraria especificamente com ESSA mudança

Não repita os mesmos 6 tipos de ator genericamente em todo cenário. Cada mudança atrai um perfil diferente:
- Dados de pesquisa proprietários + parceria internacional → pense em quem tem interesse em propriedade intelectual, não só em dados de paciente pra fraude.
- Migração pra nuvem → o atacante não muda de tipo necessariamente, mas o alvo do ataque muda (agora é a MedTech, o provedor, não mais o servidor local).
- Cobertura de mídia sobre um incidente passado → pense em quem age *depois* que uma organização já demonstrou ser vulnerável e está sob os olhos do público (isso atrai um perfil bem diferente de quem ataca silenciosamente).

## Passo 3 — Vetores Alterados: pense em "abre" versus "fecha"

Cada mudança tanto fecha vetores antigos quanto abre novos. No Cenário B, por exemplo, o vetor "acesso físico ao servidor local" desaparece — mas o que aparece no lugar? No Cenário C, nenhum sistema técnico muda, mas um vetor comportamental fica mais atraente (pense em quem se aproveitaria de pacientes preocupados, ou de fazer a MedDefense parecer um alvo fácil pra outros atacantes).

## Passo 4 — Prioridades Deslocadas exige que você volte no T16 de verdade

Não invente uma reordenação genérica. Pegue o Top 5 real que você produziu na Tarefa 16 e, pra cada cenário, decida especificamente quais dessas 5 ameaças sobem, quais descem, e se alguma nova ameaça deveria entrar no Top 5 por causa do cenário.

## Passo 5 — A Avaliação Líquida é uma frase, não um parágrafo

Force-se a resumir num veredito direto: aumenta, diminui, ou muda de forma (mesmo risco total, mas espalhado diferente). O Cenário B é o mais interessante nesse sentido — pense se ele necessariamente aumenta o risco, ou se ele só *transfere* onde o risco mora.

## Onde entregar

O arquivo final vai como `17-threat_evolution.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
