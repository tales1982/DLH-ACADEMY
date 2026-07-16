# O que você precisa fazer

Você já encontrou pistas de Shadow IT antes (o notebook do estagiário no Task 1, os dois dispositivos não identificados na varredura do Task 7). Agora o Mike Torres te dá **3 casos novos e concretos**, de viva voz, e você precisa tratar cada um com o mesmo rigor: Avaliação de Risco → Resposta Recomendada → Atualização do Registro.

## Passo 1 — Uma pista importante escondida na fala do Mike

Repare bem: o Mike descreve um **Raspberry Pi em algum lugar do segundo andar do Central**, que o Marcus pediu ao estagiário pra configurar como "monitor de rede", e que ninguém mexe desde que os dois saíram.

Agora volte no Task 7: você encontrou um dispositivo **UNKNOWN-01** (`10.10.2.99`), Linux, com SSH e dois serviços web rodando, que a Sarah não sabia identificar e suspeitava ser "do Marcus ou do estagiário". **Isso pode muito bem ser o mesmo dispositivo.** Não é uma certeza absoluta — mas é um cruzamento de fontes que vale a pena registrar explicitamente na sua Atualização do Registro (em vez de criar uma entrada totalmente nova, considere se isso é a mesma entrada A-012 ganhando mais contexto).

## Passo 2 — Avaliando cada um dos 3 casos

Para cada sistema, pense nas 3 perguntas de risco separadamente:

**NAS pessoal do Dr. Patel (Cardiologia):**
- Que dado? Ele mesmo disse: "dados de pesquisa". Pesquisa clínica pode conter dados de pacientes reidentificáveis, dependendo do estudo.
- Controles que não cobrem: nenhum dos controles do Task 10 foi desenhado pensando nesse dispositivo — ele nunca foi inventariado, então não tem backup, não tem antivírus, não está no escopo de nada.
- Pior cenário: pense em disponibilidade (perda de dados de pesquisa sem backup) e confidencialidade (dispositivo doméstico, sem os mesmos padrões de segurança de um NAS corporativo).

**Google Drive do Marketing (vinculado a Gmail pessoal):**
- Que dado? Materiais de imprensa/mídia — normalmente classificação mais baixa (Público/Interno), mas pense se comunicados ainda não publicados poderiam ser sensíveis antes do lançamento.
- Controles que não cobrem: esse dado está **fora da rede da MedDefense inteiramente** — nenhum controle de perímetro (firewall, VPN) tem qualquer efeito sobre ele.
- Pior cenário: pense no que acontece se a pessoa dona da conta Gmail pessoal sair da empresa — quem mantém acesso? A empresa perde o controle sobre o próprio conteúdo.

**Raspberry Pi (2º andar, Central):**
- Que dado? Aqui é diferente dos outros dois — não é sobre dado armazenado nele, é sobre o que ele **pode alcançar**, já que foi montado como "monitor de rede" (o que normalmente implica acesso amplo de visibilidade da rede).
- Controles que não cobrem: nenhum, porque ninguém sabe que ele existe oficialmente — é literalmente invisível para qualquer controle do Task 10.
- Pior cenário: um dispositivo esquecido, sem manutenção há meses, com potencial acesso de rede amplo, é exatamente o tipo de coisa que um atacante adoraria encontrar e usar como ponto de apoio.

## Passo 3 — Escolhendo a Resposta Recomendada certa pra cada um

Não force a mesma resposta pros 3. Pense no que faz sentido pra cada situação:

- Um dispositivo com função real que as pessoas precisam (o NAS do Dr. Patel resolve um problema real de lentidão) é candidato mais forte a **Legitimar e Proteger** ou **Migrar** — descontinuar sem alternativa só faz o problema voltar escondido.
- Um serviço que já tem equivalente corporativo disponível (o Drive do Marketing, se a MedDefense já tem O365/SharePoint) é candidato natural a **Migrar**.
- Um dispositivo esquecido, sem dono claro, sem função documentada, e que ninguém sabe se ainda serve pra algo, é o candidato mais forte a **Descontinuar** — mas só depois de confirmar que não vai quebrar nada (o "monitor de rede" pode ainda estar em uso silenciosamente).

## Passo 4 — A pergunta final de política

Pense: o que os 3 casos têm em comum? Nos três, alguém resolveu um problema real (lentidão, comunicação, monitoramento) **por fora** dos canais oficiais, provavelmente porque o canal oficial era lento demais ou nem existia. Uma boa recomendação de política ataca essa causa raiz, não só proíbe a solução paralela.

## Onde entregar

O arquivo final vai como `11-shadow_systems.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.
