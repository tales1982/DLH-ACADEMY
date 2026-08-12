# O que você precisa fazer

Este é o primeiro script do "pipeline final" do módulo: ele pega tudo que os Módulos 3, 7, 9 e 11 já produziram (exports de telemetria e logs de ataque de Windows e Linux) e empacota em `telemetry_handoff/`, o diretório que as Tarefas 14 e 15 vão consumir depois. Se algo sair errado aqui, o erro se propaga para as duas tarefas seguintes.

## Passo 1 — A normalização de timestamp não confia cegamente que os exports já estão corretos

O comentário no script é direto sobre isso: as Tarefas 3 e 7 já deveriam produzir timestamps em `YYYY-MM-DDTHH:MM:SSZ`, mas o script não assume isso. A função `normalize_timestamp` (dentro do jq embutido em `NORMALIZE_JQ`) testa cada timestamp com a regex `^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$`; se não bater, tenta reformatar via `strptime("%Y-%m-%dT%H:%M:%S") | mktime | strftime(...)`, e se isso falhar também, cai para `"1970-01-01T00:00:00Z"` em vez de travar o script inteiro. A lógica é: este é o ponto de consolidação, e um timestamp ruim aqui contaminaria todo o pacote de entrega — por isso vale a pena gastar um `try/catch` por evento.

## Passo 2 — A verificação de consistência de campos usa subtração de conjuntos do jq, não um loop de comparação

Em vez de checar campo por campo, o script calcula `($req - ($e | keys))` para cada evento — isto é, "quais dos 4 campos obrigatórios NÃO estão entre as chaves do evento". Se essa diferença tiver algum elemento, o evento está incompleto. Contar quantos eventos caem nesse caso (`MISSING_WINDOWS`, `MISSING_LINUX`) é mais barato e mais direto em jq do que testar `has("campo")` quatro vezes por evento.

## Passo 3 — O ground truth combinado sobrevive mesmo se um dos dois arquivos de ataque não existir

Note os blocos `if [ -r "$WINDOWS_GROUND_TRUTH" ]` e o equivalente para Linux: se `windows_attack_log.json` ou `linux_attack_log.json` não estiver presente, a variável correspondente (`WIN_TAGGED` / `LINUX_TAGGED`) simplesmente vira `[]` em vez de o script abortar. Isso é diferente do tratamento dado a `WINDOWS_EVENTS`/`LINUX_EVENTS`, que são obrigatórios e derrubam o script com `exit 1` se ausentes — ou seja, o script distingui explicitamente entre entradas que travam a exportação (os eventos) e entradas que apenas reduzem o conteúdo do handoff (o ground truth).

## Passo 4 — Cada ação de ground truth ganha uma tag de plataforma antes de ser combinada

`jq '[.actions[] | . + {platform: "windows"}]'` (e o equivalente `"linux"`) adiciona o campo `platform` a cada ação antes de juntar os dois arrays com `$w + $l`. Sem essa tag, depois de combinar os 12 (6+6) itens em `attack_ground_truth.json`, não haveria como saber de qual SO cada ação veio — e é exatamente essa distinção que a Tarefa 14 usa depois para separar gaps por `impacted_platform`.

## Onde entregar

O arquivo final vai como `13-consolidated_export.sh` (mais o diretório `telemetry_handoff/` que ele gera, com `windows_events.json`, `linux_events.json` e `attack_ground_truth.json`), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
