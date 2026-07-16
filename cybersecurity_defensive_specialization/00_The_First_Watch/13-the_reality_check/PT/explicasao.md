# O que você precisa fazer

Esse exercício testa se a sua Análise de Lacunas (Task 12) é boa o suficiente pra prever ataques reais, não só ataques hipotéticos. Você vai ler 3 casos reais e anonimizados de violações em hospitais, e cruzar cada um contra o que você já documentou.

## Passo 1 — Como ler cada violação (a mesma disciplina de sempre)

Pra cada uma das 3 violações, separe **causa** (vetor de ataque, fragilidade explorada) de **efeito** (o que aconteceu depois) — é a mesma lógica de "causa vs. efeito" que você já praticou desde o Task 1. O enunciado quer só a causa nessa primeira parte: como o atacante entrou, e o que ele encontrou de fraco pra explorar.

## Passo 2 — A Correlação com a MedDefense é um exercício de "isso já aconteceu com a gente?"

Depois de identificar o vetor de ataque de cada violação real, volte na sua lista de Gap IDs do Task 12 e pergunte: **"se esse mesmo ataque acontecesse aqui, que lacuna já documentada teria deixado passar?"** Isso não é adivinhação — é bem provável que padrões comuns de violação em hospitais (phishing, credenciais fracas, dispositivo médico exposto, backup comprometido junto com o primário) já apareçam de alguma forma na sua lista, já que você mapeou exatamente esses temas nos Tasks 5 e 12.

## Passo 3 — A Checagem de Ponto Cego é a parte mais valiosa

Essa é a pergunta que realmente separa um bom analista: **"o que esse caso real me mostra que eu não pensei sozinho?"** Não force uma resposta artificial — se a violação real realmente não revelar nada novo (porque você já cobriu aquele padrão), é perfeitamente válido dizer isso e apontar qual Gap ID já cobre o caso. Mas se aparecer algo genuinamente novo (um tipo de ataque, um vetor, uma fragilidade que você nunca considerou), documente como uma lacuna nova, no mesmo formato completo do Task 12 — com ID novo, criticidade, justificativa, tudo.

## Passo 4 — Reavaliação de Prioridade

Só porque uma lacuna já existia na sua lista não significa que a prioridade dela estava certa. Se um dos 3 casos reais mostrar que um tipo de ataque específico é **muito mais comum ou muito mais devastador** do que você imaginou, isso é motivo legítimo pra subir a criticidade de uma lacuna correspondente — mesmo sem nenhum fato novo sobre a MedDefense em si. Isso é o que "validar contra o mundo real" significa na prática: ajustar sua régua de risco com base em evidência externa, não só na sua intuição interna.

## Passo 5 — Análise de Padrão final

Pergunte: dos 3 casos, existe algum fio condutor comum (ex: todos começam com phishing, ou todos envolvem um fornecedor terceirizado, ou todos aproveitam falta de segmentação)? Se um padrão aparecer nos 3 casos reais **e** também for uma das suas lacunas mais críticas do Task 12, isso é a evidência mais forte possível de que aquele deveria ser o foco nº 1 do orçamento de segurança.

## Onde entregar

O arquivo final vai como `13-reality_check.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.

---

O arquivo `healthcare-breach-summaries.txt` ainda não foi fornecido. Assim que você tiver esse conteúdo, me manda que eu crio a evidência (igual fizemos nos Tasks 2, 4 e 7) e começamos a correlacionar juntos.
