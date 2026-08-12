# O que você precisa fazer

Assim como na Task 0, essa não é uma tarefa de configuração — é validação. O GPO do 2x01 (`6-powershell_security.ps1`) já ligou Script Block Logging, Module Logging e Transcription. Aqui você prova, com comandos reais do tipo que o atacante Crimson Tide usou, que cada camada realmente registra o conteúdo, não só "algum evento".

## Passo 1 — O campo `ScriptBlockText`, não a mensagem livre, é o que prova captura completa

`Get-EventDataValue` converte o evento em XML e lê o nó `<Data Name="ScriptBlockText">` diretamente. O comentário no código é direto sobre o motivo: "checking that field is populated is what proves full content was captured, not just that some 4104 event with a matching substring in its free-text Message happened to fire". Ou seja: filtrar por `$_.Message -like "*Get-Process*"` só encontra o evento candidato; o `$ScriptBlockText1 -like "*Get-Process*"` é que confirma que o conteúdo real do bloco de script contém o comando.

## Passo 2 — O comando codificado usa Unicode/Base64 do jeito que o PowerShell realmente exige

`$EncodedTestCommand = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($TestCommand))` gera o Base64 no encoding que `powershell.exe -EncodedCommand` espera (UTF-16LE, não UTF-8) — é assim que ferramentas de ofuscação de atacante e o próprio `-enc` funcionam. O teste então busca `$TestCommand` (o texto decodificado `Write-Host "Test"`) dentro do `ScriptBlockText`, provando que o Script Block Logging decodifica o comando antes de gravar, exatamente o comportamento que denuncia comandos ofuscados de um atacante.

## Passo 3 — O teste de bloco multilinha distingue "capturado completo" de "capturado truncado"

O bloco 4/5 monta um `$Candidates4` com todos os eventos 4104 cujo `Message` contém `"Check passed"`, depois filtra `$Event4Full` exigindo que o `ScriptBlockText` também contenha `"End of block"` (a última linha do heredoc). Se só `$Event4Full` falhar mas `$Event4Partial` existir, o script reporta `[PASS]` mesmo assim, só que com `-DetailLevel "partial"` e a mensagem "Block captured but truncated before the final lines". Isso segue literalmente a instrução do enunciado de reportar "detail level: full content vs partial" — o roteiro não trata truncamento como falha binária, trata como um nível de detalhe a ser reportado.

## Passo 4 — A checagem de transcript usa uma janela de tempo, não só "o arquivo existe"

O teste 5/5 filtra `Get-ChildItem -Path $TranscriptDir -Filter "*.txt" -Recurse` por `$_.LastWriteTime -ge (Get-Date).AddMinutes(-10)`. Sem esse filtro, um arquivo de transcript de uma sessão de dias atrás faria o teste passar mesmo que a Transcription tivesse parado de funcionar agora — a janela de 10 minutos amarra o resultado à sessão que o próprio script acabou de gerar.

## Onde entregar

O arquivo final vai como `2-powershell_logging_validation.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
