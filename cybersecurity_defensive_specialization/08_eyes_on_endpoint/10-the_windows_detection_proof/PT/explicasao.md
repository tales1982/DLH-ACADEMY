# O que você precisa fazer

Esse script não gera nada novo — ele é puramente de leitura. Ele pega o `windows_attack_log.json` que a Tarefa 9 escreveu e, para cada ação registrada lá, vai atrás do evento real nos logs do Windows para provar (ou desmentir) que a instrumentação capturou aquilo.

## Passo 1 — Um dicionário traduz o rótulo "amigável" do ground truth para o canal de log real do Windows

`$SourceToLogName` mapeia `"Security"` → `"Security"`, `"Sysmon"` → `"Microsoft-Windows-Sysmon/Operational"` e `"PS ScriptBlock"` → `"Microsoft-Windows-PowerShell/Operational"`. A Tarefa 9 grava rótulos curtos e legíveis no JSON (é isso que aparece na tabela do console); este script precisa do nome completo do canal (`-LogName`) para o `Get-WinEvent` funcionar. Separar as duas coisas é o que permite a tabela final ficar compacta (`"Sysmon"`) sem que o script perca a capacidade de consultar o canal certo.

## Passo 2 — "Full" vs "Partial" é decidido campo a campo dentro do XML bruto do evento, não por ele simplesmente ter disparado

`$KeyFieldsByEventId` define, por Event ID, quais campos do `EventData` PRECISAM estar preenchidos para contar como detecção completa — por exemplo, o Event ID 1 do Sysmon (criação de processo) exige `Image` E `CommandLine` juntos; o 4104 exige `ScriptBlockText`. A função `Get-EventDataValue` faz `[xml]$eventXml = $EventRecord.ToXml()` e procura o nó `<Data Name="...">` correspondente — porque as propriedades "amigáveis" que `Get-WinEvent` expõe por padrão não dão acesso direto aos campos customizados do evento, só o XML completo tem isso. Se o evento aparece mas um desses campos está vazio, o resultado é `"Partial"`, não `"Full"` — a matriz não confunde "o evento disparou" com "o evento tem o detalhe que um analista precisa".

## Passo 3 — Uma única ação pode virar duas linhas na matriz, e a tabela do console esconde a repetição do nome da ação

Como a Ação 3 na Tarefa 9 espera tanto `PS ScriptBlock`/4104 quanto `Sysmon`/1, o `foreach ($expected in @($action.expected_detection_sources))` roda duas vezes para essa mesma ação e adiciona duas linhas a `$MatrixRows`. Na hora de imprimir, `$lastActionNumber` garante que o nome da ação só apareça na primeira linha do grupo — exatamente o efeito da linha em branco no exemplo de saída esperada (`Encoded PowerShell` aparece uma vez, a linha do `Sysmon` embaixo vem com a coluna Action vazia). É esse padrão de múltiplas linhas para uma ação que o contador `$MultiSourceCount` (incrementado quando `$sourcesCaptured -gt 1`) mede.

## Passo 4 — "Ação capturada" usa lógica OU entre as fontes esperadas, não E

`$ActionsCaptured` só incrementa se `$anySourceCaptured` for verdadeiro — ou seja, mesmo que uma ação espere duas fontes (Ação 3) e apenas uma delas dispare de fato, a ação inteira ainda conta como capturada no total de `actions_captured`/`captured_percentage`. Cada linha individual da matriz (`status`) continua honesta sobre `[CAPTURED]` vs `[MISSED]` por fonte — só o agregado por ação usa a lógica mais permissiva, porque o que importa para o handoff é "essa ação do atacante deixou algum rastro", não "todas as fontes previstas dispararam".

## Onde entregar

O arquivo final vai como `10-windows_detection_proof.ps1` (que lê `windows_attack_log.json` e gera `windows_detection_matrix.json`), no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
