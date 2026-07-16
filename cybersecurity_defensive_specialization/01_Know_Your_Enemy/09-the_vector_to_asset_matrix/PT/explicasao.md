# O que você precisa fazer

Essa é a tarefa mais "mecânica" do projeto até aqui, mas o valor está em preencher com caminhos reais, não frases genéricas. Você está construindo literalmente uma tabela 8×7 (56 células possíveis) e precisa preencher pelo menos 20 com um caminho de ataque coerente de uma frase.

## Passo 1 — Defina as 7 colunas antes de tocar nas linhas

Volte na Tarefa 8 do 1x00 e confirme quais são exatamente seus Top 5 Ativos Críticos. Junte Medical IoT e Active Directory como as colunas 6 e 7. Escreva essa lista de 7 no topo da sua tabela antes de começar — evita inconsistência de nomeação ao longo do exercício.

## Passo 2 — Cada célula segue o mesmo formato do exemplo

"[Vetor] → [o que o atacante ganha] → [como isso se propaga] → [ponto de exposição técnico] → [ativo/dado final]." Não precisa ter exatamente 5 elos como o exemplo, mas precisa mostrar uma progressão, não só "Phishing pode afetar o EHR" (isso é afirmação, não caminho).

## Passo 3 — É normal e esperado ter células vazias

Nem todo vetor alcança todo ativo de forma plausível. Acesso Físico provavelmente não tem um caminho direto pra Active Directory a menos que você conecte via um passo intermediário (ex: acesso físico a um workstation que já está logado). Se você não consegue justificar o caminho em uma frase coerente, deixe vazio — é melhor que uma célula forçada e sem sentido.

## Passo 4 — Use os vetores que você já analisou nas Tarefas 4, 5 e 8

Você não está inventando vetores novos aqui — está reaplicando: Phishing e Acesso Físico vêm da Tarefa 4; Comprometimento de Cadeia de Suprimentos vem da Tarefa 5; Credenciais Padrão, Exploração de Software Vulnerável e Exploração de VPN vêm da Tarefa 8. Isso deveria acelerar bastante o preenchimento, já que você já pensou nesses caminhos individualmente antes.

## Passo 5 — "Mais conectado" e "mais versátil" são contagens simples

Depois de preencher a matriz, literalmente conte quantas células preenchidas cada coluna tem (ativo) e quantas cada linha tem (vetor). Os 3 maiores números em cada eixo são suas respostas — não precisa adivinhar, é aritmética sobre o que você mesmo preencheu.

## Onde entregar

O arquivo final vai como `9-vector_asset_matrix.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
