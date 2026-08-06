# O que você precisa fazer

## Passo 1 — Este script é o único do módulo inteiro que é 100% somente-leitura

Todas as tarefas anteriores (4 a 14) MUDAM o sistema. A Tarefa 15 só LÊ o estado atual e compara contra os valores esperados — nenhuma chamada a `Set-*`, `New-*` ou `secedit /configure` deve aparecer aqui. Isso é o mesmo contrato do `15-validation.sh` do módulo 2x00: o script de validação nunca corrige nada, ele só relata. Se ele corrigisse automaticamente o que encontra errado, James Chen não teria como saber que algo REALMENTE quebrou entre uma sexta e outra.

## Passo 2 — PASS/WARN/FAIL não são intercambiáveis — a diferença decide o código de saída

`FAIL` é reservado para configurações que representam um risco de segurança inaceitável (por exemplo, SMBv1 ainda habilitado). `WARN` é para algo que merece atenção mas não é uma emergência (por exemplo, a senha de uma conta de serviço com 235 dias — acima do ideal, mas não uma falha crítica de controle). O código de saída (`exit 1` vs `exit 0`) só reage a `FAIL` — isso é o que permite que este script seja plugado em um pipeline de CI/CD ou em uma tarefa agendada que dispara um alerta: um `WARN` não deveria acordar ninguém às 3 da manhã, um `FAIL` deveria.

## Passo 3 — Cada bloco de verificação roda isolado, então uma falha não derruba o relatório inteiro

`Invoke-CheckBlock` envolve cada seção (Senha, Auditoria, PowerShell, Sysmon, etc.) no seu próprio `try/catch`. Se, por exemplo, o Sysmon não estiver instalado, aquele bloco especificamente reporta `FAIL` para as checagens do Sysmon, mas o script continua e ainda produz o relatório completo das outras 8 seções — um único componente ausente não deveria impedir você de ver o resto do painel de conformidade.

## Passo 4 — Ler a configuração ATIVA do Sysmon de volta é mais confiável do que confiar em um arquivo XML salvo no disco

Em vez de simplesmente abrir o `sysmonconfig.xml` de alguma pasta e contar as regras (o que só provaria que o ARQUIVO tem 5 regras, não que elas estão realmente aplicadas), o script roda `Sysmon64.exe -c` — que devolve a configuração REALMENTE ativa no serviço agora. Isso captura um cenário real: alguém pode ter editado o XML depois da última instalação e esquecido de rodar `-c` de novo para aplicar; nesse caso, o arquivo em disco mentiria, mas `Sysmon64.exe -c` sempre reflete a verdade.

## Passo 5 — `SupportedEncryptionTypes -band 0x3` cobre os DOIS bits do DES, não só um

O bitmask de tipos de criptografia Kerberos tem dois valores possíveis para DES (`0x1` = DES-CBC-CRC, `0x2` = DES-CBC-MD5). Testar `-band 0x3` (0x1 OR 0x2) garante que a verificação capture DES desabilitado independente de qual das duas variantes estivesse ligada — testar só `-band 0x1` deixaria passar despercebido um cenário onde apenas `0x2` estivesse habilitado.

## Onde entregar

O arquivo final vai como `15-master_validation.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
