# O que você precisa fazer

Esse script é o ponto de convergência de quase todo o módulo: ele lê 8 arquivos diferentes (o pacote de entrega da Tarefa 13, as duas matrizes de detecção das Tarefas 10 e 12, os dois relatórios de qualidade, e a matriz de cobertura Sysmon da Tarefa 1) e produz um único JSON de metadados que resume tudo isso para quem só vai ler o resultado, não recomputar nada.

## Passo 1 — `by_source_type` e `by_event_category` juntam os dois arrays de eventos ANTES de agrupar

`jq -s '(.[0].events + .[1].events) | group_by(.source_type) | map({key: .[0].source_type, count: length})'` recebe os dois arquivos (`windows_events.json` e `linux_events.json`) como slurp (`-s`), concatena os arrays `.events` dos dois, e só então agrupa. Isso é importante: se um tipo de fonte (por exemplo `sysmon`) aparecer tanto no Windows quanto — hipoteticamente — em outra plataforma, o agrupamento pós-concatenação garante uma contagem combinada e não duas entradas separadas com o mesmo `key`.

## Passo 2 — A cobertura ATT&CK não é recalculada aqui, é herdada da Tarefa 1 sem reinterpretação

`ATTACK_COVERED`, `ATTACK_PARTIAL` e `ATTACK_BLIND` vêm direto de `.covered_count`, `.partial_count` e `.blind_count` em `sysmon_coverage_matrix.json` — o script não reclassifica nada, só repassa. O array `ATTACK_BY_TECHNIQUE` projeta apenas os campos relevantes (`technique_id`, `technique_name`, `coverage_status`, `enabled_event_ids`) e fixa `source: "Sysmon"` manualmente, porque a matriz de origem (Tarefa 1) é especificamente sobre cobertura via Sysmon — essa tarefa não tenta atribuir cobertura a outras fontes.

## Passo 3 — "Known gaps" é a junção de três listas de origens completamente diferentes, e cada uma explica o gap com um motivo próprio

`GAPS_FROM_ATTACK` pega toda técnica com `coverage_status != "covered"` do Sysmon e usa o `.status_reason`/`.recommendation` que já vêm prontos na matriz. Mas `GAPS_FROM_WINDOWS_MATRIX` e `GAPS_FROM_LINUX_MATRIX` são diferentes: eles filtram `.detection_matrix[] | select(.status == "[MISSED]")` das matrizes de detecção reais (Tarefas 10 e 12) e escrevem um motivo e uma recomendação HARDCODED no próprio jq — por exemplo, para o Linux: `"Review whether the auditd rule for this key watches the syscall/permission actually exercised (e.g. reads are not caught by a write-only -p wa watch)."`. Ou seja, essas duas listas não vêm de um campo pronto em lugar nenhum — o motivo e a recomendação são conhecimento de domínio embutido diretamente neste script sobre por que um `[MISSED]` normalmente acontece em cada plataforma. As três listas são unidas com `jq -s '.[0] + .[1] + .[2]'`.

## Passo 4 — A classificação de confiança tem uma regra de exceção que ignora a média quando existe QUALQUER técnica cega

O cálculo normal seria: `AVERAGE_SCORE = (WINDOWS_SCORE + LINUX_SCORE) / 2`, e daí `good` se `>= 90`, `acceptable` se `>= 70`, senão `poor`. Mas o script primeiro checa `if [ "$ATTACK_BLIND" -gt 0 ]` — se houver pelo menos uma técnica cega (`blind`), a confiança NUNCA pode ser `"good"`, mesmo que a média de qualidade seja 99. Ela fica limitada a `"acceptable"` (ou cai para `"poor"` se a média também for baixa, `< 70`). O comentário do script explica o porquê: "a real, undetected gap outweighs a high average quality score" — uma média alta pode esconder o fato de que uma técnica inteira não tem visibilidade nenhuma, e isso não pode ser arredondado para cima.

## Onde entregar

O arquivo final vai como `14-coverage_assessment.sh` (mais `telemetry_coverage_assessment.json` gerado), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
