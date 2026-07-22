# O que você precisa fazer

Esse exercício muda a régua de gravidade: aqui, a pergunta não é só "quão explorável é isso", mas "o que acontece com um ser humano se isso for explorado". É o primeiro exercício do bloco que pede pra você pensar em segurança do paciente, não só em segurança da informação.

## Passo 1 — Ao pesquisar o boletim da BD, confira a versão exata com cuidado

O relatório de scan diz que as bombas rodam firmware 12.1.2. Ao pesquisar o boletim de segurança real da BD (CVE-2020-25165), preste muita atenção em duas coisas separadas: (1) qual faixa de versões o boletim descreve como **vulnerável**, e (2) a partir de qual versão o problema foi **corrigido**. Compare essas duas informações com a versão que a MedDefense realmente roda (12.1.2) — e não assuma que, só porque o achado do scan existe, a versão instalada necessariamente ainda está vulnerável a essa CVE específica. Às vezes a pesquisa revela uma coisa diferente do que o relatório sugere à primeira vista — e se isso acontecer com você, essa é uma descoberta legítima, não um erro seu.

## Passo 2 — Separe "vulnerabilidade de firmware" de "recomendação de mitigação" — são duas coisas diferentes

O boletim da BD provavelmente recomenda mais de uma coisa (atualizar o firmware E isolar os dispositivos na rede, por exemplo). O relatório de scan já te diz explicitamente se pelo menos uma dessas recomendações foi seguida ou não — releia o texto do Achado 010 com atenção a esse detalhe específico antes de concluir que "nada foi feito".

## Passo 3 — Pra Philips, pense em HL7 como um protocolo de dados clínicos, não só "mais uma porta aberta"

HL7 não é um protocolo genérico — ele carrega especificamente informação clínica (sinais vitais, em tempo real). Ao responder "que dados fluem" e "o que um atacante conseguiria fazer", pesquise sobre vulnerabilidades documentadas nessa exata família de monitores (não precisa ser a mesma CVE do scan) pra dar uma resposta concreta, ao invés de especular genericamente sobre "um atacante poderia ver dados".

## Passo 4 — A Dimensão de Segurança do Paciente pede uma comparação direta, palavra por palavra

Não escreva os dois parágrafos separados (um sobre TI, um sobre dispositivo médico) e deixe o leitor comparar. Escreva a comparação explicitamente: "enquanto uma estação de trabalho comprometida resulta em X, uma bomba de infusão comprometida resulta em Y" — essa estrutura de espelho é o que a pergunta está pedindo.

## Passo 5 — O Desafio de Correção pede fatores REAIS, não obstáculos genéricos de TI

"É difícil porque precisa de teste" vale pra qualquer patch de TI também — não é específico de dispositivo médico. Pense em barreiras que só existem PORQUE é um dispositivo médico: quem regula esse tipo de equipamento, quem tem autoridade legal pra alterar o firmware dele, e o que acontece fisicamente com o paciente se o dispositivo precisar sair de operação pra receber uma atualização.

## Onde entregar

O arquivo final vai como `15-medical_iot.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. As 4 seções: Avaliação BD Alaris, Avaliação Philips IntelliVue, Dimensão de Segurança do Paciente, e Desafio de Correção.
