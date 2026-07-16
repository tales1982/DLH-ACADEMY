# O que você precisa fazer

Esse exercício é diferente de todos os outros até agora. Você não está extraindo informação de um arquivo — está **desenhando uma solução** para um problema que, por definição, não tem solução óbvia. O enunciado já bloqueia as 4 saídas fáceis (corrigir, atualizar, trocar, desconectar), de propósito. Isso te obriga a pensar em **controles compensatórios** — lembra da definição lá do Task 4: *"uma alternativa usada quando o controle ideal não é viável."*

## Parte 1 — Análise de Risco (3-4 frases)

A pergunta não é "por que o MRI é vulnerável" (isso é óbvio: Windows XP sem patch desde 2014). A pergunta certa é: **por que isso é um risco pra rede inteira, não só pro MRI?** Para responder isso direito, você precisa conectar dois fatos do enunciado, não um só:

1. **Característica da vulnerabilidade:** o que significa, na prática, um sistema operacional sem nenhum patch há mais de 10 anos? (pense em quantas falhas públicas e ferramentas de ataque já existem pra explorar Windows XP — isso não é teórico, já causou incidentes famosos no mundo real)
2. **Característica da arquitetura de rede:** a estação do MRI está na **mesma VLAN** que todas as outras estações do hospital. O que isso significa sobre o que um atacante consegue alcançar a partir dali — ou o que consegue alcançar o MRI a partir de qualquer outra máquina comum?

Junte os dois: não é só "o MRI pode ser hackeado" — é "porque ele está na mesma rede que tudo mais, um comprometimento nele (ou de qualquer outra máquina) pode se espalhar pra ele/a partir dele." É a mesma lógica de "movimento lateral" que você já viu no Task 2 (o minerador de criptomoeda também se aproveitava de uma rede sem segmentação).

## Parte 2 — Estratégia de Controles Compensatórios (mínimo 3, de 2+ categorias)

Para cada controle, você precisa responder 4 perguntas — repare que são quase as mesmas do Task 4, mais uma nova:

1. O que ele faz, especificamente?
2. Categoria + Função (igual sempre fizemos)
3. **Como ele reduz o risco sem mexer no sistema operacional?** (essa é a regra de ouro deste exercício — qualquer ideia que dependa de mudar o Windows XP está automaticamente fora)
4. Que limitação ou risco residual ainda sobra depois desse controle? (nenhum controle compensatório é perfeito — ele reduz o risco, não elimina)

### Dicas de onde procurar ideias (sem te dar a resposta pronta)

- **Técnico:** pense no que você pode fazer **ao redor** da máquina, já que não pode mexer nela por dentro. O próprio enunciado do Task 4 já usa como exemplo de controle compensatório: *"isolamento de rede para um sistema que não pode ser corrigido."* Pense em como isso se aplicaria aqui, considerando que o MRI ainda *precisa* falar com o servidor PACS.
- **Administrativo:** o post-it do Marcus mostra que esse problema está sendo **ignorado** há 6 meses, sem nenhum processo formal. Pense num controle que não mude a tecnologia, mas mude o *processo* — quem decide, quem monitora, quem é avisado.
- **Físico:** pense em quem consegue chegar fisicamente perto dessa estação de trabalho. Se alguém conseguir se aproximar e plugar algo diretamente nela, isso contorna qualquer proteção de rede que você criar.

## Parte 3 — Prioridade de Implementação

Essa pergunta força você a **hierarquizar** suas próprias ideias. Pergunte-se: dos 3+ controles que você propôs, qual ataca a causa mais direta do risco (o que você identificou na Parte 1), e qual depende menos de pessoas lembrarem de fazer algo certo todo santo dia? Controles técnicos automáticos tendem a ser mais confiáveis no longo prazo do que controles que dependem 100% de disciplina humana — mas isso não é uma regra fixa, é algo pra você avaliar caso a caso.

## Onde entregar

O arquivo final vai como `6-compensating_controls.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.

---

Quer tentar escrever a Análise de Risco (Parte 1) sozinho primeiro, ou prefere que eu monte um exemplo de controle compensatório completo pra você usar como modelo?
