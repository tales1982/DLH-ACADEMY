# O que você precisa fazer

Essa tarefa tem três blocos de configuração PAM que ficam em arquivos diferentes: qualidade de senha (`/etc/security/pwquality.conf`), bloqueio de conta (arquivos PAM em `/etc/pam.d/`, geralmente `common-auth` no Ubuntu) e histórico de senha (`/etc/pam.d/common-password`).

## Passo 1 — Os valores `dcredit`, `ucredit`, `lcredit`, `ocredit` são negativos por design

No `pwquality.conf`, um valor negativo como `dcredit = -1` significa "exija pelo menos 1 dígito", não "permita -1 dígitos". É uma convenção estranha da ferramenta, mas é assim que ela funciona: `dcredit` = dígitos, `ucredit` = maiúsculas, `lcredit` = minúsculas, `ocredit` = caracteres especiais.

## Passo 2 — `pam_faillock` no Ubuntu 22.04 já vem parcialmente configurado, verifique antes de duplicar

O Ubuntu 22.04 usa `pam-auth-update` como camada de abstração sobre os arquivos PAM. Editar diretamente `/etc/pam.d/common-auth` funciona, mas se você rodar `pam-auth-update` depois, ele pode sobrescrever suas mudanças manuais. Para esse script, editar diretamente com verificação de idempotência (checar se a linha já existe antes de adicionar) é o caminho mais controlável.

## Passo 3 — "remember 12" no `common-password` exige o módulo `pam_pwhistory` ou o parâmetro `remember` do `pam_unix`

Dependendo da versão, você configura isso adicionando `remember=12` na linha do `pam_pwhistory.so` (ou `pam_unix.so`, mais antigo) dentro de `/etc/pam.d/common-password`. Teste no ambiente real do laboratório para confirmar qual módulo está disponível antes de decidir qual editar.

## Passo 4 — Sempre faça backup dos arquivos PAM antes de editar

Um erro de sintaxe em `/etc/pam.d/common-auth` pode travar TODO login no sistema, incluindo o seu próprio acesso root/sudo. Copie os arquivos originais para `.bak` antes de qualquer `sed`, e teste a autenticação (por exemplo, abrindo uma segunda sessão SSH) antes de encerrar a sessão atual.

## Onde entregar

O arquivo final vai como `8-pam_hardening.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
