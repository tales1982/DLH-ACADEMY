# O que você precisa fazer

Essa tarefa é basicamente uma organização cuidadosa de informação que já existe — as notas da Sarah têm praticamente tudo que você precisa. O trabalho real está em não aceitar as classificações dela sem pensar, e em preencher as lacunas que ela deixou implícitas.

## Passo 1 — Não copie o rótulo da Sarah sem questionar

Repare que em pelo menos um lugar (o MySQL em trânsito), a própria Sarah rotula uma coisa como "FRACA" mas a descrição dela é de algo 100% em texto puro, sem nenhuma tentativa de criptografia acontecendo. Pergunte-se: "Fraco" combina com "zero proteção", ou isso deveria ser "Ausente"? Você tem liberdade pra reclassificar, desde que justifique por quê.

## Passo 2 — Nem toda célula da matriz faz sentido

Pensa bem: dados de backup têm um estado "em uso" de verdade? Tráfego de VPN tem um estado "em repouso"? Algumas combinações linha×coluna simplesmente não descrevem nada real. Marcar como "N/A" com uma justificativa é mais honesto do que forçar uma resposta artificial só pra preencher a célula.

## Passo 3 — Uma "adequação" no papel pode não ser adequação na prática

O texto sobre a VPN da Westside menciona os algoritmos fortes usados no túnel, mas também menciona onde uma das pontas termina fisicamente. Pense: será que a força do algoritmo é a única coisa que importa aqui, ou existe um detalhe sobre o equipamento que muda sua avaliação do risco real?

## Passo 4 — Conecte "credenciais em uso" com um projeto anterior

As notas da Sarah não descrevem diretamente o que acontece com credenciais "em uso" — mas você já viu, num projeto anterior (1x01), uma técnica específica de ataque que rouba credenciais diretamente da memória de um sistema comprometido. Isso é evidência real de que essa célula não tem proteção nenhuma, mesmo sem uma frase explícita da Sarah dizendo isso.

## Passo 5 — Faça a conta do Resumo de Lacunas com cuidado

21 células no total, mas nem todas contam como "aplicáveis" se você usou N/A em algumas. Calcule a porcentagem de cobertura adequada considerando apenas as células que fazem sentido — e repare em qual dono está por trás das poucas células "Adequadas" que você encontrar (a MedDefense configurou isso, ou foi outra empresa que garantiu essa proteção?).

## Onde entregar

O arquivo final vai como `0-crypto_inventory.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
