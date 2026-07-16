# O que você precisa fazer

Esse é o exercício de "juntar tudo". Você já levantou pedaços de informação sobre ativos da MedDefense em quase todas as tasks anteriores — agora o trabalho é **consolidar tudo numa única lista**, sem duplicar e sem perder nada, e depois comparar essa lista com uma varredura de rede nova pra ver o que bate e o que não bate.

## Passo 1 — Entenda que isso não é um exercício de descoberta, é de organização

Você não vai inventar informação nova. Você vai **voltar** nos arquivos que a gente já produziu e catalogar cada ativo mencionado neles. Pense nisso como um exercício de "arrumar o armário": tudo que já existe, só que espalhado em 6 gavetas diferentes, agora precisa virar uma gaveta só.

## Passo 2 — Onde procurar em cada task

- **Task 0 (Environment Summary):** aqui está o grosso — a seção "IT Infrastructure Identified" já lista servidores, equipamento de rede, endpoints e dispositivos médicos. É o seu ponto de partida principal.
- **Tasks 1-2 (Incidentes):** os incidentes mencionam ativos específicos por nome (`billing-srv-01`, o notebook do estagiário, o portal do paciente). Alguns desses já estavam no Task 0, mas talvez com detalhes novos (ex: o Task 2 revelou que `billing-srv-01` roda Apache 2.4.29 — um detalhe de plataforma que talvez não estivesse no Task 0).
- **Task 3 (Observações físicas):** aqui aparecem ativos que talvez não estivessem na lista de TI original — o monitor de sinais vitais com IP `10.10.3.47`, por exemplo, é um ativo de verdade que só apareceu nessa task.
- **Task 4 (Controles):** os artefatos de controle mencionam ativos "de leve" — ex: o NAS-01 do backup, ou os controladores de domínio (`ad-dc-01`, `ad-dc-02`).
- **Task 6 (MRI):** o aparelho de ressonância magnética em si é um ativo — Tipo "IoT Médico", com todos os detalhes que você já levantou (Windows XP, mesma VLAN, etc.).
- **Arquivo novo (varredura de rede):** quando esse arquivo chegar, ele vai servir como uma segunda fonte independente — pra comparar com tudo que você já catalogou.

## Passo 3 — Um truque pra não se perder: monte uma lista de rascunho primeiro

Antes de preencher a tabela final com todos os 10 campos, sugiro passar por cada task e simplesmente **listar os nomes dos ativos que aparecem**, sem se preocupar com os detalhes ainda. Só depois de ter essa lista de nomes é que você preenche os campos de cada um. Isso evita esquecer algum ativo no meio do processo.

## Passo 4 — Como preencher os campos

A maioria já é familiar de tasks anteriores:
- **Type** (Tipo): use as 7 categorias dadas — não invente uma nova.
- **Status:** esse é novo. "Active" é o padrão. "Shadow IT" é pra algo que existe mas ninguém documentou oficialmente (ex: lembra do notebook do estagiário no Task 1? Isso é um exemplo clássico de Shadow IT). "Unknown" é pra quando você não tem certeza se ainda existe (ex: o segundo servidor da Westside que o Marcus mencionou mas nunca confirmou, no Task 0).
- **Network Segment:** normalmente vai ser algo como `10.10.0.0/16` (a rede plana do Central) — mas preste atenção em ativos que estão em segmentos diferentes (a Westside, por exemplo, tem sua própria configuração de rede, mais isolada).

## Passo 5 — A parte de Reconciliação (a mais interessante)

Essa seção final é onde o exercício realmente testa se você prestou atenção. Você vai comparar duas listas — a sua (consolidada dos documentos) e a da varredura de rede — e procurar por:

1. **Coisas que só aparecem na varredura** → isso é Shadow IT em potencial: um dispositivo que existe na rede, mas ninguém documentou. É exatamente o tipo de achado que assusta um CISO.
2. **Coisas que só aparecem nos seus documentos, não na varredura** → pode significar que o ativo foi desligado, está numa rede que a varredura não cobriu, ou (mais preocupante) que a documentação está desatualizada.
3. **Contradições** → ex: se um documento diz que um servidor roda Windows Server 2016 e a varredura detecta uma versão diferente, isso é uma discrepância real que vale reportar.

## Onde entregar

O arquivo final vai como `7-asset_registry.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`. Mínimo de 20 ativos distintos.

---

O arquivo `network-scan-summary.txt` ainda não foi fornecido. Assim que você tiver esse conteúdo, me manda que eu crio a evidência (igual fizemos nos Tasks 2 e 4) e começamos a consolidar juntos.
