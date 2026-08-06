# 6. A Varredura de Permissões

**Objetivo:** Auditar e remediar permissões perigosas do sistema de arquivos que poderiam permitir escalação de privilégio.

## Contexto

Binários SUID são como um atacante com acesso de shell de baixo privilégio escala para root. Arquivos com escrita liberada para todo mundo são como um atacante modifica scripts que rodam como root. Ambos são vetores clássicos de escalação de privilégio que o afiliado do Crimson Tide usaria depois do acesso inicial (Fase 3). A captura de linha de base da Tarefa 0 encontrou 23 binários SUID e 7 arquivos com escrita liberada para todo mundo. Nem todos são necessários.

## Instruções

Escreva um script `6-filesystem_hardening.sh` que:

- Encontre todos os binários SUID, compare com uma whitelist fixa no código de binários conhecidos como seguros para Ubuntu 22.04, e remova o SUID dos binários inesperados
- Faça o mesmo para binários SGID
- Encontre e remedeie arquivos com escrita liberada para todo mundo (excluindo `/proc`, `/sys`, `/dev`)
- Verifique e configure as opções de montagem para `/tmp`, `/var/tmp` e `/dev/shm` (`noexec`, `nosuid`, `nodev`)
- Restrinja o acesso ao cron a usuários autorizados
- Imprima um resumo completo da remediação

## Saída Esperada

```
$ sudo ./6-filesystem_hardening.sh
Found 23 SUID binaries
Whitelisted: 18
Non-whitelisted: 5
  /usr/local/bin/oldtool   [SUID REMOVED]
  /opt/legacy/setuid-app   [SUID REMOVED]
Found 12 SGID binaries
Whitelisted: 11
Non-whitelisted: 1
  /usr/local/bin/shared    [SGID REMOVED]
Found 7 world-writable files
  /tmp/debug.log           [FIXED]
  /var/www/html/uploads/   [FIXED]
/tmp:     noexec,nosuid,nodev  [OK]
/var/tmp: noexec,nosuid,nodev  [APPLIED]
/dev/shm: noexec,nosuid,nodev  [OK]
SUID remediated: 5 | SGID remediated: 1 | World-writable fixed: 7
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `6-filesystem_hardening.sh`
