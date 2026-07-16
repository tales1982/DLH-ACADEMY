# 13. O Teste de Realidade

**Objetivo:** Validar os achados internos da análise de lacunas contra dados reais de violações no setor de saúde, para calibrar prioridades de risco e identificar pontos cegos.

## Contexto

James Chen te manda uma mensagem:

> "Antes de finalizarmos o relatório para o Conselho, eu quero que você confira nossos achados contra o que está realmente acontecendo no mundo real. Nossas prioridades estão certas? Estamos deixando passar algo que está derrubando outros hospitais?"

## Arquivos Fornecidos

- `healthcare-breach-summaries.txt` (contém 3 resumos anonimizados de violações reais no setor de saúde dos últimos 2 anos, cada um com 2-3 parágrafos descrevendo o vetor de ataque, as fragilidades exploradas, o impacto e as lições aprendidas)

## Instruções

Leia os três resumos de violação com atenção. Para cada violação:

1. **Identificação do Vetor de Ataque:** Qual foi o ponto de entrada inicial? Que fragilidades foram exploradas?
2. **Correlação com a MedDefense:** Revise sua Análise de Lacunas (Task 12). Identifique quais das suas lacunas documentadas teriam permitido esse mesmo tipo de ataque contra a MedDefense. Referencie Gap IDs específicos.
3. **Checagem de Ponto Cego:** Essa violação revela uma fragilidade que você NÃO identificou na sua análise de lacunas? Se sim, adicione-a como uma nova lacuna (com documentação completa, seguindo o formato do Task 12). Se não, explique qual lacuna existente já cobre isso.

Depois de analisar as três violações, produza:

### Reavaliação de Prioridade

Com base nos dados do mundo real, alguma das suas prioridades de lacuna precisa mudar? Identifique quaisquer lacunas que você elevaria ou rebaixaria de nível de risco, e justifique cada mudança.

### Análise de Padrão (um parágrafo)

Ao longo das três violações, que fatores em comum você enxerga? O que isso diz sobre onde a MedDefense deveria focar seu orçamento limitado de segurança?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `13-reality_check.md`
