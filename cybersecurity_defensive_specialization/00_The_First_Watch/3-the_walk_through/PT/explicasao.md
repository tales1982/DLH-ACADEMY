# O que você precisa fazer

Este exercício troca o computador pela caminhada física. Você tem 5 observações de uma volta pelo MedDefense Central, e precisa decompor **cada uma** em 4 componentes formais: Vulnerabilidade, Ameaça, Impacto e Severidade. Nada de texto corrido — o enunciado pede um formato estruturado, campo por campo, repetido para cada observação.

## Passo 1 — Não confunda Vulnerabilidade com Ameaça

Esse é o erro mais comum neste tipo de exercício. Os dois termos parecem sinônimos, mas respondem perguntas diferentes:

- **Vulnerabilidade** é uma característica do próprio ambiente — algo que já está errado, mesmo que ninguém explore. É estática. Exemplo genérico: "a porta não tranca."
- **Ameaça** é um cenário de ação — alguém ou algo fazendo uso daquela fragilidade. É dinâmica. Exemplo genérico: "uma pessoa não autorizada entra pela porta destrancada durante o turno da noite e acessa o equipamento."

Se ao escrever sua Ameaça você só repetiu a Vulnerabilidade com outras palavras, você não decompôs nada — você duplicou.

## Passo 2 — Impacto precisa nomear o pilar CIA, não só descrever a consequência

"Isso é ruim para o hospital" não é um Impacto formal. O enunciado pede que você especifique **qual(is) pilar(es) CIA** são afetados e explique a conexão — exatamente a mesma disciplina que você já praticou no Task 1. Alguns dos 5 cenários afetam mais de um pilar ao mesmo tempo; identifique todos que forem sustentados pelo cenário, sem forçar um pilar que não se aplica.

## Passo 3 — Severidade não é um chute — é uma combinação de dois fatores

Pense em Severidade como o cruzamento entre:

1. **Quão fácil é explorar** a vulnerabilidade (não exige nenhuma habilidade técnica? exige estar fisicamente no prédio? exige conhecimento avançado?)
2. **Quão grave é o impacto** se a ameaça se concretizar (afeta um sistema isolado e de baixo valor, ou algo que toca diretamente a segurança do paciente ou dados regulados?)

Uma vulnerabilidade fácil de explorar **e** com impacto grave é Crítica. Uma vulnerabilidade difícil de explorar **ou** com impacto pequeno tende para Média/Baixa. Justifique em uma frase citando os dois fatores, não só um adjetivo solto.

## Passo 4 — Dicas específicas por observação (sem resolver por você)

- **Observação 1 (Sala de servidores):** repare que há *três* fragilidades relatadas na mesma cena (crachá genérico, sem câmera, sem registro de visitantes). Pense se elas formam uma única vulnerabilidade central (falta de controle de acesso diferenciado) ou se valem observações separadas — e qual ameaça plausível realmente se aproveita disso.
- **Observação 2 (Armário de rede):** aqui tem uma combinação perigosa de *duas* falhas independentes (porta destrancada + credenciais coladas na parede). Pergunte-se: o que muda no seu raciocínio de Impacto quando a vulnerabilidade não é só acesso físico, mas acesso físico **mais** as chaves para controlar toda a rede?
- **Observação 3 (Posto de enfermagem):** a placa pedindo para "não deslogar entre turnos" não é um detalhe decorativo — é evidência de que a fragilidade é um **processo/política**, não só uma falha técnica. Pense em quem, além de um atacante externo, poderia ser a "ameaça" mais realista aqui.
- **Observação 4 (Monitor IoT):** tem uma pista técnica dupla: firmware desatualizado (de 2019) **e** o dispositivo estar na mesma faixa de IP das estações de trabalho comuns. Volte ao que você já viu no Task 0 sobre segmentação de rede — por que isso importa tanto mais aqui do que em outros dispositivos? E pense: qual pilar CIA dói mais quando o "ativo" é um monitor de sinais vitais, não um servidor de arquivos?
- **Observação 5 (Saída de emergência):** a cunha de madeira é literalmente o exemplo citado na introdução do projeto ("olhar para a porta presa aberta e entender o que isso significa"). Pense no que fica exposto do outro lado dessa porta, não só no fato de a porta estar aberta.

## Passo 5 — Onde entregar

O arquivo final vai como `3-physical_assessment.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x00_first_watch`. Use o formato de bloco pedido no enunciado — `Observation [N]:` seguido dos 4 campos indentados — para as 5 observações.

---

Quer tentar escrever a decomposição da Observação 1 sozinho primeiro, ou prefere que eu monte um exemplo completo de uma observação para você usar como modelo nas outras quatro?
