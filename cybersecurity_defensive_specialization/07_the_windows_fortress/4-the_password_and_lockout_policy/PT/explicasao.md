# O que você precisa fazer

Esta é a primeira tarefa do módulo que MUDA o domínio de verdade. E tem uma pegadinha conceitual importante que derruba muita gente.

## Passo 1 — A "Política de Senha" NÃO é uma configuração por GPO comum

Diferente de quase tudo que você configura via `Set-GPRegistryValue`, a política de senha e bloqueio de conta (Account Policies) é um atributo do PRÓPRIO DOMÍNIO — não algo que "pertence" à GPO em si. Na prática, o Windows só aplica Account Policies vindas de GPOs vinculadas na RAIZ do domínio, e mesmo assim, o mecanismo real por baixo dos panos é o cmdlet `Set-ADDefaultDomainPasswordPolicy`, que edita diretamente os atributos LDAP do objeto de domínio (`minPwdLength`, `lockoutThreshold`, etc.). É por isso que o script cria a GPO (para rastreamento/documentação — ela aparece no console do GPMC, tem um nome, um comentário, uma vinculação) MAS usa `Set-ADDefaultDomainPasswordPolicy` para de fato aplicar o valor. Se você tentar usar `Set-GPRegistryValue` para isso, vai descobrir que não existe uma chave de registro para "comprimento mínimo de senha" — porque essa configuração nunca foi um valor de registro.

## Passo 2 — "Idade máxima: 0" não é um erro de digitação

Isso significa "a senha nunca expira por tempo". Parece contraintuitivo (pensa-se em segurança como "trocar senha regularmente"), mas é literalmente a recomendação atual do NIST SP 800-63B: forçar troca periódica de senha incentiva as pessoas a escolherem senhas fracas e previsíveis (ex: "Verao2026!" → "Outono2026!"). A defesa real vem do comprimento mínimo alto (14), complexidade, histórico de 24 (impede reuso) e bloqueio agressivo — não da rotação forçada.

## Passo 3 — Idempotência aqui significa "verificar antes de criar/vincular", não "sempre sobrescrever"

`Get-GPO -Name $GpoName -ErrorAction SilentlyContinue` antes de `New-GPO` evita erro em uma segunda execução (o PowerShell lança exceção se você tentar criar uma GPO com nome já existente). O mesmo vale para o vínculo: `Get-GPInheritance` mostra os links já existentes na raiz do domínio, então você só cria um novo vínculo se ele ainda não existir — rodar o script duas vezes não deve gerar dois links duplicados.

## Passo 4 — `Invoke-GPUpdate` força a atualização só na máquina indicada

`Invoke-GPUpdate -Computer $env:COMPUTERNAME` força a atualização no próprio DC (onde você está rodando o script). Em um domínio de produção com 280 estações, você rodaria isso contra cada computador (ou esperaria o ciclo de atualização automático de ~90 minutos) — mas como o Account Policy é um atributo de domínio, ele já vale para autenticações Kerberos imediatamente, independente do `gpupdate` nas estações.

## Onde entregar

O arquivo final vai como `4-password_policy.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
