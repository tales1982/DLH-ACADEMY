# O que você precisa fazer

Esse exercício é de pesquisa e síntese pura — não tem dado técnico de scan pra analisar, o "achado" aqui é entender três sistemas de referência que qualquer profissional de segurança sênior precisa saber explicar sem gaguejar.

## Passo 1 — Pesquise cada framework separadamente antes de tentar compará-los

Resista à tentação de já sair escrevendo a comparação. Primeiro entenda cada um isoladamente: quem publica, pra que serve, como é organizado por dentro. Só depois de ter os três bem entendidos individualmente é que a comparação da Parte 2 vai fazer sentido de verdade, ao invés de virar uma lista de diferenças genéricas.

## Passo 2 — O "modelo mental" dado no enunciado é uma dica, não a resposta pronta

A frase "NIST CSF responde O QUÊ, CIS Controls responde COMO, ISO 27001 responde COMO PROVAR" já está no enunciado — não basta repetir essa frase, você precisa demonstrar que entende *por que* isso é verdade, com exemplos concretos de cada framework que ilustrem essa diferença de altitude.

## Passo 3 — Pense em "podem ser usados juntos" de forma literal, não abstrata

Muita gente trata frameworks como escolhas mutuamente exclusivas ("ou usamos NIST ou usamos ISO"). Pense num exemplo concreto de como uma organização usaria os três SIMULTANEAMENTE — por exemplo, qual documento cada um geraria, e como esses documentos se conectariam entre si.

## Passo 4 — A recomendação pra MedDefense precisa respeitar as restrições reais dela, não o "ideal teórico"

Não recomende "implementar os três completamente" só porque isso pareceria mais completo no papel. A MedDefense tem uma equipe de duas pessoas e nenhum framework formal hoje. Pense em qual combinação é realista de começar a implementar com os recursos que ela tem AGORA, e qual framework poderia esperar (sem dizer "nunca") pra mais adiante, à medida que o programa amadurece.

## Passo 5 — Justifique com as características específicas da MedDefense, não com "boas práticas genéricas"

O enunciado já te dá as pistas certas: hospital regional (não agência federal — isso elimina certas obrigações), sem framework atual (ponto de partida do zero), equipe pequena (elimina opções que exigem um departamento inteiro), precisa provar conformidade a reguladores e ao Conselho (isso pesa a favor de alguma coisa específica). Use cada uma dessas pistas explicitamente na sua justificativa.

## Onde entregar

O arquivo final vai como `0-framework_landscape.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. As 3 partes completas: Resumo dos Três Frameworks, Mapa de Relacionamento, e Seleção de Framework para a MedDefense.
