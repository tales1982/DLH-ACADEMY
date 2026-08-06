# O que você precisa fazer

Esta é a tarefa tecnicamente mais profunda do módulo até agora, porque a Política de Auditoria Avançada não é uma configuração de registro simples — ela mora em um lugar diferente da GPO, e isso muda como você precisa escrevê-la.

## Passo 1 — Auditoria Avançada não é `Set-GPRegistryValue`

Ao contrário de "linha de comando em eventos de processo" (que É um valor de registro, `ProcessCreationIncludeCmdLine_Enabled`), as 10 subcategorias de auditoria (Credential Validation, Logon, Process Creation, etc.) são armazenadas em um arquivo CSV especial dentro do SYSVOL da própria GPO: `\Machine\Microsoft\Windows NT\Audit\audit.csv`. É o mesmo arquivo que o editor de GPMC gera quando você marca as caixinhas em "Advanced Audit Policy Configuration" na interface gráfica. Não existe um cmdlet PowerShell nativo de alto nível para isso — o script escreve o CSV diretamente, no formato exato que o `auditpol` espera (`Machine Name,Policy Target,Subcategory,Subcategory GUID,Inclusion Setting,Exclusion Setting,Setting Value`).

## Passo 2 — Toda mudança direta em arquivo de SYSVOL de uma GPO exige incrementar a versão no `GPT.INI`

Se você só escrever o `audit.csv` sem tocar no `GPT.INI` da GPO, os controladores de domínio e as estações nunca vão perceber que a política mudou — o número de versão é o que dispara o reprocessamento da GPO. Isso é fácil de esquecer e é a causa mais comum de "eu configurei a GPO mas nada mudou."

## Passo 3 — O script aplica a política DUAS vezes, de propósito

Ele escreve o `audit.csv` (para propagação via GPO, útil quando houver mais controladores/servidores no domínio) E chama `auditpol /set` diretamente na máquina local (o DC01). Isso é intencional: a replicação de GPO e o ciclo de atualização de política levam tempo, mas a tarefa pede uma verificação imediata com `auditpol /get` no mesmo script. Aplicar localmente garante que a verificação no final do script reflita a mudança de verdade, sem você precisar esperar um `gpupdate` completo ou um reboot.

## Passo 4 — Restringir a limpeza do log de Segurança é sobre um PRIVILÉGIO, não sobre um valor

"Quem pode limpar o log de Segurança" é controlado pelo direito de usuário `SeSecurityPrivilege` ("Gerenciar auditoria e log de segurança"), configurado na seção `[Privilege Rights]` de um arquivo de modelo de segurança (`GptTmpl.inf`) — outro arquivo dentro do SYSVOL da GPO, diferente do `audit.csv`. Restringir esse direito ao grupo Domain Admins fecha exatamente o tipo de lacuna que permitiria a um atacante (ou um admin local displicente) apagar evidências antes que alguém perceba — o Event ID 1102 documentado na Tarefa 3.

## Passo 5 — `1 GB` no tamanho do log é 1.048.576, não 1.000.000

O valor de registro `MaxSize` para o log de Eventos é sempre em KILOBYTES. 1 GB = 1024 × 1024 KB = 1.048.576. Um erro comum é usar 1.000.000 (que daria só ~977 MB) ou confundir com bytes.

## Onde entregar

O arquivo final vai como `5-audit_policy.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
