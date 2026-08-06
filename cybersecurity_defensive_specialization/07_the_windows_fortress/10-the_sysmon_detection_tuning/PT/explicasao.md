# O que você precisa fazer

## Passo 1 — `RuleGroup` é como você soma regras específicas em cima de uma baseline genérica, sem reescrevê-la

O `sysmonconfig.xml` da Tarefa 9 já loga a maior parte da criação de processos (`onmatch="exclude"` — loga tudo, exceto a lista de exclusão). A Tarefa 10 não reescreve essa lógica: ela ADICIONA um `<RuleGroup>` novo e nomeado, com suas próprias regras `onmatch="include"`. Esse é o mesmo padrão usado por configurações modulares reais do Sysmon (como o projeto `sysmon-modular` do Olaf Hartong) — você combina vários grupos de regras, cada um com seu próprio propósito, em vez de manter um arquivo monolítico gigante. A vantagem prática de nomear cada regra (`name="MedDefense_Rclone_Exfiltration"`) é que esse nome aparece no próprio evento do Sysmon gerado (campo `RuleName`), então um analista olhando o log já sabe QUAL regra específica disparou, sem precisar adivinhar.

## Passo 2 — `groupRelation="and"` vs `"or"` é a diferença entre "qualquer um destes" e "todos estes"

As Regras 1, 2 e 3 têm uma condição só, então o `groupRelation` não importa muito. Mas as Regras 4 e 5 combinam DUAS condições (imagem do processo E conteúdo da linha de comando) que precisam ser verdadeiras AO MESMO TEMPO — por isso usam `groupRelation="and"`. Se você usasse `"or"` por engano, a Regra 4 dispararia para QUALQUER execução de `vssadmin.exe` (incluindo `vssadmin list shadows`, uso legítimo e comum de administradores), gerando ruído em vez de uma detecção precisa.

## Passo 3 — Todo gatilho de teste é desenhado para ser seguro, não para realmente fazer a coisa ruim

- Regra 1: copia o `notepad.exe` (inofensivo) para um arquivo chamado `rclone.exe` e roda por meio segundo — o Sysmon casa pelo NOME do processo, não pelo que ele faz de verdade.
- Regra 2: cria a MESMA chave de registro que o PsExec cria (`HKLM:\...\Services\PSEXESVC`) sem nunca instalar ou rodar um serviço de verdade — e remove a chave logo depois.
- Regra 4: aponta o `vssadmin delete shadows` para um GUID de shadow copy que não existe (`{00000000-0000-0000-0000-000000000000}`) — o comando roda e aparece no log exatamente como o ataque real apareceria, mas retorna "nenhum item encontrado" e não apaga nada de verdade.
- Regra 5: cria uma tarefa agendada desabilitada/inofensiva (`cmd.exe /c exit`) com um nome claramente de teste, e a remove logo em seguida.

Esse é o mesmo princípio de qualquer teste de detecção em produção: você quer provar que a REGRA funciona, sem reproduzir o dano que a regra existe para prevenir.

## Passo 4 — Manipular XML via DOM (`CreateElement`/`AppendChild`) é mais seguro do que concatenar strings

Seria mais rápido escrever a nova regra como um pedaço de texto XML e colar antes do `</EventFiltering>` — mas isso quebra silenciosamente se o arquivo original tiver uma formatação ligeiramente diferente do esperado. Usar `$configXml.CreateElement(...)` e `AppendChild(...)` garante que o resultado final seja sempre XML válido, não importa como o arquivo de entrada estava formatado, porque você está manipulando a árvore de objetos, não texto bruto.

## Onde entregar

Os arquivos finais vão como `10-sysmon_tune.ps1` e `sysmonconfig.xml`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
