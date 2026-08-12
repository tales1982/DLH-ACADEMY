# O que você precisa fazer

Diferente das duas tarefas anteriores (que validam telemetria já existente), essa é um script "exportador": ele lê três logs com esquemas totalmente diferentes — Security, Sysmon Operational, PowerShell Operational — e produz um único JSON com um formato comum, além de um bloco de enriquecimento específico para os tipos de evento que mais importam para detecção.

## Passo 1 — Um único `Get-WinEvent -FilterHashtable` por log, filtrando por janela de tempo do lado do provedor

O loop principal usa `Get-WinEvent -FilterHashtable @{ LogName = ...; StartTime = $StartTime; EndTime = $EndTime }` para cada uma das três fontes em `$LogSources`. Isso é bem mais eficiente que puxar tudo e filtrar depois em PowerShell — o filtro por tempo é aplicado pelo próprio provedor de eventos do Windows. A janela padrão é `(Get-Date).ToUniversalTime().AddHours(-24)` até `(Get-Date).ToUniversalTime()`, exatamente as "últimas 24 horas" pedidas no enunciado, mas configurável via parâmetro para qualquer outra janela.

## Passo 2 — O `event_id` muda de forma para Sysmon, de propósito

Repare na linha `event_id = if ($source.SourceType -eq "Sysmon") { "Sysmon-$($rec.Id)" } else { $rec.Id }`. Isso existe porque o Sysmon reusa números de Event ID pequenos (1, 3, 11, 13, 22) que colidiriam visualmente com IDs de Security do Windows se ficassem soltos — prefixar com `Sysmon-` deixa o campo `top_event_ids` do relatório final (e qualquer dashboard que consuma esse JSON) sem ambiguidade sobre a fonte do evento, exatamente como o "Sysmon-1" que aparece na Saída Esperada do enunciado.

## Passo 3 — O enriquecimento vem da estrutura XML do evento, não de regex sobre o texto livre

`Get-EnrichedFields` recebe tanto o `EventRecord` quanto o XML já parseado (`$rec.ToXml()`) e usa um `switch ($EventRecord.Id)` para extrair campos como `TargetUserName`, `IpAddress`, `CommandLine` diretamente dos nós `<Data Name="...">`. O comentário no cabeçalho do script é explícito sobre essa escolha: os campos "get their key fields extracted from the event's structured XML data, not regex-scraped from the free-text message". Isso importa porque o texto livre (`Message`) muda de formatação entre versões do Windows e idiomas do SO — a estrutura XML, não.

## Passo 4 — O `switch` em `Id` sozinho colidiria entre Security e Sysmon, então cada case Sysmon revalida o `LogName`

Os EIDs 1, 3, 11, 13 e 22 existem tanto no schema do Sysmon quanto, coincidentemente, poderiam aparecer em outros contextos — por isso cada `case` de Sysmon dentro do switch (por exemplo `1 { if ($EventRecord.LogName -ne "Microsoft-Windows-Sysmon/Operational") { return $null } ... }`) primeiro confere se o evento realmente veio do canal Sysmon antes de tentar extrair `Image`/`CommandLine`/`ParentImage`. Sem essa checagem, um evento de outro log com o mesmo número de ID tentaria ler campos que não existem no seu XML.

## Passo 5 — O EID 13 (registro) é o único caso que faz parsing manual de string, porque o Sysmon não separa chave e valor

Para o Registry (EID 13), o Sysmon só expõe um campo `TargetObject` com o caminho completo tipo `HKLM\...\Run\Malware`. O script separa isso em `registry_key` e `value_name` "na mão", com `$targetObject.LastIndexOf("\")`: tudo antes da última barra invertida é a chave, o que sobra depois é o nome do valor. É um detalhe de implementação necessário porque, ao contrário dos outros enriquecimentos (que só copiam campos já separados no XML), aqui o campo de origem vem junto e precisa ser dividido para virar dois campos normalizados como o enunciado pede (`registry key`, `value name`).

## Onde entregar

Os arquivos finais vão como `3-windows_telemetry_export.ps1` e `windows_events_export.json`, no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
