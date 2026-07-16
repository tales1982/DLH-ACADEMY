# O que você precisa fazer

Esse é o exercício que **junta tudo**. Você já fez uma análise de lacunas parecida no Task 5 — mas aquela era baseada só na Matriz de Controles do Task 4. Agora você vai refazer o mesmo tipo de raciocínio, só que cruzando com **criticidade** (Task 8) e **classificação de dado** (Task 9) — o que muda completamente a prioridade de cada lacuna.

## Passo 1 — Você não está começando do zero

Muitas das lacunas que você já encontrou no Task 5 continuam válidas como matéria-prima:
- Nenhum controle Compensatório na categoria Técnica
- Nenhum alerta automático sobre os logs
- Backup nunca testado com DR completo
- Antivírus não cobre nenhum servidor
- Categoria Administrativa só tem controles Preventivos
- Câmeras não cobrem sala de servidores/armário de rede

A diferença agora é que você precisa **reclassificar** cada uma dessas usando a fórmula nova, que depende de dados que você não tinha no Task 5 (criticidade do Task 8, classificação do Task 9).

## Passo 2 — Decifrando as Regras de Priorização (a parte mais confusa do exercício)

Preste muita atenção nos conectivos **E** / **OU** — eles mudam tudo:

- **Crítico** exige as DUAS coisas ao mesmo tempo: (ativo Crítico OU dado Restrito) **E** (sem controle detectivo nem corretivo). Se o ativo é crítico mas já existe um controle detectivo cobrindo ele, a lacuna **não** é Crítica — cai pra um nível abaixo.
- **Alto** também exige as DUAS coisas: (ativo Alto OU dado Confidencial) **E** cobertura incompleta.
- **Médio** só exige UMA das duas coisas (ativo Médio, OU controle parcial que não elimina o risco).
- **Baixo** de novo exige as DUAS: ativo Baixo **E** já existe alguma medida compensatória parcial.

Teste rápido pra aplicar em cada lacuna: primeiro pergunte "qual é a criticidade do ativo/dado envolvido?" (isso vem do Task 8/9). Depois pergunte "que tipo de controle existe hoje, e falta o quê?" (isso vem do Task 10). Só depois de responder as duas é que você escolhe o nível, seguindo a regra exata.

## Passo 3 — Exemplo de como recalibrar uma lacuna do Task 5

Pegue a lacuna do Task 5 sobre o antivírus não cobrir servidores. No Task 5, você já sabia que isso era um problema. Agora pergunte: os servidores sem antivírus (`ehr-srv-01`, `billing-srv-01` etc.) são Críticos na sua Matriz do Task 8? Quase certamente sim. E existe algum controle detectivo cobrindo esses mesmos servidores hoje (mesmo que não seja antivírus — pode ser log, pode ser outra coisa)? Se a resposta for "não, nenhum", essa lacuna vira **Crítica** pela regra. Se existir algum controle detectivo parcial (ex: log de SSH do `ehr-srv-01`, que você documentou no Task 4), pode ser que ela caia pra **Alto** em vez de Crítico — dependendo de como você interpreta "sem controle detectivo".

## Passo 4 — De onde tirar as 10+ lacunas

Você não precisa inventar tudo do zero. Combine:
- As lacunas reaproveitadas do Task 5 (recalibradas)
- As lacunas de proteção de dado que você documentou no Task 9 (cada uma pode virar uma lacuna formal aqui)
- Os 3 sistemas Shadow IT do Task 11 — cada um é, por definição, uma lacuna (nenhum controle cobre um sistema não gerenciado)

## Passo 5 — O Resumo de Distribuição

As 3 perguntas finais são puramente analíticas sobre a sua própria lista — depois de classificar as 10+ lacunas, é só contar: quantas em cada nível, quais categorias de ativo aparecem mais, e se tem um padrão (ex: "a maioria das lacunas Críticas são por falta de controle Detectivo" — que inclusive bate com o padrão que você já percebeu lá no Task 5).

## Onde entregar

O arquivo final vai como `12-gap_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`. Mínimo de 10 lacunas.
