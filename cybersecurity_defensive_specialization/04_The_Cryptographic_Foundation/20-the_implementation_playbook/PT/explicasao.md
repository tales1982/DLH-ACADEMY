# O que você precisa fazer

Essa é a última tarefa do bloco inteiro, e ela pede um tipo de documento diferente de tudo que você escreveu até agora: não é análise, é um manual operacional que alguém vai literalmente seguir passo a passo numa manutenção real.

## Passo 1 — Escolha as 5 ações a partir da sua própria Auditoria de Postura (Tarefa 15), não do zero

Você já tem, de uma tarefa anterior deste mesmo bloco, uma lista inteira de achados com prioridade classificada como "Imediata". Vá lá primeiro e escolha as 5 mudanças de prioridade Imediata que, juntas, cobrem sistemas diferentes (banco de dados de pacientes, faturamento, imagens médicas, backup, credenciais de domínio) — evite escolher 5 ações que afetam só um único sistema, já que o valor do playbook está em mostrar amplitude.

## Passo 2 — Cada "Passo" precisa ser executável por alguém que não participou desta análise

Pense em Sarah Park (ou um técnico de TI dela) lendo isso numa segunda de manhã, sem o contexto que você tem agora. Um passo como "configure o TLS corretamente" não serve — precisa ser específico o bastante pra ser seguido literalmente (qual arquivo editar, qual comando rodar, qual configuração mudar). Reaproveite comandos e procedimentos reais que você já validou em tarefas anteriores deste bloco sempre que possível, em vez de inventar sintaxe nova.

## Passo 3 — "Validação" precisa provar DUAS coisas diferentes, não uma só

Repare que o enunciado pede validação de que a mudança funcionou E validação de que nada quebrou. Essas são perguntas diferentes — uma mudança pode estar tecnicamente correta e ainda assim ter causado uma interrupção em outro lugar. Escreva um critério de validação pra cada uma dessas duas perguntas separadamente.

## Passo 4 — No Rollback, pense no pior cenário realista, não no cenário ideal

"Tempo máximo de inatividade aceitável antes do rollback ser acionado" é uma pergunta de julgamento de negócio, não só técnica — um sistema que afeta diretamente o cuidado do paciente (como o banco de dados do EHR) deveria ter uma tolerância bem menor a tempo de inatividade do que um sistema de bastidor (como o armazenamento de backup). Varie esse número de forma justificada entre as suas 5 ações, em vez de usar o mesmo valor genérico pra todas.

## Passo 5 — "Janela de Manutenção" e "Comunicação" não são detalhes de rodapé — pense neles com a mesma seriedade que os passos técnicos

Uma mudança que afeta autenticação de domínio inteira precisa de uma janela e um aviso bem diferentes de uma mudança que afeta só um servidor de faturamento. Pense em quem realisticamente seria afetado por cada mudança específica (departamentos clínicos? só a equipe de TI? o CISO adjunto?) e ajuste a comunicação de acordo, usando a estrutura de papéis que você já tem de um projeto anterior (1x03).

## Passo 6 — A ação mais operacionalmente complexa das 5 provavelmente precisa de uma janela maior que as outras

Pense em qual das suas 5 ações envolve mais do que só mudar uma configuração — por exemplo, migrar dados de um armazenamento pra outro é uma operação bem mais longa e arriscada do que ativar uma linha de configuração TLS. Reflita essa diferença real na sua escolha de janela de manutenção (durante o expediente, durante a madrugada, ou um fim de semana inteiro) pra cada ação.

## Onde entregar

O arquivo final vai como `22-implementation_playbook.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
