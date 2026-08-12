# O que você precisa fazer

Esse script é puramente de leitura: ele não configura nada, só descobre o que já existe no sistema e documenta isso em texto e em `log_source_map.json`. O valor está em derivar cada campo (rotação, taxa de eventos, status) de dados reais do host, em vez de assumir valores fixos.

## Passo 1 — A política de rotação vem de ler a configuração do logrotate de verdade, não de um valor chutado

`get_rotation_days` faz `grep -rl -F -- "$target" /etc/logrotate.d/ /etc/logrotate.conf` para achar o stanza que referencia aquele caminho específico, identifica o intervalo (`daily`/`weekly`/`monthly`/`yearly`, cada um virando `interval_days`) e multiplica pelo `rotate N` daquele stanza para chegar numa retenção aproximada em dias. Quando nenhuma config referencia o caminho — o caso típico de `audit.log`, que o `auditd.conf` costuma rotacionar sozinho, sem passar pelo logrotate — a função retorna a string `"unmanaged"` em vez de inventar um número.

## Passo 2 — A taxa de eventos por hora é estimada a partir dos timestamps reais do próprio arquivo, com um fallback deliberadamente mais grosseiro

`estimate_events_per_hour` tenta calcular o intervalo real coberto pelo arquivo: para `audit.log`, extrai o epoch embutido no padrão `audit(NNNNNNNNNN.` da primeira e da última linha; para os demais, tenta interpretar os 15 primeiros caracteres da linha como data no estilo syslog (`Mon DD HH:MM:SS`). Se conseguir os dois epochs, divide `total_linhas / horas_decorridas`. Só quando isso falha (arquivo sem timestamp reconhecível) é que cai no fallback `total/24` — uma estimativa mais grosseira assumindo um dia inteiro de janela, mas ainda uma estimativa real, não um placeholder.

## Passo 3 — "Ausente" e "presente mas silencioso" são dois problemas diferentes, e o script os distingue

Um arquivo que não existe (`[ ! -f "$path" ]`) incrementa `MISSING` e aparece com `Format`/`Rotation` mas sem dado real. Um arquivo que existe mas cuja `estimate_events_per_hour` deu zero linhas incrementa um contador separado, `INACTIVE`, e ganha a nota `[INACTIVE - not generating events]` na saída. A distinção importa porque a remediação é diferente: um arquivo ausente pode significar que o serviço nem está instalado; um arquivo presente e vazio geralmente significa que o daemon que deveria escrever nele está com problema — é um sintoma de falha silenciosa de telemetria, não de configuração ausente.

## Passo 4 — Fontes "obrigatórias" e fontes "extras" são tratadas com regras de contagem diferentes

A lista fixa em `$SOURCES` (auth.log, audit.log, syslog, kern.log, apache2 access/error, dpkg.log) é sempre reportada, mesmo quando o arquivo não existe — e nesse caso soma para `MISSING`. Já `$EXTRA_SOURCES` (ufw.log, fail2ban.log) só entra no inventário se o arquivo realmente existir (`[ -f "$path" ] || continue`); se não existir, ela simplesmente não aparece e não conta como "missing", porque não é uma fonte que este host necessariamente deveria ter. No JSON final isso vira dois arrays separados: `required_sources` e `additional_sources_discovered`.

## Onde entregar

O arquivo final vai como `6-log_source_map.sh` (que gera `log_source_map.json`), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
