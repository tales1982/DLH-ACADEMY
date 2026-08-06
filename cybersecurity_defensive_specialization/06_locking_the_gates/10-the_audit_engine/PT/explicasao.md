# O que você precisa fazer

Essa tarefa é sobre configurar o "sistema nervoso" de detecção do servidor. Cada linha de regra que você escreve é uma pergunta que o kernel vai responder de agora em diante: "alguém mexeu nesse arquivo?" ou "alguém executou esse binário?".

## Passo 1 — Entenda a sintaxe da regra antes de copiar e colar

`-w /etc/passwd -p wa -k identity` significa: "watch" (observe) esse arquivo, para as permissões `w` (write) e `a` (attribute change), e marque os eventos encontrados com a chave (`-k`) "identity" — essa chave é o que depois permite buscar só esses eventos com `ausearch -k identity`. Para binários executáveis, `-p x` significa monitorar execução, não escrita.

## Passo 2 — As regras vão num arquivo, mas "carregar" é um passo separado

Escrever o arquivo `/etc/audit/rules.d/meddefense.rules` não ativa nada sozinho. Você precisa rodar `augenrules --load` (que compila os arquivos de `/etc/audit/rules.d/` em `/etc/audit/audit.rules` e recarrega o daemon) — ou reiniciar o `auditd`, dependendo da versão.

## Passo 3 — O teste final precisa ser um evento real e depois uma busca real no log

"Disparar um evento auditável" significa literalmente executar o comando que a regra observa — por exemplo, `sudo cat /etc/shadow` — e depois rodar `ausearch -ts recent -k identity` para confirmar que o evento apareceu no log. Se a busca não retornar nada, algo está errado com a regra ou com o carregamento, e o script deveria reportar isso, não fingir sucesso.

## Passo 4 — A ordem das regras no arquivo pode importar para regras mais complexas, mas aqui é simples

Como essas são todas regras de "watch" (`-w`), a ordem entre elas não muda o comportamento — cada uma é independente. Isso simplifica bastante comparado a regras baseadas em `syscall`, que são mais sensíveis à ordem.

## Onde entregar

O arquivo final vai como `10-auditd_config.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
