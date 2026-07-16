# O que você precisa fazer

Diferente das tarefas anteriores, aqui você não está criando análise nova — está **traduzindo** uma narrativa de ataque já escrita pra linguagem padronizada do MITRE ATT&CK. O trabalho intelectual está em reconhecer o padrão certo, não em inventar.

O arquivo `attack-scenarios-attck.txt` já está na pasta, com os dois cenários completos: **Alpha** ("Operation Flatline," 9 passos, ransomware da BlackReef via phishing → pass-the-hash → exfiltração → destruição de backup → GPO de ransomware) e **Beta** ("The Quiet Departure," 8 passos, insider da faturamento exfiltrando dados via export do EHR + USB, depois voltando pela VPN depois de demitida).

## Passo 1 — Tática é "o quê", Técnica é "como"

Muita gente confunde os dois. Tática é o objetivo tático do atacante naquele momento (ex: "Acesso Inicial" — ele está tentando entrar). Técnica é o método específico usado pra alcançar aquele objetivo (ex: "Spearphishing Attachment" — ele está usando um anexo malicioso especificamente). Sempre identifique a tática primeiro (geralmente óbvia pelo contexto do passo), depois procure a técnica que combina com ela.

## Passo 2 — As 14 táticas seguem uma ordem lógica de ataque, use isso a seu favor

Se o Passo 1 da narrativa é sobre o atacante mandando um e-mail, é quase certamente Acesso Inicial (ou Reconhecimento, se for só sobre coletar informação antes). Se um passo no meio da narrativa fala em "o atacante se moveu para outro servidor," isso é Movimento Lateral quase sempre. A ordem das 14 táticas no enunciado não é alfabética — é a ordem típica de progressão de um ataque. Use como checklist mental.

## Passo 3 — Pra achar o ID da técnica, procure por palavras-chave no site do MITRE

Você vai precisar navegar até attack.mitre.org e usar a busca. Palavras-chave da narrativa (ex: "RDP", "credential dumping", "phishing attachment") geralmente levam direto à técnica certa. Não adivinhe o ID de cabeça — confira no site, já que os IDs específicos (como o T1566.001 do exemplo) têm formato de sub-técnica que muda com frequência.

## Passo 4 — Fator MedDefense é onde você reconecta com todo o resto do projeto

Esse campo é o mesmo tipo de análise que você já fez nas Tarefas 8, 9 e 10 (o que no ambiente específico da MedDefense torna esse passo possível?). Reuse os achados: rede plana, credenciais padrão, falta de MFA, sistemas legados — o que já apareceu antes provavelmente reaparece aqui, mapeado num passo específico da narrativa.

## Passo 5 — A Avaliação de Cobertura é sobre sobreposição, não sobre repetir os dois mapeamentos

Depois de mapear os dois cenários completos, faça uma comparação lado a lado: quais táticas aparecem nos dois? Normalmente Acesso Inicial e Movimento Lateral aparecem quase sempre — isso não é coincidência, é onde a MedDefense mais precisa de detecção, porque é o gargalo comum de quase qualquer ataque, independente do ator.

## Passo 6 — Armadilhas específicas dos dois cenários

Alguns passos são mais fáceis de classificar errado do que parece:

- **Alpha, Passo 1** (comprar a lista de organizações de um corretor de acesso): não é Acesso Inicial ainda — ninguém tocou na rede da MedDefense. Pense em qual tática cobre "adquirir uma capacidade ou recurso antes do ataque começar."
- **Alpha, Passo 4** (comandos de mapeamento de rede como `arp -a`, `nltest`): isso não é Movimento Lateral — o afiliado ainda está na mesma máquina, só coletando informação sobre o ambiente. Pense em qual tática é sobre "aprender o que existe ao redor," diferente de "se mover para outro lugar."
- **Alpha, Passo 8** (apagar backups e Volume Shadow Copies): é tentador classificar como Evasão de Defesa (já que estão apagando evidência), mas o objetivo real aqui é impedir que a MedDefense se recupere do ataque — isso tem uma tática própria mais tarde na lista das 14.
- **Beta, Passo 3** (usar a função de exportação do EHR pra baixar CSVs): isso é reunir/agrupar o dado antes de tirá-lo do ambiente — não confunda com o passo em que o dado efetivamente sai da rede (esse é o Passo 4, com o pendrive).
- **Beta, Passo 7** (o chamado de desativação ficando 5 dias na fila): esse passo não é uma ação do atacante — é uma falha de processo da MedDefense que *permite* o passo seguinte. Nem todo passo numerado da narrativa vira uma linha tática/técnica; alguns são só contexto que explica o "Fator MedDefense" do passo seguinte.

## Onde entregar

O arquivo final vai como `13-attck_mapping.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x01_know_your_enemy`.
