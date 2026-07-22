# O que você precisa fazer

Esse exercício inverte o instinto natural de "todo achado em vermelho é um problema real". Você vai provar, com evidência técnica, que alguns achados não são o que parecem.

## Passo 1 — A dica já resolve 1 dos 2-3 que você precisa

Releia o relatório de scan procurando por uma nota escrita pela própria SecurePoint dentro de um achado específico, avisando que aquilo *pode* ser falso positivo. Esse é o seu ponto de partida garantido — não precisa "descobrir" esse, só precisa explicar tecnicamente por quê.

## Passo 2 — Os outros exigem que você aplique o que aprendeu nas tarefas anteriores

Pra achar os outros 1-2 falsos positivos, pense em achados onde o próprio relatório já entrega uma pista de que algo não é tão grave quanto parece (por exemplo: um achado onde a descrição inclui uma frase tipo "isso é uma questão operacional, não uma vulnerabilidade de segurança" — releia esse tipo de trecho com atenção). Outra pista: achados numéricos pequenos (segundos, minutos) que soam alarmantes na superfície, mas que — se você souber qual é a tolerância normal de um protocolo como Kerberos ou TLS pra esse tipo de desvio — na prática não chegam nem perto do limiar que causaria um problema real.

## Passo 3 — "Por Que É Um Falso Positivo" precisa de uma explicação técnica, não uma afirmação

Não basta escrever "isso não é um risco real". Explique o mecanismo: qual pré-condição específica precisa existir pra essa vulnerabilidade ser explorável, e por que essa pré-condição é implausível *neste host específico, na função que ele exerce*. Pense no papel de cada servidor (um servidor de backup faz outbound SSH pra sistemas externos com frequência? Um workstation clínico tem motivo pra rodar isso?).

## Passo 4 — Método de Validação precisa ser algo que você realmente faria, não uma frase genérica

"Verificar manualmente" não é um método de validação. Pense em comandos, arquivos de configuração ou logs específicos que confirmariam ou refutariam a hipótese de falso positivo (por exemplo: que arquivo de configuração você abriria? Que comando rodaria? Que log você cruzaria?).

## Passo 5 — Os dois campos de "Risco" têm que ser assimétricos, não espelhados

"Risco de Agir" é sobre desperdício de recursos (tempo, uma janela de manutenção mal utilizada, atenção tirada de um achado que realmente importa). "Risco de Não Validar" é sobre a hipótese oposta: e se você estiver errado sobre ser um FP? Pense em qual cenário específico faria esse achado deixar de ser um falso positivo (por exemplo: e se alguém começar a usar aquele servidor de um jeito diferente do que você assumiu?).

## Passo 6 — A pergunta final conecta com a nota da própria SecurePoint

Releia as notas de metodologia do scan (Task 0) — a SecurePoint já declarou uma taxa de falso positivo típica pra essa configuração do OpenVAS. Use esse número como ponto de partida pra responder quantos falsos positivos você esperaria estatisticamente num relatório de 31 achados, e veja se seu próprio resultado bate com essa expectativa.

## Onde entregar

O arquivo final vai como `11-false_positives.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Pelo menos 2 análises completas de falso positivo, mais o parágrafo final sobre taxa esperada e validação manual.
