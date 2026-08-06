# O que você precisa fazer

Esta tarefa transforma o baseline "cru" da Tarefa 0 em uma fila de trabalho — o equivalente Windows do `3-remediation_queue.sh` do 2x00. A diferença central: cada finding precisa apontar para uma ação e uma tarefa específica, não só descrever um problema.

## Passo 1 — O esquema de finding é o contrato, não uma sugestão

Os sete campos (`id`, `severity`, `category`, `asset`, `evidence`, `risk`, `recommended_remediation`, `mapped_task`) precisam existir em TODO finding, mesmo quando parecem redundantes. `risk` explica por que alguém deveria se importar (conecte sempre à Crimson Tide ou a um Finding anterior); `recommended_remediation` é a ação concreta; `mapped_task` é o rastreamento — e é normal que ele aponte para uma tarefa que ainda não existe (`pending: ...`), porque nem toda causa raiz identificada aqui já tem uma tarefa de remediação nas primeiras 6 tarefas do módulo. Isso é honesto, não um bug: o inventário de findings é construído ANTES de todas as correções existirem.

## Passo 2 — Nem todo "gap" vira um finding separado

Note que o comprimento mínimo de senha, a complexidade e o histórico de senha são três verificações diferentes, mas viram UM finding só (`FND-001`, categoria "Password Policy") com evidências agrupadas — não três findings separados. Isso é o que faz a contagem final bater com `Findings: 9`. Se você criar um finding por verificação individual, vai ter mais de 9 e a saída não vai bater com o esperado. Pense em "qual GPO resolve isso de uma vez" como a unidade de agrupamento, não "qual atributo eu testei".

## Passo 3 — `Get-ADGroupMember -Recursive` não devolve `Enabled`

Para achar contas desabilitadas em grupos privilegiados, `Get-ADGroupMember` só devolve `objectClass`, `SID`, `Name` — não `Enabled`. Você precisa de uma segunda consulta, `Get-ADUser -Identity $member.SID -Properties Enabled`, para cada membro. É um padrão comum em scripts de AD: a listagem de grupo e os detalhes da conta vêm de cmdlets diferentes.

## Passo 4 — `auditpol /get /category:*` devolve texto, não objetos

`auditpol` é uma ferramenta de linha de comando antiga, não um cmdlet PowerShell nativo. A saída com `/r` (formato CSV) pode ser convertida com `ConvertFrom-Csv`, mas ela tem cabeçalhos e nomes de coluna específicos (`Subcategory`, `Inclusion Setting`) que variam ligeiramente por idioma do Windows — em um laboratório em inglês funciona direto, mas é o tipo de fragilidade que vale comentar no código (e comentamos).

## Passo 5 — Contas de serviço aparecem em dois findings diferentes, de propósito

`svc-backup`, `svc-sql` e `svc-web` geram o finding `FND-004` (PasswordNeverExpires, se aplicável) e o `FND-007` (delegação irrestrita e outros riscos). Isso é intencional — a mesma conta pode ter múltiplos problemas independentes, e cada finding deve ser resolvido pela remediação certa, não misturado em um "conta de serviço ruim" genérico.

## Onde entregar

O arquivo final vai como `1-domain_findings.ps1` (mais `domain_security_findings.json` gerado), no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
