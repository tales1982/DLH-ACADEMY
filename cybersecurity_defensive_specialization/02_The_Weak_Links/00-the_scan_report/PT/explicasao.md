# O que você precisa fazer

Você recebeu um relatório de scan de verdade: 31 achados, indo de Crítico a Informativo. A armadilha do exercício é a mais óbvia possível — pular direto pros 4 Críticos e ignorar o resto. O exercício pede exatamente o oposto: leia tudo primeiro, sem pesquisar nada, e só depois organize o que você viu.

## Passo 1 — Metadados: quem, quando, como

Antes de olhar pra qualquer achado, releia o cabeçalho do relatório e as "SCAN METHODOLOGY NOTES" no final. Pergunte-se: o scan foi autenticado em tudo, ou só em parte? Isso muda o quanto você deve confiar em certos achados (pense especificamente nos dispositivos médicos — eles foram escaneados com ou sem credencial?).

## Passo 2 — Distribuição de severidade: faça a conta você mesmo

O cabeçalho do relatório já te dá uma contagem por severidade (Crítico/Alto/Médio/Baixo/Informativo). Não confie nela cegamente — conte você mesmo, achado por achado. Ao contar, preste atenção especial ao **Achado 031**: ele foi "adicionado pela SecurePoint" como achado manual, depois do resto do relatório. Isso muda alguma coisa na contagem original que o cabeçalho apresenta? Esse é exatamente o tipo de coisa que separa quem lê por cima de quem lê com atenção.

## Passo 3 — Mapa de calor: cruze com o Registro de Ativos

Conte quantos achados cada host tem. Depois, pra cada host no seu top 5, volte no **Registro de Ativos do 1x00 (Tarefa 7)** e identifique o papel dele (é um dos Top 5 Ativos Críticos? já foi comprometido antes?). Um host com 6 achados pequenos pode importar menos que um host com 1 achado enorme, dependendo do que esse host é.

## Passo 4 — Primeiras observações: procure relações, não achados isolados

Não analise achado por achado isoladamente — procure conexões:
- Dois achados no mesmo host formam uma cadeia (um dá acesso, o outro escala privilégio)?
- Algum achado é consequência direta de outro (por exemplo, um achado que só existe porque outro achado nunca foi corrigido)?
- Algum achado já apareceu antes, em projetos anteriores (1x00, 1x01)? Reaparecer não é coincidência — costuma ser prova de que uma causa raiz nunca foi corrigida.
- O próprio relatório aponta que um dos achados pode ser falso positivo. Vale a pena ler esse trecho com atenção redobrada.

## Passo 5 — Limitações do scan: pense no que está fora da tela

Releia as notas de metodologia com a pergunta "o que isso NÃO me mostra?" na cabeça. Depois pense além do que está escrito explicitamente: um scan autenticado só em parte do ambiente, feito numa única madrugada, tem limitações que vão além da lista explícita de "não cobrimos X, Y, Z". Pense também no que o James já disse sobre o scan ser uma "foto de uma noite" — o que isso implica sobre CVEs publicados depois da data do scan?

## Onde entregar

O arquivo final vai como `0-first_impressions.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Cinco seções: Metadados do Scan, Distribuição de Achados, Mapa de Calor de Ativos, Primeiras Observações, e Limitações do Scan.
