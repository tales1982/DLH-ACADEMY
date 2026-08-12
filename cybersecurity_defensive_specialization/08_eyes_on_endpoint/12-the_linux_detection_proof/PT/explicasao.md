# O que você precisa fazer

Esse script é o par Linux do `10-windows_detection_proof.ps1`: para cada ação de `linux_attack_log.json` (a verdade fundamental da Tarefa 11), ele abre uma janela de 30 segundos ao redor do timestamp e pergunta às fontes de telemetria "você viu isso?". O objetivo não é confirmar que a chave existe em `meddefense.rules` — é confirmar que o `ausearch` de fato consegue produzir um evento correspondente.

## Passo 1 — O parser de timestamp tem que lidar com dois formatos de syslog, e um deles tem uma pegadinha de ordem

A função `to_epoch` primeiro testa se o timestamp já está em ISO-8601 (regex `^[0-9]{4}-[0-9]{2}-[0-9]{2}T...`). Se não estiver, cai no formato clássico `"Mon DD HH:MM:SS"` do syslog, que não carrega ano nem timezone. O comentário no código é explícito sobre uma armadilha real: o parser do GNU `date` aceita o ano DEPOIS do resto da string (`"Mon DD HH:MM:SS YYYY"`), mas rejeita silenciosamente se você colocar o ano na frente (`"YYYY Mon DD HH:MM:SS"`). Um erro de ordem ali faria todo timestamp clássico do syslog cair para epoch 0 sem aviso nenhum — por isso o script monta `"${raw:0:15} $CURRENT_YEAR"` nessa ordem específica.

## Passo 2 — `ausearch` neste sistema só aceita data em formato de 2 dígitos, e isso não é comportamento documentado

A função `check_auditd` converte os limites da janela para `%m/%d/%y` (2 dígitos de ano) em vez do formato ISO mais óbvio de 4 dígitos, porque nesse alvo o `ausearch -ts/-te` rejeita ano de 4 dígitos com erro (`"Error parsing start date"`). O comentário no script é honesto sobre isso: é uma característica de build/locale específica desse sistema, não uma regra geral do `ausearch` — mas é o que funciona aqui, então é isso que o script usa.

## Passo 3 — `--input-logs` e o filtro por `type=SYSCALL` existem para evitar falso positivo por agrupamento de evento

`ausearch -k` agrupa registros pelo mesmo ID de evento do audit. Se o script aceitasse qualquer linha retornada, um registro `CONFIG_CHANGE` (ex: `op=add_rule`, de um recarregamento de regra) que por acaso caiu dentro da janela de 30 segundos da ação poderia ser contado como "captura" mesmo sem ter nada a ver com a ação simulada. Por isso `check_auditd` filtra estritamente por `grep -c "^type=SYSCALL.*key=\"$key\""` — só conta registros SYSCALL que carregam exatamente essa chave. `--input-logs` força leitura direta do log em disco porque, em alguns builds, o caminho de consulta padrão do `ausearch` silenciosamente não retorna nada mesmo com o evento presente.

## Passo 4 — auth.log só é checado para uma ação específica, e a comparação usa o texto puro em vez de regex

O bloco de `check_auth_log` só roda quando `$desc` começa com `"Creating user"` — é a única ação do conjunto onde auth.log é uma fonte secundária relevante (via `useradd`/PAM). A função usa `grep -F` (busca literal, não regex) porque o padrão buscado (`"new user"`) é um texto fixo, e comparar timestamp linha a linha com `to_epoch` dentro da janela evita depender de `grep` com contexto de data. Isso é o que gera as linhas com `Multi-source: 1` no resumo final — a criação de usuário é a única ação capturada tanto por `auditd` quanto por `auth.log`.

## Passo 5 — `key_fields_for` documenta a intenção de cada regra de auditoria, não só o nome da chave

A função mapeia cada `audit_key` para os campos brutos relevantes: `comm`/`exe` para a regra de execve (`process_exec`), `saddr` para a regra de socket/connect (`network_connect`), `username` para `useradd`, e o par `name`/`nametype` como padrão para as regras `-w` (watch) como `identity`, `sudoers`, `cron_persist`. Isso espelha a extração de `field1`/`field2` que a Tarefa 7 (`7-linux_export.sh`) já fazia — a matriz de detecção documenta não só que a ação foi vista, mas quais campos brutos confirmam que foi vista corretamente.

## Onde entregar

O arquivo final vai como `12-linux_detection_proof.sh` (mais `linux_detection_matrix.json` gerado), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
