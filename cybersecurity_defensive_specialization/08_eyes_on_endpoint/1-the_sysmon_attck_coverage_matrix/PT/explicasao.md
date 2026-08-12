# O que você precisa fazer

Aqui o objetivo não é reler o `sysmonconfig.xml` linha por linha — é transformar essa configuração em uma resposta objetiva para a pergunta "se um atacante fizer X, eu vejo?", por técnica do ATT&CK. Um Event ID "habilitado" no XML não garante nada se o filtro de include for estreito demais.

## Passo 1 — "Habilitado" é calculado como união de tags com pelo menos um RuleGroup

O script constrói `$TagToEventIds` mapeando cada tag do schema do Sysmon (`ProcessCreate`, `NetworkConnect`, `RegistryEvent`, etc.) para os Event IDs que ela controla — repare que `RegistryEvent` sozinho cobre os EIDs 12, 13 e 14, porque o Sysmon não separa CreateKey/DeleteKey/SetValue/RenameKey em elementos de config distintos. `$EnabledEventIds` é a lista de EIDs cuja tag aparece em pelo menos um `RuleGroup`, independente de quão restrito seja o filtro. Isso é intencional: "habilitado" aqui significa "o Sysmon vai gerar esse tipo de evento", não "vai gerar para qualquer coisa".

## Passo 2 — `Get-ConditionElements` existe porque o XML tem duas formas de organizar as mesmas condições

Um elemento de RuleGroup como `<Image condition="...">` pode ter as condições diretamente, ou agrupadas dentro de um ou mais `<Rule>` nomeados (usado no bloco de detecções customizadas da MedDefense). A função é recursiva: se o filho é `Rule`, ela desce mais um nível; senão, retorna o próprio nó como condição. Sem isso, qualquer regra dentro de um `<Rule>` nomeado seria invisível para `Get-TagFilterInfo` e o relatório subestimaria os `filter_conflicts` reais.

## Passo 3 — O veredito por técnica não é mecânico, é uma decisão de analista registrada no código

Olhe o array `$Techniques`: cada item já vem com `Verdict`, `Reason` e `Recommendation` fixos, decididos manualmente a partir da leitura real do `sysmonconfig.xml` — não derivados da estrutura do XML por lógica genérica. Por exemplo, T1547 é `covered` mesmo com `RegistryEvent` sendo include-only, porque o escopo (`\CurrentVersion\Run`, `\RunOnce`, `\Services\`) É a superfície de persistência que a técnica ataca — filtro estreito aqui é acerto, não gap. Já T1055 é `partial` porque `CreateRemoteThread`/`ProcessAccess` estão restritos a `lsass.exe`/`winlogon.exe` como alvo, e injeção de processo não se limita a roubo de credencial — injeção em `explorer.exe` ou navegador não gera evento nenhum. Esse julgamento não dá pra tirar só olhando tags XML, por isso está hardcoded com justificativa.

## Passo 4 — O status final ainda pode ser rebaixado mecanicamente para `blind`

Depois do veredito manual, o loop principal recalcula `$missingForTech` comparando `$tech.Required` com `$EnabledEventIds`. Se nenhum dos EIDs exigidos estiver habilitado, o status vira `blind` automaticamente, sobrescrevendo o `Verdict` fixo do array. Isso é a rede de segurança: se alguém editar o `sysmonconfig.xml` no futuro e remover o RuleGroup de um EID necessário, o relatório reflete isso mesmo que o texto do `Reason` hardcoded ainda fale de cobertura.

## Passo 5 — O caminho do config tem fallback para o `sysmonconfig.xml` do módulo anterior

O parâmetro `$SysmonConfigPath` testa primeiro um `sysmonconfig.xml` local (`$PSScriptRoot`) e, se não existir, cai para `..\2x01_windows_fortress\sysmonconfig.xml` — o arquivo real implantado no módulo anterior. Isso evita duplicar o arquivo de configuração entre módulos e garante que a matriz analisa a config que está de fato em produção, não uma cópia que pode ter ficado desatualizada.

## Onde entregar

Os arquivos finais vão como `1-sysmon_coverage_matrix.ps1` e `sysmon_coverage_matrix.json`, no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
