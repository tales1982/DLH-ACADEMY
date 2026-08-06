# O que você precisa fazer

Esta é a Tarefa 0 do módulo Windows — o mesmo papel que `0-baseline_snapshot.sh` teve no 2x00: fotografar o estado atual do domínio ANTES de qualquer GPO de hardening ser criada. Sem isso, você não consegue provar depois que as Tarefas 4 e 5 (política de senha, auditoria) realmente mudaram alguma coisa.

## Passo 1 — Este script é só leitura, mas pode ser lento

`Get-ADUser -Filter *`, `Get-ADGroupMember` (recursivo) e `Get-GPO -All` fazem várias consultas ao Active Directory. Em um domínio de laboratório com 14 contas isso é instantâneo, mas é o mesmo padrão de código que rodaria em um domínio de 2.000 usuários — por isso o script não faz nada além de ler e relatar; nenhuma alteração é feita no AD.

## Passo 2 — `msDS-SupportedEncryptionTypes` é a parte mais estranha da tarefa

Não existe um atributo único "o domínio aceita RC4" — o que existe é um atributo por conta (`msDS-SupportedEncryptionTypes`) que é um bitmask (1=DES-CRC, 2=DES-MD5, 4=RC4, 8=AES128, 16=AES256). Quando esse atributo está vazio ou zero — o que é o padrão em um domínio nunca endurecido — significa que NENHUMA restrição foi aplicada, então efetivamente todos os tipos que o KDC aceita ainda funcionam. Usamos a conta `krbtgt` como o proxy mais confiável do comportamento padrão do domínio, porque ela é a conta central do protocolo Kerberos.

## Passo 3 — Os "Findings" desta tarefa são deliberadamente simples

A Tarefa 1 vai construir um motor de findings completo, orientado a evidências. Aqui, o pedido é apenas um resumo — por isso a lógica de severidade é direta (comprimento mínimo < 14 → Critical, lockout threshold = 0 → Critical, DES/RC4 aceitos → Critical, contas com PasswordNeverExpires → High, etc.). Não tente reconstruir a Tarefa 1 aqui; o objetivo desta tarefa é dar um número rápido para orientar a conversa com James Chen, não uma fila de remediação completa.

## Passo 4 — `Get-SmbServerConfiguration` só enxerga a máquina local

Como só temos acesso direto ao DC01 (não aos 280 workstations), o `EnableSMB1Protocol` só reflete o estado do próprio controlador de domínio. Isso é intencional e suficiente para esta tarefa — o SMBv1 nos workstations é um problema para hardening de endpoint mais adiante, não para o reconhecimento do domínio.

## Onde entregar

O arquivo final vai como `0-domain_baseline.ps1`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
