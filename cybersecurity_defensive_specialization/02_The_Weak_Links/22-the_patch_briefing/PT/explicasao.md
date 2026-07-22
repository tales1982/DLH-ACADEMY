# O que você precisa fazer

Esse é o irmão mais curto e mais difícil da Tarefa 21: ao invés de um relatório completo, você tem 300 palavras pra dizer a mesma coisa que realmente importa pra quem vai aprovar dinheiro e tempo, não pra quem vai executar a correção.

## Passo 1 — Escolher as 3 vulnerabilidades é uma decisão editorial, não técnica

Você tem bem mais que 3 achados urgentes no seu Priority Matrix (Tarefa 20). A pergunta aqui não é "quais são tecnicamente os mais graves" — é "quais 3 um Conselho vai entender e vai se importar em ouvir, em 5 minutos". Prefira achados que você consegue explicar numa frase sem usar uma sigla técnica sequer, e que tenham uma consequência de negócio clara e concreta.

## Passo 2 — "Sem jargão" é um teste de verdade, não um conselho vago

Pra cada uma das 3, escreva a explicação técnica primeiro (do jeito que você escreveria pra um analista), depois reescreva sem usar nenhuma das palavras: CVE, CVSS, exploit, patch, vetor, AJP, PostgreSQL (a menos que precise nomear o sistema por clareza), TLS, ou qualquer sigla de três letras. Se sobrar alguma dessas palavras na versão final, reescreva de novo.

## Passo 3 — "O que acontece se explorada" precisa ser concreto, não genérico

Não escreva "isso pode comprometer dados sensíveis". Escreva o cenário real: que tipo de informação, de quantas pessoas, e — sempre que der pra amarrar com algo que já aconteceu na história da MedDefense (releia o Registro de Ativos do 1x00) — mencione que isso não é hipotético, é repetição.

## Passo 4 — O custo precisa ter as duas dimensões: tempo E dinheiro

"Rápido e barato" e "rápido e caro" são mensagens completamente diferentes pra quem aprova orçamento. Seja específico nas duas frentes pra cada uma das 3, mesmo que brevemente.

## Passo 5 — A frase final sobre "3 semanas" é sobre a jornada, não sobre detalhes

Essa frase não deveria mencionar achados específicos — ela deveria contar a história em uma linha: de "não sabíamos o que tínhamos" pra "sabemos exatamente onde a ameaça encontra a fraqueza". Pense nela como o gancho que conecta esse briefing aos dois projetos anteriores (1x00 e 1x01), sem exigir que quem ouve tenha lido nenhum dos dois.

## Passo 6 — Conte as palavras de verdade antes de entregar

300 palavras é um limite rígido, não uma sugestão. Cole seu texto final (sem os cabeçalhos e a seção de Repo) num contador de palavras antes de considerar pronto.

## Onde entregar

O arquivo final vai como `22-patch_briefing.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`.
