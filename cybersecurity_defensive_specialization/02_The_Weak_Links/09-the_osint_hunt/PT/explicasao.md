# O que você precisa fazer

Esse exercício muda a fonte de dados: ao invés de trabalhar em cima do relatório de scan que já foi entregue, você vai pesquisar na internet aberta o que aquele relatório não podia ter visto. É a diferença entre "ler o que me deram" e "ir atrás do que ninguém me deu".

## Passo 1 — Antes de pesquisar, releia por que cada uma das 3 áreas ficou de fora

Volte no Task 0 e nas notas de metodologia do scan. O relatório já te diz explicitamente que não cobriu nuvem (O365) nem dispositivos móveis. Pro FortiGate, pense de forma diferente: o scan cobriu o range `10.10.0.0/16` — isso inclui o próprio firewall enquanto dispositivo de rede, ou só os hosts que estão *atrás* dele? Essa distinção é o que você vai escrever no campo "Por Que o Scan Não Detectou" de cada vulnerabilidade.

## Passo 2 — Pesquise por produto e versão específicos, não por "vulnerabilidade genérica"

Pra achar CVEs relevantes de verdade (não qualquer CVE aleatório do produto), use os detalhes específicos que você já tem: FortiGate **100F**, Synology **DSM 7** (a versão exata importa — releia o Achado 015 do relatório de scan pra ver se ele menciona alguma versão de DSM). Se o achado original não menciona a versão, isso já é uma pista importante pro seu campo "Por Que o Scan Não Detectou".

## Passo 3 — Nem toda vulnerabilidade de nuvem tem CVSS/CVE tradicional

Vulnerabilidades que vivem inteiramente na infraestrutura de um provedor de nuvem (como o Entra ID) às vezes são corrigidas pelo próprio fornecedor no backend, sem exigir nenhuma ação do cliente — o que muda como você documenta "CVSS/Severidade" nesse campo. Não force um número que não existe; explique o que você encontrou.

## Passo 4 — "Impacto na MedDefense" precisa amarrar com o que você já sabe da organização

Não escreva um impacto genérico tipo "isso pode ser explorado por atacantes". Conecte com ativos específicos (qual Top 5 Ativo Crítico do 1x00 Task 8 isso afeta?) e com gaps já documentados (esse achado piora algum GAP do 1x00 Task 12, ou cria um caminho pra algo que os Kill Chains do 1x01 Task 10 já descreveram?).

## Passo 5 — A recomendação nem sempre é "aplicar patch"

Para a vulnerabilidade de nuvem em especial, pense: se o fornecedor já corrigiu o problema no lado dele, o que resta pra MedDefense fazer? Às vezes a recomendação certa não é técnica — é de processo (por exemplo, garantir que a equipe de segurança receba e leia os avisos do fornecedor).

## Onde entregar

O arquivo final vai como `9-osint_hunt.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. As 3 vulnerabilidades pesquisadas (FortiOS, O365/Entra ID, Synology DSM), cada uma com os 6 campos pedidos.
