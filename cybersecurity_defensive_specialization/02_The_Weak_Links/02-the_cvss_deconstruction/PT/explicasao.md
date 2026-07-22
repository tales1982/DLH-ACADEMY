# O que você precisa fazer

Esse exercício quer que você pare de tratar CVSS como "um número que o scanner me deu" e passe a entender de onde cada dígito vem. São três exercícios, e cada um testa uma habilidade diferente: ler, construir, e comparar.

## Passo 1 — Desconstrução: explique cada letra, não decore o vetor inteiro

Para cada uma das 8 métricas base (AV, AC, PR, UI, S, C, I, A), force-se a responder quatro perguntas na ordem: o que a sigla significa, o que o valor escolhido quer dizer na prática, quais são as outras opções possíveis, e por que — olhando a descrição da vulnerabilidade — esse valor específico faz sentido e não outro. Pule esse último "por quê" e você só terá decorado uma tabela.

Na pergunta final do Exercício 1 (mudar AV de Network pra Local), não adivinhe o número — abra a calculadora, mude só essa uma letra, e veja o resultado. Depois pense: por que só uma letra mudando move a nota tanto assim? A resposta está em como a fórmula do CVSS multiplica os fatores de explorabilidade entre si.

## Passo 2 — Construção: traduza frase por frase antes de montar o vetor

O Exercício 2 te dá 8 frases em português comum (bom senso, sem jargão CVSS). Sua primeira tarefa não é montar o vetor — é mapear, frase por frase, qual métrica CVSS e qual valor cada uma representa. Preste atenção especial na primeira frase ("explorável apenas a partir da rede local, não da internet") — existe uma diferença real entre AV:L (Local, exige acesso à própria máquina) e AV:A (Adjacent, restrito à mesma rede/segmento, mas ainda um ataque de rede). Qual das duas frases da tarefa descreve melhor essa diferença?

Só depois de mapear todas as 8 métricas é que você monta a string e confirma na calculadora.

## Passo 3 — Comparação: isole a variável, não escolha achados aleatórios

O Exercício 3 pede um achado acima de 9.0 e outro entre 5.0 e 7.0. Ao escolher, olhe o relatório com atenção: nem todo achado tem uma nota CVSS explícita (muitos são configuração incorreta, sem vetor). Dos que têm, veja se algum realmente cai nessa faixa de 5.0-7.0 — e se não achar nenhum exato, isso também é uma observação válida pra registrar, ao invés de forçar um achado que não se encaixa.

Depois de escolher os dois vetores, não compare "no geral" — coloque as 8 métricas lado a lado numa tabela e marque quais são iguais e quais são diferentes entre os dois. A resposta de "quais componentes explicam a diferença" fica óbvia quando você vê exatamente onde as métricas divergem.

## Onde entregar

O arquivo final vai como `2-cvss_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Três exercícios completos: Desconstrução, Construção e Comparação.
