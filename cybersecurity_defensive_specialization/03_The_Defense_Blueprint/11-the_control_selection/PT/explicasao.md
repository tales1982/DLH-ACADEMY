# O que você precisa fazer

Essa tarefa pega os 10 riscos do seu Registro (Tarefa 10) e força você a formalizar cada "controle planejado" (que você já esboçou lá) num formato de rastreabilidade completo — o tipo de detalhe que um auditor de verdade pediria pra ver.

## Passo 1 — Não invente controles novos — formalize os que você já escolheu na Tarefa 10

Você já tem um campo "Controle(s) Planejado(s)" pra cada um dos 10 riscos. O trabalho aqui não é escolher controles diferentes — é pegar cada um desses e adicionar os detalhes de mapeamento (CIS Control específico com número de salvaguarda, função do NIST CSF, tipo e categoria) que a Tarefa 10 não pedia.

## Passo 2 — Nem todo risco vai ter um mapeamento CIS Control limpo — seja honesto quando não tiver

Pelo menos um dos seus 10 riscos é uma decisão organizacional/de governança, não uma salvaguarda técnica (pense em qual). Pra esse, não force um número de CIS Control que não se aplica de verdade — explique por que o mapeamento tradicional não cobre esse tipo de risco, e use o NIST CSF (que tem uma função inteira dedicada a governança) como a referência principal em vez disso.

## Passo 3 — Tipo de Controle e Categoria são duas perguntas diferentes — não misture

"Tipo" pergunta QUANDO o controle age (antes do incidente = Preventivo, durante/depois = Detectivo ou Corretivo, ou Compensatório se ele reduz o risco sem eliminar a causa raiz). "Categoria" pergunta COMO o controle é implementado (tecnologia, política/processo, procedimento operacional, ou barreira física). Um mesmo controle pode ter uma resposta clara pra cada pergunta — não deixe as duas colunas com a mesma lógica.

## Passo 4 — Preste atenção especial em controles COMPARTILHADOS entre riscos diferentes

Alguns dos seus riscos vão precisar do MESMO controle (por exemplo, mais de um risco pode depender do MFA, ou mais de um pode depender da segmentação de rede). Quando isso acontecer, não conte o custo desse controle duas vezes — diga explicitamente que o custo já foi contado em outro risco, e aqui você está apenas descrevendo o benefício adicional.

## Passo 5 — O Mapa de Dependência é sobre ORDEM, não sobre prioridade

Não confunda "isso é mais importante" com "isso precisa vir primeiro." Um controle barato e de baixa prioridade pode ainda assim ser um pré-requisito técnico literal pra outro controle funcionar (por exemplo, você não consegue monitorar uma rede que ainda não foi organizada em zonas). Organize seu mapa por dependência técnica real, camada por camada — o que pode começar imediatamente, o que precisa esperar algo específico acontecer primeiro.

## Onde entregar

O arquivo final vai como `11-control_selection.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. Os controles selecionados pra cada um dos 10 riscos, mais o Mapa de Dependência de Controles.
