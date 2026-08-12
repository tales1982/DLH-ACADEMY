# O que você precisa fazer

Este script não é uma ferramenta defensiva — ele é o "atacante" desta etapa do projeto. A única coisa que importa depois que ele termina é o `windows_attack_log.json`: a verdade fundamental que a Tarefa 10 vai usar para provar se a sua instrumentação (Sysmon, Security, PowerShell logging) realmente capturou cada ação.

## Passo 1 — O ground truth é salvo ANTES da limpeza, de propósito

Repare na ordem: as seis ações rodam, `Add-ActionLog` acumula cada uma em `$script:Actions`, e só DEPOIS o script escreve `$GroundTruth | ConvertTo-Json -Depth 6 | Set-Content -Path $GroundTruthPath`. A limpeza (`Remove-Item`, `Unregister-ScheduledTask`, `Remove-LocalUser`) só começa depois disso. O comentário no código é direto: "so a cleanup failure never loses the log". Se o `Unregister-ScheduledTask` falhar por qualquer motivo, você ainda tem o JSON completo com todos os timestamps — só o `[WARN]` no lugar do `[CLEAN]` avisa que sobrou artefato pra remover manualmente.

## Passo 2 — Cada recurso é limpo em seu próprio `try/catch` independente, não em bloco único

```
try { Remove-Item -Path $StartupFilePath -Force -ErrorAction Stop } catch { $CleanupOk = $false }
try { Unregister-ScheduledTask -TaskName $ScheduledTaskName -Confirm:$false -ErrorAction Stop } catch { $CleanupOk = $false }
try { Remove-LocalUser -Name $UserName -ErrorAction Stop } catch { $CleanupOk = $false }
```
Se o script usasse um único `try` para as três remoções, a primeira falha interromperia as outras duas e deixaria, por exemplo, a conta `support_update` (que virou membro de Administrators) esquecida no sistema. Com três blocos separados, uma falha na remoção do arquivo de Startup não impede a remoção do usuário — e `$CleanupOk` só vira `$false` para reportar o `[WARN]`, sem impedir as demais tentativas.

## Passo 3 — Segurança: o "ataque" é real o suficiente para gerar telemetria, mas inofensivo por construção em cada uma das seis etapas

- O comando codificado em Base64 (`-EncodedCommand`) decodifica para `Write-Host "C2 beacon"` — só imprime texto na tela, não abre nenhum canal de comando-e-controle de verdade. A codificação em si (igual a técnicas reais de evasão) é o que interessa para gerar o Event ID 4104/Sysmon 1, não o conteúdo do payload.
- A tarefa agendada criada via `schtasks /create /tn $ScheduledTaskName /tr "cmd.exe /c exit" /sc daily /st 03:00 /f` só executa `cmd.exe /c exit` — abre e fecha um processo sem fazer nada.
- A "conexão de saída" usa `Test-NetConnection -ComputerName $NetworkTarget -Port $NetworkPort` contra `8.8.8.8:443`, o resolvedor público do Google — apenas testa se a porta responde, não envia nenhum dado real.
- A senha da conta `support_update` é gerada com `[System.Guid]::NewGuid().ToString()` e nunca é reaproveitada nem persistida em lugar nenhum além da variável local.
- O arquivo solto no Startup é um `.vbs` com um comentário de texto puro (`"' MedDefense attacker-simulation artifact..."`), sem nenhum código executável.

Cada etapa foi escolhida para disparar exatamente o tipo de evento que um ataque real geraria, sem que nenhuma delas cause dano, escale de verdade ou saia do próprio endpoint de laboratório.

## Passo 4 — Uma ação pode esperar mais de uma fonte de detecção ao mesmo tempo

`Add-ActionLog` recebe `-ExpectedDetectionSources` como um array, não um valor único, porque a Ação 3 (PowerShell codificado) é esperada em DUAS fontes simultaneamente: `PS ScriptBlock`/Event ID 4104 (script block logging) E `Sysmon`/Event ID 1 (criação de processo), já que rodar `powershell.exe -EncodedCommand` sempre cria um processo novo além de gerar o log de script. As outras cinco ações só têm uma fonte esperada, mas o schema do JSON já vem pronto para tratar os dois casos igual — é isso que a Tarefa 10 usa depois para contar "multi-source".

## Onde entregar

O arquivo final vai como `9-windows_attack_sim.ps1` (que gera `windows_attack_log.json` como ground truth), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
