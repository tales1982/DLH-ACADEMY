# 11. Os Falsos Positivos

**Objetivo:** Identificar e documentar falsos positivos no relatório de scan, e entender por que a validação antes de agir é essencial.

## Contexto

Agir em cima de um falso positivo desperdiça recursos. Ignorar um positivo verdadeiro cria risco. Saber diferenciar os dois é uma das habilidades mais subestimadas em gestão de vulnerabilidades.

O relatório de scan contém 2-3 achados que, após investigação, não são vulnerabilidades reais no contexto específico da MedDefense. O scanner os anotou para investigação pela SecurePoint, que sinalizou pelo menos um explicitamente. Seu trabalho é encontrar todos eles e provar por que são falsos positivos.

## Instruções

Revise o relatório de scan procurando achados que podem ser falsos positivos. Identifique pelo menos 2 e, para cada um:

- **ID do Achado:** [Do relatório de scan]
- **Vulnerabilidade Reportada:** [O que o scanner alegou]
- **Por Que É Um Falso Positivo:** [Explicação técnica]
- **Método de Validação:** [Como você confirmaria que isso é um FP? Qual teste ou verificação?]
- **Risco de Agir Sobre Esse FP:** [Que recursos seriam desperdiçados se você tratasse isso como um achado real?]
- **Risco de Não Validar:** [O que aconteceria se isso NÃO fosse um FP e você o descartasse?]

**Dica:** Leia o relatório de scan com atenção. A SecurePoint sinalizou pelo menos um achado com uma nota sobre possível status de falso positivo. Existem outros que exigem sua própria análise.

Depois da análise de FP, responda: Num relatório de scan de 31 achados, qual é uma taxa de falso positivo razoável de se esperar de um scanner automatizado? Por que a validação manual é essencial antes de comprometer recursos de correção?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `11-false_positives.md`
