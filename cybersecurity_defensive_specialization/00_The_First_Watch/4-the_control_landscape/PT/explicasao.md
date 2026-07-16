# O que você precisa fazer

Diferente dos exercícios anteriores (que focavam no que está errado), este é o oposto: documentar **o que a MedDefense já tem funcionando**. Você vai receber um arquivo (`meddefense-controls-artifacts.txt`) com trechos reais de configuração, políticas e contratos, e precisa extrair no mínimo **12 controles de segurança** distintos, classificando cada um em dois eixos ao mesmo tempo.

## Passo 1 — Entenda os dois eixos (não são a mesma pergunta)

- **Categoria** responde: *"do que esse controle é feito?"* — tecnologia (Técnico), regra/processo/pessoa (Administrativo), ou algo físico (Físico).
- **Função** responde: *"o que esse controle faz, na linha do tempo de um incidente?"* — impede antes de acontecer (Preventivo), percebe durante/depois (Detectivo), conserta depois (Corretivo), desencoraja a tentativa (Dissuasório), ou é um substituto usado quando o controle ideal não é possível (Compensatório).

Um controle sempre tem **uma Categoria e uma Função ao mesmo tempo** — por isso a matriz final é uma tabela cruzando as duas. Ex: um firewall é Técnico + Preventivo. Um guarda de segurança na porta é Físico + Preventivo (e também um pouco Dissuasório, só a presença dele já desencoraja).

## Passo 2 — Truque para não confundir Preventivo com Detectivo

Pergunte: **"isso impede o incidente de acontecer, ou só avisa que ele está acontecendo/aconteceu?"**

- Bloquear tráfego = Preventivo (o ataque nem chega a acontecer).
- Gerar um alerta/log quando algo suspeito acontece = Detectivo (o ataque já está rolando ou já rolou, e isso só avisa).
- Restaurar algo que quebrou = Corretivo (o incidente já aconteceu e passou; isso conserta o estrago).

## Passo 3 — Dissuasório x Preventivo (outra confusão comum)

Os dois "impedem" o ataque, mas de formas diferentes:

- **Preventivo** impede *tecnicamente* — mesmo que o atacante tente, ele não consegue.
- **Dissuasório** impede *psicologicamente* — o atacante consegue tecnicamente, mas desiste porque tem medo de ser pego (uma câmera visível, uma placa de aviso, um cartaz "monitorado 24h").

Se o controle bloqueia de verdade, é Preventivo. Se ele só faz o atacante pensar duas vezes, é Dissuasório.

## Passo 4 — Compensatório é sempre uma resposta a uma limitação

Só classifique algo como Compensatório quando o artefato deixar claro que o controle ideal não pôde ser aplicado, e isso é um "plano B". Não force essa categoria em qualquer controle que pareça incomum.

## Passo 5 — Como ler os artefatos quando chegarem

Cada tipo de artefato tende a esconder controles diferentes:

- **Regras de firewall** → quase sempre Técnico + Preventivo (bloqueios) ou Técnico + Detectivo (logging de tráfego).
- **Configuração de SSH** → Técnico, pode ser Preventivo (ex: exigir chave em vez de senha) — mas cuidado, se o artefato mostrar uma configuração *fraca*, isso não é um controle, é uma vulnerabilidade (não conta para o inventário).
- **Política de senha** → Administrativo + Preventivo.
- **Relatório de status de antivírus** → Técnico, pode ser Preventivo (bloqueia malware) e Detectivo (relatório de status é, em si, uma forma de detecção/monitoramento).
- **Configuração de backup** → Técnico + Corretivo.
- **Contrato de segurança física** → Físico, pode ter guarda (Preventivo/Dissuasório) e câmeras (Detectivo).
- **Registros de treinamento** → Administrativo + Preventivo (equipe treinada comete menos erros) — mas também pode ser Detectivo se o treinamento ensinar a reportar incidentes.

## Passo 6 — Preenchendo o formato pedido

Cada controle precisa dos 7 campos do enunciado: ID, Nome, Descrição, Categoria, Função, Ativo(s) Protegido(s), e Fonte (de qual artefato veio). Não pule o campo "Ativo Protegido" — ele é o que conecta o controle de volta à realidade (qual sistema, zona ou dado ele defende).

## Passo 7 — A Matriz Resumo

No final, distribua os IDs dos controles na tabela 3×5 (Categoria × Função). **Células vazias não são um erro seu** — elas são, de propósito, uma lacuna real a ser observada: se não existe nenhum controle Administrativo Corretivo, por exemplo, isso é uma informação útil (o que a MedDefense faria, em termos de processo, se um incidente já tivesse acontecido?).

## Passo 8 — Onde entregar

O arquivo final vai como `4-control_inventory.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.

---

Me manda o conteúdo do `meddefense-controls-artifacts.txt` quando você tiver — aí eu crio o arquivo de evidência (igual fizemos no Task 2) e começamos a identificar os controles juntos.
