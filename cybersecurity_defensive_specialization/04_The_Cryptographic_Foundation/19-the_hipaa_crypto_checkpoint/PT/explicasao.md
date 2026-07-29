# O que você precisa fazer

Essa tarefa te tira do universo puramente técnico por um momento e te coloca no universo de compliance/regulatório — a fonte da verdade aqui não é um comando de terminal, é o texto da própria regulamentação.

## Passo 1 — Pesquise a regulamentação de verdade antes de preencher a tabela

Diferente de quase todas as tarefas anteriores, essa pede citações regulatórias específicas e reais (§164.312 e seus subitens). Não confie só na memória — pesquise o texto real da Regra de Segurança da HIPAA pra confirmar o que cada citação especificamente exige, e — igualmente importante — se aquele item específico é classificado como "obrigatório" (required) ou "endereçável" (addressable). Essa distinção muda como você escreve a coluna "Conforme?".

## Passo 2 — Entenda a diferença entre "endereçável" e "opcional" — elas NÃO são sinônimas

O enunciado já avisa isso: "endereçável" significa que a MedDefense precisa implementar a criptografia especificada OU documentar formalmente por que uma alternativa equivalente está em vigor. Isso é bem diferente de "fazer isso é opcional." Ao preencher "Conforme?", pergunte-se: existe uma alternativa equivalente DOCUMENTADA na MedDefense hoje? Se a resposta for não (nem a proteção especificada, nem uma alternativa documentada), isso ainda é uma lacuna de conformidade.

## Passo 3 — Você não precisa pesquisar o "Estado Atual da MedDefense" — você já documentou isso

Toda a coluna "Estado Atual da MedDefense" já está escrita, espalhada pelas tarefas anteriores deste bloco (principalmente a Tarefa 0 e os achados do 1x02 referenciados nela). Seu trabalho aqui é ir buscar a evidência certa pra cada requisito específico, não redescobrir o estado da MedDefense do zero.

## Passo 4 — A pergunta final do enunciado pede uma opinião profissional fundamentada, não uma resposta "sim/não" seca

"A MedDefense passaria numa auditoria hoje?" não é uma pergunta de sim ou não solto — é uma pergunta que pede que você olhe pra tabela inteira que você acabou de preencher e tire uma conclusão geral. E a segunda parte ("o que o auditor citaria como a deficiência MAIS crítica") pede que você escolha UMA coisa entre várias lacunas reais — pense em qual delas tem o maior volume de dado exposto, e qual delas a MedDefense não tem sequer uma mitigação parcial em vigor.

## Passo 5 — Pense no ângulo "há quanto tempo isso é conhecido" como parte da sua resposta final

Um detalhe que aumenta a gravidade de uma lacuna de conformidade, em auditorias reais, é quando a organização já sabia do problema há um tempo e não agiu — não é a mesma coisa que "acabamos de descobrir isso ontem." Pense em quando, neste projeto, a lacuna mais crítica foi identificada pela primeira vez, e use isso como parte do seu argumento final.

## Onde entregar

O arquivo final vai como `19-hipaa_checkpoint.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
