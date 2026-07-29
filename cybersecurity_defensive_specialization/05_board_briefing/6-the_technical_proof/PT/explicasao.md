# O que você precisa fazer

Diferente das outras tarefas do módulo, essa é 100% prática — você precisa rodar comandos de verdade na sua máquina e colar a saída real. Não dá para "simular" essa tarefa escrevendo o que você acha que aconteceria.

## Passo 1 — Certificado: escolha um site que você já conhece o suficiente para validar a saída

Rode algo como `openssl s_client -connect exemplo.com:443 -servername exemplo.com </dev/null 2>/dev/null | openssl x509 -noout -text`. Se você já fez a tarefa de anatomia de certificado (1x04), os campos aqui são exatamente os mesmos que você já sabe ler — Subject, Issuer, datas de validade, o algoritmo da chave pública, e a extensão `subjectAltName`.

## Passo 2 — Hash: a resposta de "por que importa" não é genérica

Pense especificamente no cenário do FortiGate: se você baixa um arquivo de firmware de um servidor comprometido ou de uma conexão interceptada, o arquivo pode ter sido alterado (por exemplo, com uma backdoor). Comparar o hash SHA-256 do arquivo baixado com o hash publicado pelo fabricante é a forma de provar que o arquivo não foi alterado no caminho — mesmo uma mudança de 1 bit muda o hash inteiro (efeito avalanche).

## Passo 3 — Exploit: conecte com o que você já fez na Tarefa 1

Você já pesquisou o CVE-2023-27997 na Tarefa 1 (Mergulho no CVE). Aqui você está confirmando na prática, com uma ferramenta local, se existe um exploit catalogado no Exploit-DB. Se a resposta for sim, isso reforça (com evidência de linha de comando, não só teoria) a urgência que você já defendeu na Tarefa 1.

## Passo 4 — Auditoria: a sugestão para o billing-srv-01 precisa ser plausível

O Lynis vai te dar dezenas de avisos genéricos do SEU sistema (provavelmente um laptop Linux/WSL, não um servidor de produção). Escolha os 3 avisos mais relevantes para um SERVIDOR (não para uma estação de trabalho pessoal) e pense em qual desses se aplicaria de forma realista a um servidor de faturamento com dados financeiros sensíveis — coisas como configuração de firewall, atualizações pendentes, ou permissões de arquivo são bons candidatos.

## Onde entregar

O arquivo final vai como `6-technical_proof.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
