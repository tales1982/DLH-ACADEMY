# O que você precisa fazer

Esse exercício é uma **atualização**, não um recomeço. Você já tem os 13 controles do Task 4 — agora precisa: (1) adicionar controles novos que apareceram depois, (2) avaliar quão bem cada um realmente funciona, e (3) montar uma visão focada só nos 5 ativos mais críticos que você elegeu no Task 8.

## Passo 1 — Onde achar os controles "novos" que faltam no Task 4

O Task 4 só olhou pro arquivo de artefatos. Mas você documentou mais controles depois disso, espalhados:

- **Task 3 (observações físicas):** o guarda de segurança e as câmeras já estavam no Task 4 — mas repare que o Task 3 também revelou a **ausência** de controles em certas áreas, não controles novos em si.
- **Task 6 (MRI):** os 3 controles compensatórios que você desenhou (segmentação de rede, processo administrativo de revisão, restrição física + USB) são controles genuínos e **precisam entrar aqui**, já que até agora só existiam no contexto do Task 6.
- **Tasks 8/9 (se você já fez):** se você mencionou alguma proteção existente ao preencher a coluna "Proteção Atual" do Mapa de Dados, isso também vira um controle formal aqui.

## Passo 2 — A coluna nova: Efetividade

Essa é a parte mais interessante do exercício — não é só listar, é **julgar**. Pergunte-se, pra cada controle: ele funciona de verdade, ou só existe no papel? Use os próprios achados que você já fez:

- A política de senha (C-006 do Task 4) — no papel é sólida, mas você já sabe (Task 4/artefato) que MFA não é obrigatório e que existem contas compartilhadas burlando ela. Isso é **Fraca** ou **Adequada**, não **Forte**.
- O backup noturno (C-009) — existe e roda todo dia, mas nunca foi testado um DR completo (achado do Task 5). Isso é **Adequada**, no máximo.
- A regra de firewall "Deny-All" (C-003) — essa realmente é **Forte**: bem configurada, sempre ativa, sem ressalvas conhecidas.

## Passo 3 — A Matriz Resumo com contagem

No Task 4 você só colocava os IDs nas células. Agora, além dos IDs, o enunciado pede a **contagem** e a **efetividade média** de cada célula. Isso é simples aritmética uma vez que você já classificou tudo no Passo 2 — é só agrupar.

## Passo 4 — O Mapa de Cobertura dos Top 5

Aqui você faz um "recorte" da matriz inteira, olhando só pros 5 ativos mais críticos que você definiu no Task 8. Para cada um, percorra a lista de controles e pergunte: algum desses protege especificamente esse ativo? Marque nas colunas certas. Se sobrar uma coluna inteira vazia pra um ativo Crítico (ex: o EHR não tem nenhum controle Detectivo dedicado), isso é um sinal forte de que a Avaliação de Cobertura dele deveria ser **Sub-Protegido** ou pior — mesmo que ele tenha bons controles Preventivos.

## Onde entregar

O arquivo final vai como `10-complete_control_matrix.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.
