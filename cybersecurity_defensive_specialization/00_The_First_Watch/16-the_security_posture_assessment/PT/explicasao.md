# O que você precisa fazer

Esse é o documento final que junta **tudo**. Não é uma análise nova — é a montagem profissional de tudo que você já produziu, nas 16 tasks anteriores, num único relatório executivo. Pense nisso como editar, não pesquisar.

## Passo 1 — Um mapa de "qual task alimenta qual seção"

Isso evita que você fique perdido:

| Seção do relatório | De onde vem |
|---|---|
| 1. Sumário Executivo | Escrito por último, resumindo tudo — nunca escreva primeiro |
| 2. Escopo e Metodologia | Task 0 (contexto/sites) + lista de todos os artefatos usados (onboarding packet, diagnósticos, artefatos de controle, varredura de rede, violações reais) |
| 3. Panorama de Ativos | Task 7 (registro) + Task 8 (top 5 críticos + classificação) |
| 4. Controles de Segurança Atuais | Task 10 (matriz completa + efetividade) |
| 5. Análise de Lacunas | Task 12 (lacunas) + Task 13 (reavaliadas/ampliadas com casos reais) |
| 6. Recomendações de Tratamento | Task 14 (as 7 decisões + orçamento) |
| 7. Conclusão e Próximos Passos | Task 15 (conexão com o trabalho do Marcus sobre ameaças externas) |

## Passo 2 — O Sumário Executivo é a parte mais importante e a mais difícil

O enunciado é claro: **"um leitor que só ler a página 1 precisa entender tudo."** Isso significa nada de jargão técnico aqui — "rede plana" vira algo como "não existe separação entre os sistemas, então um problema em qualquer parte se espalha pra tudo". Pense em quem é o leitor: o Conselho, que não sabe o que é VLAN, IDOR ou SIEM.

Estrutura sugerida pro veredito geral: comece pela pergunta que o Task 0 já colocou desde o início do projeto — *"o que exatamente estamos protegendo, e o quão bem estamos protegendo?"* — e responda com honestidade, sem suavizar.

O achado mais crítico único: você já tem material forte pra isso. Pense em qual lacuna, sozinha, aparece repetida em mais lugares do projeto (dica: a ausência de detecção — GAP-002 — é citada como causa raiz em praticamente todo incidente e em todas as 3 violações reais do Task 13).

## Passo 3 — Não reinvente números, só resuma os que já existem

Seções 3 e 4 pedem **contagens e resumos**, não nova análise:
- Quantos ativos por tipo? Conte direto da tabela do Task 7 (25 ativos, por Tipo).
- Quantos controles por categoria/função? Já está pronto na Matriz do Task 10.
- Maturidade geral: você já concluiu isso no próprio Task 5 e reforçou no Task 12 — a organização é forte em Preventivo, quase inexistente em Detectivo/Corretivo/Compensatório/Dissuasório.

## Passo 4 — A Análise de Lacunas aqui é uma versão "para o Conselho" do Task 12/13

Você não precisa reescrever as 19 lacunas inteiras com todos os 5 campos técnicos. Para cada lacuna Crítica/Alta, condense em uma versão executiva: o que é, o que afeta, o que pode acontecer, o que fazer — sem o jargão de "Category x Function Missing".

## Passo 5 — Recomendações e orçamento já estão prontos

Isso é praticamente copiar a estrutura do Task 14, só reformatando pelas categorias que o enunciado pede agora: Vitória Rápida (< 1 semana), Curto Prazo (< 1 mês), Roadmap de Longo Prazo. Reveja suas 7 decisões do Task 14 e classifique cada uma nesses 3 baldes usando o campo "Implementation Effort" que você já preencheu lá.

## Passo 6 — Conclusão conectando ao Task 15

O enunciado pede explicitamente pra você fazer a ponte com o trabalho inacabado do Marcus sobre ameaças externas — você já escreveu essa reflexão no Task 15, Parte 2. Reaproveite o raciocínio (não precisa ser idêntico, mas a lógica é a mesma: avaliação interna concluída → próximo passo lógico é entender quem quer atacar organizações como a MedDefense).

## Passo 7 — O teste de qualidade final

Antes de considerar pronto, releia e pergunte: **cada afirmação que fiz tem uma task/evidência específica por trás?** Se você escreveu algo que não consegue apontar de onde veio, tire ou reformule — essa é a mesma regra de ouro desde o Task 0 ("não invente informação que não está no material").

## Onde entregar

O arquivo final vai como `16-security_posture_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`. É o maior e mais formal documento do projeto — reserve tempo real pra montar com cuidado.
