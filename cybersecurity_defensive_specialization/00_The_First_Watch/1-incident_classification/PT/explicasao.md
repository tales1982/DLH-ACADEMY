# O que você precisa fazer

Este exercício é mais direto que o anterior (Task 0), mas exige raciocínio preciso. Você tem 6 incidentes reais do "Registro de Incidentes" do Marcus, e precisa classificar cada um usando a **Tríade CIA** como framework de análise.

## Passo 1 — Relembre os três pilares

- **Confidencialidade:** alguém viu informação que não deveria ver.
- **Integridade:** algo foi alterado sem autorização (ou por erro).
- **Disponibilidade:** algo que deveria estar acessível, não estava.

## Passo 2 — Para cada incidente, pergunte três coisas

1. **Qual pilar foi violado primeiro / de forma mais direta?** (pilar primário)
2. **Por quê?** — uma frase só, direta, ligando o fato do incidente ao pilar.
3. **Algum outro pilar também foi tocado, de forma secundária?** Nem todo incidente tem um pilar secundário — não force uma resposta se não houver.

## Passo 3 — Cuidado com a armadilha mais comum deste exercício

Vários desses incidentes *parecem* óbvios à primeira vista, mas o pilar primário correto depende de qual foi o **evento central relatado**, não de tudo que está ao redor dele. Alguns pontos de atenção:

- Um incidente pode ter uma *causa* relacionada a um pilar (ex: erro humano, falha de configuração) mas um *efeito* relacionado a outro. O pilar primário geralmente é o **efeito observado no negócio/paciente**, não a causa técnica.
- "Ransomware" não significa automaticamente Confidencialidade — ransomware criptografa (impede acesso), então o efeito direto costuma ser Disponibilidade. Se não houver evidência de exfiltração de dados, não presuma vazamento de confidencialidade.
- Um bug ou script que muda dados incorretamente é, por definição, uma questão de Integridade — mesmo que não tenha sido malicioso. A Tríade CIA classifica o *efeito*, não a intenção do agente.
- Uma migração que demora demais e derruba um sistema é Disponibilidade, mesmo sendo uma mudança planejada — "planejado" não significa "não é incidente".
- Um controle de acesso quebrado que expõe dado de um usuário para outro é Confidencialidade — mesmo que o "vazamento" tenha sido descoberto por acidente por um paciente educado, e não por um atacante.
- Cuidado com incidentes que tocam mais de um pilar ao mesmo tempo: pergunte-se se o segundo pilar é realmente afetado pelo incidente descrito, ou se é apenas uma consequência hipotética que não está no texto.

## Passo 4 — Monte a tabela pedida

O enunciado pede explicitamente uma **tabela formatada de classificação de incidentes**. Sugestão de colunas:

```markdown
| Incidente | Data | Pilar Primário | Justificativa | Pilar Secundário | Conexão |
|---|---|---|---|---|---|
| A | 15 jan | ... | ... | ... | ... |
```

Se um incidente não tiver pilar secundário, escreva algo como "Nenhum identificado" em vez de deixar a célula em branco — isso mostra que você considerou a pergunta e não apenas esqueceu de preencher.

## Passo 5 — Regra de ouro (igual à Task 0)

Justifique com base no que está escrito no incidente, não no que você imagina que "provavelmente" aconteceu também. Se o texto não menciona exfiltração de dados, não assuma que houve. A precisão da classificação é o que está sendo avaliado aqui, não a criatividade.

## Passo 6 — Onde entregar

O arquivo final vai como `1-incident_classification.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch` — mesmo padrão da Task 0.

---

Quer que eu monte com você a classificação do Incidente A como exemplo, para você aplicar o mesmo raciocínio nos outros cinco sozinho?
