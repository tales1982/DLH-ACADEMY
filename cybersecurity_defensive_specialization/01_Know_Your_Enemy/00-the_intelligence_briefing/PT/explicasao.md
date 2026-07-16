# O que você precisa fazer

Esse é o primeiro exercício de um projeto novo — "Know Your Enemy" (Conheça Seu Inimigo). Diferente do projeto anterior, que olhava pra dentro da MedDefense (o que ela tem, o que falta), este olha pra fora: quem quer atacar organizações como ela. Você recebe 6 arquivos de inteligência que o Marcus coletou mas nunca organizou, e precisa transformar isso numa análise estruturada.

## Passo 1 — Leia como analista, marcando 4 categorias

Igual fizemos no Task 0 do projeto anterior (o pacote de integração bagunçado), aqui a estratégia é a mesma: leia tudo uma vez pra entender o quadro geral, depois releia marcando cada trecho como pertencente a uma das 4 seções pedidas:

- **Panorama de Agentes** — quem são, motivação, sofisticação
- **Lógica de Direcionamento** — por que a saúde é atraente
- **Tendências** — o que está mudando
- **Relevância pra MedDefense** — isso nos atinge?

## Passo 2 — As categorias de agentes já estão nomeadas no Arquivo 2

O Arquivo 2 (nota do HC3) já separa 5 categorias bem definidas: Crime Organizado/Ransomware, Estado-Nação, Ameaças Internas, Hacktivistas, e Atacantes sem Habilidade/Oportunistas. Você não precisa inventar a taxonomia — precisa **resumir cada uma** com os 3 atributos pedidos (quem são, motivação, sofisticação), puxando também informação complementar dos outros 5 arquivos quando disponível.

## Passo 3 — "Não apenas liste, explique o mecanismo"

Essa instrução é a mais importante do exercício. Não basta escrever "dados de saúde valem mais" — você precisa explicar **por que** isso torna hospitais atraentes. Exemplo do próprio dossiê: dados de paciente valem $250-$1.000 por registro (vs $5-$50 de cartão de crédito) porque contêm tudo que é necessário pra roubo de identidade E fraude de seguro ao mesmo tempo — é o mecanismo que explica o número, não só o número.

Procure pelo menos 4 razões distintas — o dossiê tem bem mais que isso espalhado (urgência clínica, sistemas legados, seguro cibernético, pressão regulatória do HIPAA).

## Passo 4 — Tendências exigem evidência, não intuição

"Ataques estão aumentando" não vale nada sem um número por trás. O dossiê tem várias tendências mensuráveis: a dupla extorsão em 73% dos casos, o valor do resgate que dobrou entre 2022-2024, a saúde sendo o setor mais visado (25% de todos os incidentes). Escolha pelo menos 2 e cite o dado exato que sustenta cada uma.

## Passo 5 — A Relevância pra MedDefense é onde você aplica julgamento

Para cada uma das 5 categorias, pergunte: dado o perfil da MedDefense (hospital regional, 2.000 funcionários, sem pesquisa, dados regulados), esse tipo de agente provavelmente miraria a gente? O próprio Marcus já deixou um rascunho de avaliação disso no Arquivo 6 (probabilidade Crítica pra ransomware, Baixa pra estado-nação, etc.) — você pode concordar, discordar ou refinar, mas justifique com uma frase própria, não só copie a conclusão dele.

## Onde entregar

O arquivo final vai como `0-threat_landscape_summary.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.

---

Quer tentar montar o Panorama de Agentes sozinho primeiro, ou prefere que eu monte uma categoria como exemplo?
