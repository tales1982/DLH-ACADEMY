# O que você precisa fazer

## Passo 1 — As três configurações de logging do PowerShell moram em três chaves de registro diferentes, mas todas são GPO Administrative Templates normais

Diferente da Auditoria Avançada (Tarefa 5), que exige mexer em arquivos dentro do SYSVOL, Script Block Logging, Module Logging e Transcrição são todos valores de registro simples sob `HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\...` — exatamente o tipo de configuração que `Set-GPRegistryValue` foi feito para escrever. Preste atenção no `ModuleNames`: não é um valor único, é uma subchave (`...\ModuleLogging\ModuleNames`) onde cada módulo a ser logado vira um par nome=valor. Usar `"*" = "*"` é o "curinga" que diz "logue TODOS os módulos".

## Passo 2 — O truque do AMSI é uma técnica real, de dois lados

O campo `amsiInitFailed` dentro do tipo interno `System.Management.Automation.AmsiUtils` é exatamente o mesmo campo que ferramentas de bypass de AMSI manipulam via reflexão para desativar a varredura de conteúdo malicioso na sessão (setando ele para `$true`). Aqui, usamos a mesma técnica de reflexão só para LER o valor (nunca escrever) — é uma verificação diagnóstica legítima, e vale a pena entender que a mesma superfície de código usada para defesa pode ser abusada ofensivamente. Isso é uma boa história para contar em uma entrevista de emprego sobre "dual-use" em segurança.

## Passo 3 — O teste no final só funciona de verdade depois que a política já foi aplicada

Rodar `powershell -enc <base64>` gera um Event ID 4104 SE E SOMENTE SE o Script Block Logging já estiver ativo na sessão que executa o comando filho. Como a GPO acabou de ser configurada e vinculada no mesmo script, pode ser que o `gpupdate /force` ainda não tenha propagado completamente para o registro local antes do teste rodar — por isso o script trata a ausência do evento como `[PENDING]`, não como uma falha definitiva. Se isso acontecer no seu laboratório, rode o script uma segunda vez: na segunda execução, a política já estará em vigor e o teste deve passar.

## Passo 4 — `[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes(...))` é EXATAMENTE como o parâmetro `-EncodedCommand` do PowerShell espera

O PowerShell decodifica `-enc`/`-EncodedCommand` assumindo UTF-16LE (chamado de "Unicode" no .NET) — se você codificar em UTF-8 por engano, o comando não vai rodar. Essa é a mesma codificação que um atacante usaria para ofuscar um comando malicioso, e é exatamente o padrão (`powershell.exe -enc [base64]`) citado no advisory Crimson Tide.

## Onde entregar

O arquivo final vai como `6-powershell_security.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
