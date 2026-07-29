# O que você precisa fazer

Essa tarefa é uma pesquisa técnica de verdade, não uma simulação. O CVE-2023-27997 existe e é real. O trabalho aqui tem três camadas: o que o CVE É, se ele é EXPLORÁVEL na prática, e o que ele significa ESPECIFICAMENTE para o equipamento da MedDefense.

## Passo 1 — Não pule a Parte 1 achando que é só "preencher campos"

O vetor CVSS v3.1 (algo como `AV:N/AC:L/PR:N/UI:N/...`) não é decoração — cada letra desse vetor é usada depois na Parte 3, quando você ajusta a nota com métricas ambientais. Se você não entender o que cada métrica do vetor original significa, não vai conseguir justificar o ajuste depois.

## Passo 2 — A Pontuação de Explorabilidade não é a mesma coisa que a nota CVSS

Lembre da escala que você criou em 1x02 T4: ela mede o quão fácil é para um atacante real conseguir e usar um exploit (existe PoC público? Está em frameworks como Metasploit? Está sendo explorado ativamente?). Um CVE pode ter CVSS alto e Explorabilidade baixa (exploit teórico, difícil de weaponizar) ou o contrário. Aqui, o fato de estar no catálogo CISA KEV já é um sinal fortíssimo — CVEs no KEV são, por definição, exploração confirmada em ambiente real.

## Passo 3 — O ajuste ambiental tem que refletir a MedDefense, não o mundo em geral

Pense nas 4 pistas que o enunciado te dá: FortiGate sem redundância, todos os túneis VPN dependem dele, ele aparece em 3 cadeias de ataque diferentes do seu próprio 1x01, e o contrato de suporte expirado significa que mesmo sabendo do problema, a correção está bloqueada por um obstáculo administrativo. Cada uma dessas pistas deve mover uma métrica ambiental específica (Modified Attack Vector, Confidentiality/Integrity/Availability Requirements, etc.) — não é "geral, a MedDefense é vulnerável", é "essa métrica específica sobe porque X".

## Passo 4 — A resposta final é uma comparação, não só um número

O ponto da Parte 3 é mostrar que a nota ajustada é MAIS alta que a nota base — e explicar por quê em termos que a diretoria entenderia (ex.: "não é só uma falha crítica genérica, é uma falha crítica no único ponto de entrada que sustenta os 3 sites, e não podemos corrigi-la hoje por causa de um contrato vencido").

## Onde entregar

O arquivo final vai como `1-cve_deep_dive.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x05_board_briefing`.
