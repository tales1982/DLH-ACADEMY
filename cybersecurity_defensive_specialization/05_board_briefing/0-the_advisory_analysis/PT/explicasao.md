# O que você precisa fazer

Essa tarefa é sobre conectar um alerta genérico da CISA com a realidade específica da MedDefense. O trabalho real não é resumir o alerta — é fazer a ponte entre "isso acontece com hospitais" e "isso acontece com A GENTE, nesse servidor, por causa dessa vulnerabilidade que já apareceu antes".

## Passo 1 — Não invente achados novos, reaproveite os que você já tem

Repare que o template pede referências ao 1x00, 1x02, 1x03 e 1x04. Isso é intencional: você não deve criar vulnerabilidades ou gaps do nada. Volte nos seus próprios documentos anteriores e ache o finding, o gap ID ou a fraqueza criptográfica que já existia e que se encaixa em cada fase. Se para alguma fase você não achar nada nos projetos anteriores, isso também é uma informação válida — significa que ninguém tinha mapeado esse risco antes.

## Passo 2 — Cada fase tem uma pergunta binária escondida

Para cada uma das 7 fases, a pergunta real é: "existe algum controle funcionando HOJE que pararia isso?" Não é sobre o que está planejado, é sobre o que está implantado e funcionando agora. Se o controle está desenhado na estratégia (1x03) mas não foi implementado, o veredito não pode ser "Protegido".

## Passo 3 — Pense no "Verdict" com rigor

"Parcialmente Protegido" não é uma categoria de escape para quando você não tem certeza. Use-a apenas quando existe um controle real que reduz o impacto ou dificulta a fase, mas não a bloqueia completamente. Se não existe nenhum controle, é "Exposto" — mesmo que pareça duro admitir isso em 5 das 7 fases.

## Passo 4 — A pontuação de exposição é o argumento, não um detalhe

X/7 é o número que vai para a manchete da reunião com a diretoria amanhã de manhã. Calcule com cuidado e seja honesto — subestimar a exposição aqui tem consequência real na cena que a James Chen descreveu.

## Passo 5 — A "Descoberta Crítica" precisa ser acionável em 4 horas

Não escreva algo genérico como "melhorar a segurança". Pense: dentre tudo que está exposto, qual ÚNICA ação, se tomada nas próximas 4 horas, teria o maior efeito de redução de risco? Essa é a frase que você entrega.

## Onde entregar

O arquivo final vai como `0-advisory_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
