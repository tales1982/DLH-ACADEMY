# O que você precisa fazer

Essa é a primeira tarefa que MUDA o sistema de verdade (as tarefas 0-3 só coletavam e analisavam dados). O ponto central aqui é idempotência: o script precisa poder ser executado várias vezes sem duplicar linhas ou quebrar a configuração.

## Passo 1 — Não simplesmente acrescente linhas no final do arquivo

Se você só fizer `echo "PasswordAuthentication no" >> sshd_config`, rodar o script duas vezes deixa DUAS linhas `PasswordAuthentication`, e o SSH normalmente usa a PRIMEIRA que encontrar — o que pode significar que sua segunda execução não tem efeito nenhum, ou peor, gera comportamento inconsistente. Use `sed` para substituir a linha se ela já existir (comentada ou não), e só adicionar se não existir.

## Passo 2 — O padrão "backup → aplica → valida → decide" é o núcleo da tarefa

A ordem importa: primeiro backup (`sshd_config.bak`), depois aplica as mudanças, depois `sshd -t` para validar sintaxe ANTES de reiniciar o serviço. Se `sshd -t` falhar, restaure o backup automaticamente — nunca reinicie um serviço com uma config que pode travar o acesso remoto sem ter uma rede de segurança.

## Passo 3 — `AllowUsers medadmin sysadmin` é uma decisão que pode te trancar fora

Cuidado: se o usuário que você está usando para se conectar (por exemplo, `analyst`, conforme os dados de acesso ao laboratório) não estiver na lista de `AllowUsers`, você perde acesso SSH depois de reiniciar o serviço. Ou você testa isso em uma sessão onde já tem outro jeito de entrar (console local), ou ajusta a lista para incluir o usuário real que você está usando no laboratório.

## Passo 4 — Cada configuração precisa de um comentário conectando à ameaça, não só ao "CIS diz para fazer isso"

O padrão do projeto (visto no README) pede algo como `# Disable SSH password auth - addresses 1x02 Finding 009 and Crimson Tide Phase 3`. Isso vale para TODAS as 11 configurações, não só para `PasswordAuthentication` — pense em qual ameaça específica cada uma resolve (por exemplo, `X11Forwarding no` reduz superfície de ataque de encaminhamento de display X11; `MaxAuthTries 3` mitiga força bruta).

## Onde entregar

O arquivo final vai como `4-ssh_hardening.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
