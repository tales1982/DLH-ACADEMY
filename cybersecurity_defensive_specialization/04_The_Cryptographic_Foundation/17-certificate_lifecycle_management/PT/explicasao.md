# O que você precisa fazer

Essa tarefa constrói o "programa" que deveria ter existido desde o início, pra que a crise dos "18 dias" nunca mais se repita. É um trabalho de design organizacional, não de execução técnica.

## Passo 1 — No Inventário, seja honesto quando a resposta for "isso não existe hoje"

Não force uma entrada pra cada categoria de certificado listada se a MedDefense genuinamente não tem um certificado pra aquele uso hoje (por exemplo, assinatura de e-mail ou assinatura de código). É mais valioso documentar "isso não existe atualmente" do que inventar um emissor e uma data de expiração fictícios — isso, aliás, É o achado: a ausência de inventário é literalmente o problema que essa tarefa existe pra resolver.

## Passo 2 — Na Estratégia de Renovação Automática, não escolha ACME só porque é "mais moderno"

Pense na causa raiz específica da crise dos 18 dias: foi a escolha do TIPO de certificado (comercial vs. gratuito) que causou o problema, ou foi o PROCESSO de renovação (manual vs. automático)? Sua justificativa deveria deixar claro qual desses dois fatores realmente importa aqui — e o número "800 pacientes por dia" do enunciado é uma pista de que o volume de tráfego, não o custo do certificado, é o argumento mais forte.

## Passo 3 — Pense em quem MERECE ter acesso a monitoramento diferente em cada limiar

Não faça todos os quatro limiares (90/60/30/7 dias) dispararem o mesmo alerta pra as mesmas pessoas. Pensa na escalada: um aviso de 90 dias é informativo; um aviso de 7 dias é uma situação crítica. Quem precisa saber em cada estágio muda de acordo com a urgência — e pra um certificado que já é renovado automaticamente, chegar ao alerta de 7 dias na verdade significa que ALGO JÁ DEU ERRADO antes disso.

## Passo 4 — Nas 5 regras de política, escreva regras que sejam VERIFICÁVEIS, não aspiracionais

Uma regra de política boa é uma que alguém consegue checar objetivamente se está sendo seguida ou não (por exemplo, "todo certificado tem um dono nomeado, registrado antes de ser emitido" é verificável; "a equipe deve se preocupar com segurança de certificados" não é). Revise cada uma das suas 5 regras e pergunte: como eu saberia, concretamente, se essa regra foi violada?

## Passo 5 — Conecte pelo menos uma regra de política a um incidente ou achado real já documentado

Você já tem, de projetos anteriores, um cenário específico envolvendo exposição de chave privada (a questão de múltipla escolha sobre um repositório Git no 1x03). Uma política que responde diretamente a esse tipo de cenário real é mais forte do que uma política genérica sobre "proteger chaves privadas" — mostra que a regra nasceu de uma lição aprendida, não de um checklist copiado.

## Onde entregar

O arquivo final vai como `17-certificate_lifecycle.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
