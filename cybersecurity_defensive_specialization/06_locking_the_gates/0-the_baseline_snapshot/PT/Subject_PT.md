# 0. A Captura da Linha de Base

**Objetivo:** Capturar o estado completo de segurança de um sistema antes de qualquer mudança, estabelecendo a medição contra a qual toda tarefa seguinte vai melhorar.

## Contexto

Você não consegue provar que o hardening funcionou se não sabe de onde partiu. Essa tarefa captura o sistema como ele está: sem hardening, configuração padrão, cada ajuste no valor de fábrica. Todo número que você registrar aqui é o número que você vai melhorar.

## Instruções

Escreva um script `0-baseline_snapshot.sh` que capture a linha de base completa de segurança de um sistema Linux. O script precisa:

- Registrar identificação do sistema (hostname, SO, versão do kernel, uptime)
- Listar todos os serviços em execução e seu estado
- Listar todas as portas abertas e sockets em escuta
- Listar todos os binários SUID e SGID
- Listar todos os arquivos com permissão de escrita para qualquer usuário (excluindo `/proc`, `/sys`, `/dev`)
- Capturar os parâmetros sysctl relevantes para segurança
- Capturar as configurações atuais do SSH
- Registrar contas de usuário ativas e membros do grupo sudo

## Saída Esperada

```
$ sudo ./0-baseline_snapshot.sh
Hostname: billing-srv-01
OS: Ubuntu 22.04.3 LTS
Running services: 24
Open ports: 11
SUID binaries: 23
SGID binaries: 12
World-writable files: 7
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `0-baseline_snapshot.sh`
