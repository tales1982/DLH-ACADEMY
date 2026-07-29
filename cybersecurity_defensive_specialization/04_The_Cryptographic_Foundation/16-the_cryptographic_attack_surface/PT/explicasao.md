# O que você precisa fazer

Essa tarefa é puramente de síntese — você não vai descobrir nenhum conceito novo, vai pegar seis ataques clássicos de criptografia e provar que cada um tem uma conexão real e específica com algo que você já documentou neste mesmo bloco.

## Passo 1 — Resista à tentação de escrever uma definição de livro-texto genérica pra cada ataque

O campo "Mecanismo" pede 2-3 frases sobre como o ataque funciona — mas o valor real da tarefa está nos campos "Vulnerabilidade da MedDefense" e "Evidência". Pra cada um dos seis ataques, pergunte-se: "eu já vi isso, especificamente, em algum achado ou documento anterior deste bloco?" Se a resposta for sim, cite o achado exato (número do Finding, RISK-ID, ou tarefa específica) em vez de escrever algo genérico tipo "sistemas desatualizados podem ser vulneráveis".

## Passo 2 — Alguns desses ataques têm uma resposta "Sim" clara pra "Viável Hoje", outros são mais sutis

TLS Downgrade e Kerberoasting, por exemplo, têm achados de scan bem diretos e recentes confirmando a condição exata que o ataque precisa (protocolos antigos habilitados, tipos de criptografia fracos permitidos) — pra esses, "Viável Hoje: Sim" é uma afirmação factual, não uma suposição. Já o Ataque de Aniversário é explicitamente descrito como "teórico" no próprio enunciado — pra esse, pense em como você respondería honestamente "viável hoje" quando o ataque em si não é dirigido contra um sistema específico, mas explica POR QUE outra coisa (como MD5) é fraca.

## Passo 3 — "Recuperação de Chave da Memória" tem uma resposta técnica real, não hipotética

Pesquise (ou pense com cuidado): se alguém tem acesso root/kernel num sistema Linux ou Windows rodando, existe alguma coisa que impede ele de ler a memória de um processo específico que está segurando uma chave de criptografia? A resposta tem a ver com mecanismos reais do sistema operacional (leitura de memória de processo, core dumps, swap não criptografado) — e você já tem, de um projeto anterior, um sistema específico da MedDefense com histórico CONFIRMADO de acesso root obtido por um atacante. Use esse fato real, não invente um cenário hipotético novo.

## Passo 4 — Na Mitigação, pense se a resposta certa é "trocar o algoritmo" ou "resolver outra coisa completamente"

Nem todo ataque desses seis se resolve trocando um algoritmo criptográfico por outro mais forte. Alguns (como Recuperação de Chave da Memória) apontam pra um problema que a criptografia sozinha não resolve — a mitigação real pode estar em outra camada (por exemplo, impedir o acesso root em primeiro lugar, ou usar um HSM que nunca libera a chave crua pra memória da aplicação). Reconhecer quando "criptografia mais forte" NÃO é a resposta certa é parte do que essa tarefa está testando.

## Passo 5 — Ataque de Colisão e Ataque de Aniversário parecem parecidos — não os trate como intercambiáveis

Eles estão relacionados matematicamente (o ataque de aniversário é o que torna colisões práticas mais fáceis de achar do que se esperaria ingenuamente), mas são conceitos distintos: um é sobre encontrar duas entradas que colidem de propósito, o outro é sobre a matemática de PROBABILIDADE que torna isso mais fácil do que parece à primeira vista. Trate os dois campos "Mecanismo" com essa distinção clara.

## Onde entregar

O arquivo final vai como `16-crypto_attack_surface.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
