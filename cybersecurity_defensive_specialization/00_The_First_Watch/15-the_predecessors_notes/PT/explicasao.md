# O que você precisa fazer

Esse é o exercício mais narrativo do projeto — e também o que fecha o ciclo dos personagens. Você vai comparar seu trabalho contra um rascunho que o Marcus nunca terminou, e depois refletir sobre o que vem depois.

## Parte 1 — Análise Comparativa

### Passo 1: não trate isso como uma checklist mecânica

Pra cada um dos 8 achados formais do Marcus (M-01 a M-08), pergunte: **eu já documentei algo parecido, em qual task, com qual ID?** Muita coisa vai bater de cara — isso é esperado, já que vocês dois analisaram o mesmo ambiente. O valor do exercício está em ser específico na comparação, não em só dizer "concordo".

Algumas pontes que já dá pra ver, pra te ajudar a começar:
- **M-01 (rede plana)** — você já documentou isso desde o Task 0 e usou como causa raiz no Task 2 e no Task 6. Deve ter um Gap ID correspondente no Task 12.
- **M-02 (backup no mesmo local)** — isso já apareceu no Task 4 (artefato de backup) e provavelmente virou uma lacuna no Task 5/12.
- **M-05 (sem MFA)** — o Task 0 já registrava isso como observação; verifique se você formalizou como lacuna ou só como observação solta.
- **M-07 (credencial compartilhada da radiologia)** — mesmo achado do Task 0, já com a mesma citação da Sarah sobre "acesso rápido entre pacientes".

### Passo 2: quando você discorda, use evidência, não opinião

Se a severidade que o Marcus deu for diferente da sua (ex: ele marcou algo como Alto e você tinha marcado como Médio, ou vice-versa), não é pra só "escolher um lado" — explique com base em quê você discorda, citando o Gap ID ou Control ID específico que sustenta sua visão.

### Passo 3: a Seção 2 do rascunho do Marcus é ouro — são achados novos de verdade

Repare que a Seção 2 ("Findings Not Yet Documented") tem coisas que **não apareceram em nenhuma outra task do projeto**: TLS 1.0 habilitado no portal do paciente, ausência de DLP, portas USB sem restrição, o sistema de gestão predial da HQ fora do controle da MedDefense, e — o mais interessante — a **ausência de um processo formal de gestão de mudanças**.

Esse último item resolve um mistério que estava solto desde o Task 1: lembra que o Incidente A dizia que o backup disponível tinha 3 semanas de atraso "devido a um cron job mal configurado"? O Marcus explica aqui, nessa mesma nota, que foi exatamente **a falta de um processo de gestão de mudanças** que permitiu aquela alteração sem teste. Vale conectar esses dois pontos explicitamente na sua análise.

### Passo 4: o que você viu que o Marcus não viu

Pense nas tasks que aconteceram **depois** do período em que ele escreveu isso (rascunho é de 3 meses atrás — mas o Marcus já tinha saído há 3 meses quando você chegou, então ele nunca teve acesso a nada que você descobriu). Bons candidatos:
- Os 2 dispositivos Shadow IT que você achou na varredura de rede (Task 7) e os 3 casos que o Mike Torres contou (Task 11) — o Marcus nunca teve a varredura de rede nem essa conversa.
- A situação completa do MRI (Task 6) — curiosamente, ele **não** lista isso como um dos achados M-01 a M-08 formais, mesmo sabendo do problema (lembra do post-it: "this has been on my desk for 6 months"). Isso é uma boa oportunidade de hipotetizar por quê: talvez ele soubesse mas nunca tenha tido tempo de formalizar, exatamente como o documento inteiro ficou incompleto.

## Parte 2 — A Última Página

Essa reflexão final (3-4 frases) não é sobre resumir o que o Marcus escreveu — é sobre conectar duas ideias: **tudo que você fez até aqui foi olhar pra dentro** (o que a MedDefense tem, o que falta). O que o Marcus deixou como próximo passo é olhar **pra fora** (quem quer atacar organizações como a MedDefense, e como). Pense: sua avaliação interna já aponta, sozinha, pra que tipo de atacante a MedDefense seria um alvo atraente? (Dica: releia a lista de motivos do próprio Marcus na Seção 3 — urgência de pagamento por causa de vidas em jogo, sistemas legados, valor do PHI no mercado negro.)

## Onde entregar

O arquivo final vai como `15-predecessor_review.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.
