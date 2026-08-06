# O que você precisa fazer

O ponto mais importante desta tarefa: "subcategoria habilitada" e "evento realmente gerado" são DUAS coisas diferentes, e é fácil confundir uma pela outra.

## Passo 1 — Repare que 4624, 4625 e 4648 compartilham a mesma subcategoria, mas têm status diferentes

As três aparecem como "Logon" na coluna de subcategoria, mas 4624/4625 mostram `[GENERATING]` enquanto 4648 mostra `[NOT CONFIGURED]`. Isso não é inconsistência — é o comportamento real do Windows: 4624/4625 (logon bem-sucedido/falho) acontecem toda hora, naturalmente, porque qualquer pessoa fazendo login gera esses eventos. Já 4648 (credenciais explícitas, tipo um `runas` ou uma conexão de rede com credencial diferente) só aparece quando alguém realmente faz esse tipo de operação — e no ambiente de laboratório, isso pode simplesmente não ter acontecido nas últimas 24 horas. Por isso a tarefa pede DUAS verificações: (1) a subcategoria está habilitada no `auditpol`, e (2) o evento REALMENTE apareceu no log. A verdade final do "Status" que você reporta deve vir da segunda verificação — ela é o que importa de fato para um analista de SOC.

## Passo 2 — `auditpol /get /category:*` é uma ferramenta de linha de comando dos anos 2000, não um cmdlet

Ela não devolve objetos PowerShell nativos. Use `/r` para saída em CSV e depois `ConvertFrom-Csv` — mas cuidado, os nomes de coluna (`Subcategory`, `Inclusion Setting`) podem variar dependendo do idioma de instalação do Windows Server. Em um laboratório em inglês (como o DC01), funciona direto.

## Passo 3 — `Get-WinEvent -FilterHashtable` é muito mais rápido que `Where-Object` depois

Não faça `Get-WinEvent -LogName Security | Where-Object {$_.Id -eq 4624}` — isso carrega o log inteiro na memória antes de filtrar. Use `-FilterHashtable @{LogName='Security'; Id=4624; StartTime=(Get-Date).AddHours(-24)}`, que aplica o filtro no próprio provedor de eventos do Windows (muito mais rápido, especialmente relevante quando esse mesmo padrão for usado depois em um log de produção com milhões de eventos).

## Passo 4 — O Event ID 1102 é um caso especial

"Audit Log Cleared" é gerado pelo próprio Windows sempre que alguém limpa o log de Segurança, independentemente de qualquer configuração de subcategoria — é um mecanismo de proteção embutido no sistema operacional, não algo que se "configura". Se ele aparecer como `[GENERATING]` no seu ambiente, na verdade isso é um sinal de alerta: significa que o log de segurança foi limpo recentemente, o que por si só é um evento suspeito digno de investigação (é exatamente o tipo de ação que um atacante tenta fazer para apagar rastros).

## Onde entregar

O arquivo final vai como `2-eventlog_assessment.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
