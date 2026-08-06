# O que você precisa fazer

Essa tarefa tem quatro sub-problemas independentes dentro do mesmo script: SUID, SGID, arquivos world-writable e opções de montagem. Trate cada um como um bloco separado.

## Passo 1 — A whitelist de SUID/SGID precisa existir de verdade no script, com binários reais do Ubuntu 22.04

Binários como `/usr/bin/sudo`, `/usr/bin/passwd`, `/usr/bin/su`, `/usr/bin/mount`, `/usr/bin/umount`, `/usr/bin/ping`, `/usr/lib/openssh/ssh-keysign` são exemplos de SUID legítimos que vêm de fábrica no Ubuntu. Rode `find / -perm -4000 -type f 2>/dev/null` na sua própria máquina/laboratório para ver a lista real antes de decidir o que colocar na whitelist — não invente nomes de binários que não existem no sistema de teste.

## Passo 2 — "Remover SUID" é literalmente `chmod u-s`, mas documente antes de agir

Antes de rodar `chmod u-s "$binario"`, imprima o caminho e o motivo (não está na whitelist). Isso também te dá a chance de revisar a lista de "não-whitelisted" antes de composição final do script — um erro aqui pode quebrar uma ferramenta legítima do sistema.

## Passo 3 — Arquivos world-writable: "consertar" normalmente significa remover a permissão de escrita para "outros"

`chmod o-w "$arquivo"` é a correção típica. Mas pense: um arquivo world-writable pode ser um comportamento intencional em alguns diretórios (por exemplo, `/tmp` tem o sticky bit para isso). O foco aqui deve ser arquivos FORA de diretórios que legitimamente precisam disso.

## Passo 4 — Opções de montagem exigem editar `/etc/fstab` (ou usar `mount -o remount`) e isso é sensível

Para aplicar `noexec,nosuid,nodev` de forma persistente, você edita a linha correspondente em `/etc/fstab` e depois roda `mount -o remount /tmp` (por exemplo). Tenha cuidado: se `/tmp` já tem outras opções na linha do fstab, você precisa adicionar as novas sem apagar as existentes, não sobrescrever a linha inteira.

## Passo 5 — `/dev/shm` costuma já vir com essas opções, é por isso que o exemplo mostra "[OK]" e não "[APPLIED]" para ele

Preste atenção na diferença entre "[OK]" (já estava certo) e "[APPLIED]" (o script mudou algo) no output esperado — seu script precisa checar o estado atual antes de decidir qual das duas etiquetas imprimir, não aplicar cegamente e sempre dizer "[APPLIED]".

## Onde entregar

O arquivo final vai como `6-filesystem_hardening.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
