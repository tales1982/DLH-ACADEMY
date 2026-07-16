# O que você precisa fazer

Você já tem os 25 ativos individuais do Registro (Task 7). Agora não é para analisar cada um separadamente — é para **agrupá-los em categorias** e avaliar a criticidade de cada categoria nos três pilares CIA.

## Passo 1 — Como agrupar os 25 ativos em 8-10 categorias

Pense em categorias por **função de negócio**, não por tipo técnico. Usando o que já temos no Registro do Task 7, uma divisão natural seria:

1. **Sistema EHR** → A-001 (ehr-srv-01), A-002 (ehr-db-01)
2. **PACS/Imagem** → A-003 (pacs-srv-01)
3. **Infraestrutura de Faturamento** → A-004 (billing-srv-01)
4. **Núcleo de Rede** → A-020 (FortiGate), A-021 (APs), A-022 (armário de rede)
5. **IoT Médico** → A-014 (MRI), A-015 (monitores), A-016 (bombas), A-017 (monitor não identificado)
6. **Endpoints Clínicos** → A-013 (frota de estações), estações de enfermagem
7. **Endpoints Administrativos/Shadow IT** → A-023 (notebook do estagiário), estações de admin
8. **Sistemas de Segurança Física** → A-018 (crachá), câmeras, guarda
9. **Infraestrutura de Backup/Dados** → A-009 (backup-srv-01), A-010 (NAS-01)
10. **Aplicações Voltadas ao Paciente** → A-018... espera, já usei A-018 acima — reveja e não repita um ativo em duas categorias. Use A-011 (web-srv-01) e o Portal do Paciente aqui.

Você não precisa usar exatamente essas — mas a lógica é: **cada categoria deve significar algo diferente pro negócio**, não só "todos os servidores Linux".

## Passo 2 — Avaliando os 3 pilares por categoria (não por ativo individual)

Para cada categoria, pergunte três vezes:

- **Confidencialidade:** se essa categoria vazasse informação, quão grave seria?
- **Integridade:** se essa categoria fosse alterada sem autorização, quão grave seria?
- **Disponibilidade:** se essa categoria saísse do ar, quão grave seria?

Repare que a resposta pode ser bem diferente entre os três pilares dentro da mesma categoria. Exemplo: o Sistema EHR provavelmente é Crítico nos três. Já a categoria "Sistemas de Segurança Física" pode ser Médio em Confidencialidade (crachás vazados não são catastróficos) mas Alto ou Crítico em Integridade (se alguém forjar acesso, isso compromete a segurança física de todo o hospital).

## Passo 3 — A armadilha da Justificativa genérica

O enunciado é bem claro: **"contém dados de paciente" vale zero**. Você precisa de números e consequências reais. Sempre que puder, use os fatos que você já levantou nas tasks anteriores:

- Quantidade: "50.000 pacientes", "~200 dispositivos médicos conectados" (do Task 0/rascunho do Marcus)
- Consequência regulatória: notificação obrigatória, violação de HIPAA
- Consequência financeira: custo de litígio, multa
- Consequência clínica: "médicos recorrendo a papel" (isso já aconteceu no Task 1, Incidente E — use como prova real, não hipótese)

Uma boa justificativa sempre responde: **"o quê, quanto, e o que acontece depois."**

## Passo 4 — Escolhendo o Overall Criticality

É sempre o **maior** dos três pilares, nunca uma média. Uma categoria que é Baixo em Confidencialidade e Integridade, mas Crítico em Disponibilidade, tem Overall Criticality = Crítico. Isso é de propósito — na saúde, um único pilar comprometido já pode custar uma vida, então não faz sentido "diluir" o risco fazendo média.

## Passo 5 — Top 5 Ativos Mais Críticos

Depois da matriz por categoria, você precisa descer um nível e apontar **ativos específicos** (não categorias) — provavelmente vindos das categorias que ficaram Crítico em mais de um pilar. Pense: qual desses, se cair, mata alguém, para o hospital inteiro, ou vaza o máximo de dados de uma vez?

## Onde entregar

O arquivo final vai como `8-criticality_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`.
