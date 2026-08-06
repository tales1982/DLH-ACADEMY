# O que você precisa fazer

## Passo 1 — "Apenas Auditoria" não é uma versão fraca do AppLocker — é uma fase obrigatória

`EnforcementMode="AuditOnly"` faz o AppLocker registrar (Event Viewer, canal `AppLocker`) o que TERIA sido bloqueado, sem bloquear nada de verdade. Pular direto para `Enforce` em um ambiente com 280 estações e aplicações que você nunca inventariou completamente é a receita clássica para travar uma aplicação crítica (como o próprio `DicomViewer.exe`) sem aviso — por isso a tarefa é explícita: fica em auditoria "durante o período de testes." Passar para Enforce é uma tarefa futura, depois de revisar os logs de auditoria por tempo suficiente.

## Passo 2 — A regra "Deny \*" é redundante por design, e ainda assim vale a pena

Tecnicamente, assim que uma coleção de regras do AppLocker (`RuleCollection`) tem QUALQUER regra definida, o comportamento padrão dela já vira "negar tudo que não bater com uma regra de permissão explícita" — você não precisaria de uma regra de Deny explícita no final. Mas adicionar ela mesmo assim tem valor: ela aparece no XML de forma visível (qualquer pessoa lendo o arquivo entende a intenção sem precisar saber a regra implícita do AppLocker) e gera entradas de log mais claras durante a auditoria. Isso é uma escolha de clareza operacional, não uma necessidade técnica.

## Passo 3 — Regra de caminho (Path) é mais fraca que regra de editor (Publisher) — e a tarefa pede a mais fraca de propósito

Uma regra de caminho (`FilePathRule`) permite QUALQUER arquivo que esteja naquele caminho exato — se um atacante conseguisse substituir o `DicomViewer.exe` real por um payload malicioso NO MESMO CAMINHO, a regra de caminho permitiria a execução do payload sem questionar. Uma regra de Publisher (baseada no certificado de assinatura de código da MedImage Corp) sobreviveria a essa substituição, porque valida a ASSINATURA, não o caminho. A tarefa pede especificamente uma regra de caminho para o DicomViewer — o script segue essa instrução, mas documenta em comentário que a regra de Publisher é a recomendação real de produção. Saber a diferença entre as duas é o tipo de julgamento profissional que este módulo cobra o tempo todo.

## Passo 4 — `Test-AppLockerPolicy` não aceita XML bruto — ele precisa de um objeto de política de verdade

Uma armadilha comum: tentar passar o `[xml]` que você acabou de montar direto para `-PolicyObject`. O cmdlet espera um objeto do tipo `AppLockerPolicy` (o mesmo tipo que `Get-AppLockerPolicy` devolve), não um documento XML genérico. O caminho correto é: aplicar o XML exportado à política LOCAL da máquina com `Set-AppLockerPolicy -XmlPolicy`, depois ler de volta com `Get-AppLockerPolicy -Local` para obter o objeto certo — e só então testar com `Test-AppLockerPolicy`. Isso também tem uma vantagem prática: testar contra a política local não depende de esperar a replicação da GPO até o controlador de domínio.

## Onde entregar

Os arquivos finais vão como `12-applocker_config.ps1` e `applocker_policy.xml`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
