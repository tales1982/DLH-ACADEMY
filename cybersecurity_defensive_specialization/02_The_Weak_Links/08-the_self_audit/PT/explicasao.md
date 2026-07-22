# O que você precisa fazer

Esse é o único exercício do bloco que sai da tela e mexe numa máquina de verdade. É proposital: você só entende o que um scanner realmente faz quando roda um.

## Passo 1 — Rode com `sudo` de verdade, ou saiba exatamente o que perde sem ele

O comando pedido é `sudo lynis audit system`. Se por algum motivo você rodar sem `sudo` (por exemplo, numa sessão onde não consegue digitar a senha interativamente), o Lynis não trava — ele roda em "modo não-privilegiado" e te avisa explicitamente, no final, quais testes ele pulou por falta de privilégio (geralmente coisas como permissões de arquivos de configuração do sudo, conteúdo de regras do iptables, detecção de criptografia de disco). Se isso acontecer com você, não finja que rodou completo — documente honestamente que rodou sem privilégio e liste os testes pulados. Isso é, aliás, o mesmo tipo de limitação que o próprio scan da MedDefense teve nos dispositivos médicos (scan não-autenticado = visibilidade reduzida) — a analogia vale a pena registrar.

## Passo 2 — Hardening Index é só o resumo. A substância está nos Warnings e Suggestions

Depois que o Lynis termina, ele imprime uma nota única (0-100) — isso é fácil de copiar, mas não é a parte que importa. A parte que importa são as seções de "Warnings" (problemas que o Lynis considera mais sérios) e "Suggestions" (melhorias recomendadas, geralmente uma lista bem mais longa). Se você rodou sem privilégio e teve poucos ou nenhum Warning, não conclua que sua máquina está perfeita — pode ser só que os testes que gerariam Warning nunca rodaram.

## Passo 3 — "Categoria" no Lynis não tem uma nota separada — você precisa construir essa visão

O Lynis não imprime "Autenticação: 85/100, Rede: 60/100" em lugar nenhum da saída padrão. O que você tem é: quantos testes rodaram em cada categoria (o prefixo do ID do teste, tipo AUTH-, NETW-, FILE-, te dá isso) e quantas sugestões/avisos vieram de cada categoria. Você mesmo precisa cruzar essas duas contagens pra decidir qual categoria "foi melhor" ou "foi pior" — seja transparente sobre estar fazendo essa inferência, em vez de fingir que o Lynis te deu uma nota pronta.

## Passo 4 — A projeção pra MedDefense não é chute — é dedução a partir do que você já sabe

Você já tem um dossiê enorme sobre o `billing-srv-01`: Ubuntu 18.04 sem ESM (Achado 011), MySQL aberto pra rede toda (Achado 006), SSH com senha habilitada (Achado 009), sem antivírus em nenhum servidor Linux (GAP-005 do 1x00), e um histórico real de cryptominer não detectado por semanas (1x00 Task 2). Cada uma dessas informações aponta pra um teste específico do Lynis que quase certamente dispararia. Não invente achados genéricos de Lynis — conecte cada previsão a um fato que você já tem documentado sobre esse host especificamente.

## Onde entregar

O arquivo final vai como `8-lynis_audit.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. As três partes: Instalar e Rodar (contextualizado), Análise de Resultados, e Projeção para a MedDefense.
