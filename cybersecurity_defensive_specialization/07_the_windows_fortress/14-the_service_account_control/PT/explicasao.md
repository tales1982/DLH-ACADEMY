# O que você precisa fazer

## Passo 1 — A saída de auditoria é DINÂMICA por conta — cada conta mostra só os problemas que ela realmente tem

Repare no exemplo: `svc_backup` mostra idade de senha + delegação irrestrita; `svc_ehr` mostra idade de senha + horário de logon suspeito; `svc_sql` mostra idade de senha + `UseDESKeyOnly`. Nenhuma conta mostra as cinco linhas possíveis. Isso significa que a lógica do script precisa avaliar CADA condição de forma independente por conta (idade de senha, delegação, horário de logon, flag DES, associação privilegiada) e só imprimir a linha correspondente SE aquela condição específica for verdadeira para aquela conta — não é uma lista fixa de 5 linhas por conta.

## Passo 2 — "3h17 da manhã" é suspeito por CONTEXTO, não por uma regra universal

Não existe uma "hora proibida" gravada em pedra no Windows — o que torna as 3h17 suspeitas é que contas de serviço normalmente autenticam em horários previsíveis (jobs agendados, conexões de aplicação) e quase nunca fora da janela de manutenção. O script usa uma janela de horário configurável (`$SuspiciousHourStart`/`$SuspiciousHourEnd`, aqui 00h-05h) como heurística — em um ambiente real, você ajustaria essa janela para bater com os horários de manutenção documentados da MedDefense, não usaria um valor genérico.

## Passo 3 — "Account is sensitive and cannot be delegated" é DIFERENTE de "TrustedForDelegation = false"

São dois bits separados de `userAccountControl`, e a tarefa pede os dois: `Set-ADAccountControl -AccountNotDelegated $true` marca a conta como "sensível" — nenhum OUTRO serviço pode pedir para delegar/personificar essa conta, mesmo que aquele outro serviço tenha permissão de delegação configurada nele. Isso é uma proteção que vale mesmo se, no futuro, alguém configurar delegação errado em outro lugar do domínio — a própria conta de serviço se recusa a ser delegada. `TrustedForDelegation $false` (limpo só quando a conta JÁ tinha delegação irrestrita) desliga a delegação que a própria conta usava para representar outros usuários.

## Passo 4 — Negar logon interativo é uma configuração de DIREITO DE USUÁRIO, não um atributo de conta

`SeDenyInteractiveLogonRight` não é algo que você "liga" numa conta específica com um cmdlet de AD — é uma política de segurança local (a mesma categoria de configuração usada na Tarefa 5 para `SeSecurityPrivilege`) que lista SIDs. O script exporta a política de segurança atual do DC com `secedit /export`, adiciona os SIDs das contas de serviço à lista de negação, e reaplica com `secedit /configure /areas USER_RIGHTS` — o mesmo padrão de "exportar → editar → reaplicar" que aparece em outras tarefas deste módulo sempre que a configuração vive em um modelo de segurança em vez de um valor de registro simples.

## Passo 5 — Por que isso teria impedido o comprometimento da svc_ehr

Se a `svc_ehr` já tivesse "Account is sensitive and cannot be delegated" habilitado e logon interativo negado, um atacante que roubasse suas credenciais NÃO conseguiria: (1) usar a conta para se passar por outro usuário via delegação, nem (2) fazer login interativo com ela (RDP, console) mesmo tendo a senha — restando só o uso dela nos serviços legítimos para os quais foi criada, o que reduz drasticamente o valor da conta para um atacante mesmo depois de comprometida.

## Onde entregar

O arquivo final vai como `14-service_accounts.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
