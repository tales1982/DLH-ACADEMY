# O que você precisa fazer

Esse exercício pede pra você fazer um exercício mental controlado: pegar a mesma vulnerabilidade e rodar ela duas vezes, numa rede plana e numa rede imaginária segmentada, e comparar os dois resultados lado a lado.

## Passo 1 — Escolha 3 CVEs que representem tipos de ativo diferentes, não 3 variações do mesmo host

O valor do exercício vem da variedade: um CVE num servidor de aplicação (tipo o EHR), um CVE num servidor com exposição externa (tipo o de faturamento), e um CVE num dispositivo de categoria totalmente diferente (tipo um dispositivo médico ou uma estação de trabalho). Se você escolher 3 CVEs no mesmo host ou no mesmo tipo de ativo, a comparação fica repetitiva.

## Passo 2 — "Quem consegue alcançar" no Cenário A precisa de números reais, não "todo mundo"

Volte no resumo do scan de rede do 1x00 (Task 7) — ele te dá contagens aproximadas de quantos dispositivos existem em cada sub-rede (workstations, dispositivos médicos, sites remotos via VPN). Use esses números pra dar peso concreto à sua descrição de "quem alcança," ao invés de só escrever "qualquer um."

## Passo 3 — O Cenário B é hipotético, mas não pode ser arbitrário

Ao descrever a rede segmentada hipotética, baseie a segmentação em algo que já faz sentido pra esse host específico — por exemplo, um servidor de aplicação clínica ficaria numa VLAN de "servidores de aplicação clínica," não numa categoria genérica qualquer. Se o 1x00 já propôs uma segmentação específica pra algum dos ativos que você escolheu (releia o Task 6 sobre a ressonância magnética), use exatamente essa proposta ao invés de inventar uma nova.

## Passo 4 — "Risco Efetivo" muda entre os cenários, mas nem sempre da mesma forma

Preste atenção: a *nota CVSS* da vulnerabilidade nunca muda entre os dois cenários (é a mesma vulnerabilidade, não fica "menos grave" tecnicamente). O que muda é o *risco efetivo* — o quanto essa gravidade técnica realmente importa, dado quem consegue alcançá-la e o que está por perto. Deixe claro na sua resposta que você está separando essas duas coisas.

## Passo 5 — O Fator de Amplificação não precisa ser um número exato, mas precisa ser justificado

Você não tem como calcular matematicamente "a rede plana multiplica o risco por X." Mas você pode comparar proporções (por exemplo: quantos dispositivos alcançam a vulnerabilidade num cenário vs no outro) pra dar uma ideia concreta da escala da diferença, ao invés de só dizer "muito mais arriscado."

## Passo 6 — O parágrafo final pede uma comparação direta: segmentação vs patch

Pense no argumento central: corrigir um CVE fecha exatamente aquele problema. Segmentar a rede reduz o alcance de TODOS os problemas ao mesmo tempo — inclusive os que ninguém encontrou ainda. Seu parágrafo final devia deixar esse contraste bem explícito.

## Onde entregar

O arquivo final vai como `14-network_posture.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. As 3 análises de segmentação completas, mais o Resumo de Postura de Rede.
