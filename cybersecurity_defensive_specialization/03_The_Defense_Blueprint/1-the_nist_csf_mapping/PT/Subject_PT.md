# 1. O Mapeamento do NIST CSF

**Objetivo:** Aplicar o NIST CSF 2.0 à MedDefense mapeando a postura de segurança atual da organização em cada uma das seis funções principais.

## Contexto

O NIST CSF 2.0 organiza todas as atividades de segurança em seis funções: Govern/Governar (estabelecer e monitorar a estratégia de segurança), Identify/Identificar (entender o que você precisa proteger), Protect/Proteger (implementar salvaguardas), Detect/Detectar (encontrar incidentes quando acontecem), Respond/Responder (agir sobre incidentes detectados), Recover/Recuperar (restaurar operações após um incidente). Cada função contém categorias e subcategorias que descrevem resultados específicos.

Isso não é um exercício teórico. Você está construindo o Perfil Atual da MedDefense, um retrato realista de onde a organização está hoje em relação a cada função. Esse perfil vai se tornar a base para o Perfil-Alvo (onde a MedDefense precisa estar), e o gap entre eles direciona toda a estratégia.

## Arquivos Fornecidos

- `nist-csf-reference.txt` (resumo das funções, categorias e subcategorias-chave do CSF 2.0)

## Instruções

Para cada uma das 6 funções do CSF, avalie a maturidade atual da MedDefense usando uma escala de 4 níveis:

| Nível | Descrição |
|---|---|
| Not Implemented (Não Implementado) | Nenhuma atividade existe para essa função |
| Partial (Parcial) | Alguma atividade existe mas é informal, inconsistente ou incompleta |
| Managed (Gerenciado) | A atividade é documentada, repetível e cobre a maior parte do escopo |
| Optimized (Otimizado) | A atividade é contínua, medida e ativamente melhorada |

Produza um Perfil Atual do NIST CSF para a MedDefense:

- **Função:** [Nome]
- **Nível Atual:** [Not Implemented / Partial / Managed / Optimized]
- **Evidência:** [Que achados específicos dos Projetos 1x00, 1x01 e 1x02 sustentam essa avaliação?]
- **Lacunas-Chave:** [Qual é o gap mais significativo dentro dessa função?]
- **Nível-Alvo:** [Onde a MedDefense deveria estar em 6 meses? Justifique.]

Alguns pontos de calibração pra guiar sua avaliação:

- **Identify:** Você construiu o inventário de ativos no 1x00. A MedDefense já tinha um antes de você chegar?
- **Protect:** O scan de vulnerabilidades (1x02) revelou o estado dos controles protetivos da MedDefense. Como você os avaliaria?
- **Detect:** As notas do Marcus mencionaram capacidade zero de monitoramento. O que isso significa pra essa função?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x03_defense_blueprint`
- **Arquivo:** `1-nist_csf_mapping.md`
