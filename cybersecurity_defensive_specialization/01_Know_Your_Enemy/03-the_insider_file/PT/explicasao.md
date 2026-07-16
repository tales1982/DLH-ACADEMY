# O que você precisa fazer

Diferente dos Tasks 0-2 (que olhavam pra ameaças externas), aqui você aplica a mesma disciplina de análise pra ameaças que já estão **dentro** da MedDefense. Os 5 cenários não são hipotéticos genéricos — são situações que você já viu, com nomes e detalhes, em tasks anteriores do projeto 1x00. Isso não é coincidência: o exercício quer que você **releia seu próprio trabalho anterior** com um olhar novo.

## Passo 1 — Malicioso vs. Negligente: a pergunta certa

Não pergunte "isso foi ruim?" — os dois tipos são ruins. Pergunte: **"a pessoa sabia que estava fazendo algo errado, e fez de propósito?"** Se sim, é malicioso. Se a pessoa só estava tentando resolver um problema real (lentidão, backlog, comodidade) sem entender o risco, é negligente. Cuidado com os casos que combinam os dois — um cenário pode ter uma causa raiz negligente (uma lacuna de processo) e ainda assim conter uma ação específica maliciosa dentro dele. Volte a pensar na mesma armadilha do Relatório F do Task 1: às vezes tem duas camadas.

## Passo 2 — Onde procurar cada referência do 1x00

- **Cenário 1 (login compartilhado):** você já documentou esse exato problema. Procure o Gap ID relacionado às credenciais da radiologia na sua Análise de Lacunas.
- **Cenário 2 (conta fantasma):** o enunciado diz que isso "espelha" o Incidente F — mas repare que os detalhes são diferentes (aqui é uma conta VPN de contratado, lá era o notebook do estagiário). O paralelo é estrutural: acesso não autorizado, sem monitoramento, por semanas. Você documentou uma lacuna sobre desligamento/desprovisionamento de conta em algum momento depois do Task 12 original — vale revisar o que veio do Teste de Realidade (Task 13).
- **Cenário 3 (NAS pessoal):** isso é literalmente o Dr. Patel do Task 11 (Shadow Systems). Puxe direto de lá.
- **Cenário 4 (funcionária curiosa):** repare que o próprio dossiê de inteligência do Task 0 já citou esse padrão exato — "curiosity-driven unauthorized access (celebrity snooping)" — como um tipo específico de insider malicioso. Use essa definição.
- **Cenário 5 (admin sobrecarregado):** esse pode não ter uma lacuna correspondente exata no seu Task 12 — e tudo bem, o próprio formato de resposta permite dizer "nenhuma" no campo de Controle Existente ou Lacuna Explorada, desde que você justifique por que não encontrou uma.

## Passo 3 — Indicadores Comportamentais precisam ser coisas que dariam pra observar ANTES do dano

Não repita a descrição do cenário — pense em **sinais que um sistema de monitoramento ou um colega atento poderia ter notado**. Exemplos do tipo de raciocínio esperado: horário incomum de acesso, volume de dados fora do padrão, uma conta que deveria estar desativada sendo usada, acesso a um registro sem nenhuma relação clínica com o profissional.

## Passo 4 — A Avaliação de Padrão final

Essa pergunta quer que você enxergue o que **conecta** os 5 cenários, não que você resuma cada um de novo. Pense: o que esses 5 casos têm em comum sobre *como* a MedDefense lida com acesso e confiança? (Dica: pelo menos 2 achados do projeto 1x00 já apontam pra essa mesma raiz — um sobre credenciais/autenticação, outro sobre monitoramento/detecção.)

## Onde entregar

O arquivo final vai como `3-insider_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
