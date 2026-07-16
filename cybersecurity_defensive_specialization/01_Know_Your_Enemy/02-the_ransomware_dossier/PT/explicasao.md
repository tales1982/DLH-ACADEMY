# O que você precisa fazer

Esse exercício conecta diretamente com o projeto anterior — você vai pegar o perfil de um grupo de ransomware fictício (mas realista) e cruzar com a sua própria Análise de Lacunas (Task 12 do projeto 1x00) pra mostrar exatamente por onde a MedDefense seria atacada.

## Passo 1 — Resumo do Modelo Operacional: só organize, não interprete ainda

Essa primeira seção é só extração factual do Documento 1 e 2 do perfil BlackReef: quem são os desenvolvedores (ficam com a fatia menor, 20-30%), quem são os afiliados (fazem o trabalho sujo, ficam com 70-80%), e as 6 fases do ataque (acesso → reconhecimento → escalação → exfiltração → criptografia → extorsão). Não precisa reescrever tudo, só condensar com suas palavras.

## Passo 2 — Lógica de Direcionamento: combine 2 fontes, não repita uma só

O enunciado pede que você use **o perfil do BlackReef E o dossiê do Task 0** juntos. Isso significa que sua resposta deve mostrar que as duas fontes concordam (o que reforça o argumento) — por exemplo, tanto o dossiê da HC3 quanto o manual de afiliados do BlackReef citam a urgência clínica e o valor do dado como razões. Escolha pelo menos 3 fatores e cite de qual documento cada um vem.

## Passo 3 — Avaliação de Exposição: aqui você usa sua própria Análise de Lacunas

Essa é a parte mais valiosa do exercício. Volte no seu Task 12 (Gap Analysis) do projeto anterior e pergunte: **na ordem em que o BlackReef ataca (Fase 1 a 6), qual das minhas lacunas já documentadas se encaixa em cada fase?**

Um jeito de pensar nisso, seguindo o próprio ciclo de vida do BlackReef:
- **Fase 1 (Acesso):** qual lacuna já documentada é literalmente uma porta de entrada voltada à internet, sem correção?
- **Fase 2 (Reconhecimento/movimento lateral):** qual lacuna permite que, uma vez dentro, o atacante alcance qualquer coisa sem barreira?
- **Fase 3 (Escalação de privilégio):** você documentou alguma lacuna sobre como as credenciais de administrador de domínio são geridas? (Dica: isso apareceu no Task 13/15 do projeto anterior, não no Task 12 original — o "Teste de Realidade" e a "Revisão do Antecessor" adicionaram gaps novos.)
- **Fase 2/backup (neutralizar backup antes de criptografar):** qual lacuna é sobre onde o backup fica guardado?

Escolha 4 dessas, na ordem em que o ataque realmente aconteceria, não na ordem em que você as listou originalmente no Task 12.

## Passo 4 — Avaliação de Probabilidade: junte números com fatos específicos

A escala pedida (Crítica/Alta/Média/Baixa) precisa de dois tipos de evidência ao mesmo tempo:
- **Estatística do setor:** algum número do dossiê do Task 0 (ex: % de incidentes por vetor, taxa de pagamento, etc.)
- **Fator específico da MedDefense:** algo da sua própria avaliação de postura (ex: os 3 hospitais da região já atingidos, o perfil de porte que bate exatamente com o que o BlackReef busca)

Uma avaliação que usa só um dos dois tipos é mais fraca do que uma que cruza os dois.

## Onde entregar

O arquivo final vai como `2-ransomware_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
