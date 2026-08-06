# O que você precisa fazer

Essa tarefa é puramente de coleta de dados — o script não corrige nada, só fotografa o sistema como ele está agora. O ponto crítico é que essa foto vai ser a referência ("antes") que você vai comparar contra o "depois" em cada tarefa de hardening posterior.

## Passo 1 — Pense em "detectar" antes de "listar"

Para serviços em execução, você pode usar `systemctl list-units --type=service --state=running`. Para portas abertas, `ss -tulnp` é mais moderno que `netstat`. Não precisa reinventar a roda — o script é sobre orquestrar essas ferramentas padrão do Linux e agregar a contagem de cada uma.

## Passo 2 — Binários SUID/SGID: cuidado com o escopo da busca

Rodar `find / -perm -4000` na raiz inteira do sistema de arquivos pode ser lento e vai gerar muitos erros de "permission denied" em diretórios que o script não tem acesso. Redirecione os erros (`2>/dev/null`) e considere se faz sentido excluir `/proc` e `/sys` aqui também, já que eles não guardam binários de verdade.

## Passo 3 — Arquivos com escrita para todo mundo: o enunciado já te dá a exclusão certa

Preste atenção que o enunciado pede explicitamente para excluir `/proc`, `/sys` e `/dev` dessa busca — esses são sistemas de arquivos virtuais/pseudo, não armazenamento real, e vão gerar falsos positivos e lentidão enorme se você não os excluir com `-path /proc -prune -o ...` (ou equivalente).

## Passo 4 — Pense em formato de saída desde já

Mesmo que essa tarefa não peça explicitamente um JSON (diferente das tarefas 1, 2 e 3), vale a pena estruturar a saída do script de um jeito fácil de re-processar depois (por exemplo, indentado e com contadores claros), porque a Tarefa 3 (fila de remediação) vai precisar comparar esse "antes" com o "depois" de cada hardening.

## Onde entregar

O arquivo final vai como `0-baseline_snapshot.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
