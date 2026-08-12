# O que você precisa fazer

Essa tarefa não é sobre configurar nada novo — é sobre provar, com ações reais e reversíveis, que o Sysmon que você implantou no 2x01 (Task 9, ajustado na Task 10) realmente dispara nos 5 tipos de evento dos quais todo o resto deste projeto depende. Sem essa prova, qualquer detecção construída depois é uma aposta.

## Passo 1 — Cada ação usa um timestamp próprio para não contar evento de outra execução

Antes de cada gatilho, o script chama `Get-Date` e guarda em `$Since1`, `$Since2` etc. Essa marca é usada em `Get-RecentSysmonEvent` para filtrar `$_.TimeCreated -ge $Since`. Isso importa porque o log Operational do Sysmon acumula eventos de execuções anteriores do próprio script (o mesmo `whoami`, o mesmo `test.txt`) — sem esse corte por timestamp, uma rodada anterior "aprovaria" a rodada atual mesmo se o Sysmon tivesse parado de funcionar.

## Passo 2 — Encontrar o evento não é suficiente: o campo de triagem precisa estar populado

A função `Get-EventDataValue` converte o registro em XML (`$EventRecord.ToXml()`) e busca o nó `<Data Name="...">` correspondente (`CommandLine`, `DestinationIp`, `TargetFilename`, `TargetObject`, `QueryName`). Note que cada `$FoundN` não é só `[bool]$EventN` — por exemplo, `$Found1 = [bool]($Event1 -and $CommandLine1 -and $CommandLine1 -like "*whoami*")`. Isso é proposital: um EID 1 poderia disparar com o campo `CommandLine` vazio (config quebrada) e ainda assim "existir" como evento — o teste tem que checar o conteúdo, não só a presença do evento.

## Passo 3 — O teste de DNS dispara dois gatilhos diferentes para o mesmo Event ID 22

O bloco 5/5 roda tanto `nslookup $DnsQueryName` (o comando documentado no enunciado) quanto `Resolve-DnsName -Name $DnsQueryName -ErrorAction SilentlyContinue`. Qualquer um dos dois pode gerar a consulta DNS de rede que o Sysmon observa — rodar os dois aumenta a chance de captura sem comprometer o teste, já que o filtro por `-MessagePattern "*$DnsQueryName*"` continua exigindo que o domínio apareça no evento.

## Passo 4 — O script limpa os próprios artefatos, mas isso não é opcional nem cosmético

No bloco de cleanup, `Remove-Item -Path $TestFilePath` e `Remove-ItemProperty`/`Remove-Item -Path $RegistryKeyPath -Recurse` removem o arquivo de teste e a chave `HKCU:\Software\MedDefenseSysmonTest`. O cabeçalho do script deixa isso explícito: "Read-only against the system: the only writes are the throwaway test file and registry value, both removed by the cleanup step". Isso é o que permite rodar esse script repetidamente em produção sem acumular lixo — e é também por isso que o Passo 1 (corte por timestamp) é necessário: se o cleanup falhar ou o script for interrompido, a próxima execução ainda precisa distinguir evento novo de evento antigo.

## Onde entregar

O arquivo final vai como `0-sysmon_validation.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
