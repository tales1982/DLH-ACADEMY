# O que você precisa fazer

Essa tarefa junta pesquisa técnica (Parte 1) com um trabalho de design que reusa praticamente tudo que você construiu no resto do bloco (Parte 2) e termina com uma decisão de negócio justificada por número (Parte 3).

## Passo 1 — Na Parte 1, não confunda "quem usa isso" com "o que isso protege"

TPM, HSM, enclave seguro e KMS de software todos "protegem chaves" de um jeito geral — a diferença real está na ESCALA e no MODELO DE AMEAÇA de cada um. Pesquise especificamente: um TPM protege a chave de UM dispositivo específico contra o quê? Um HSM protege chaves usadas por quantos sistemas, tipicamente? Essa diferença de escala é o que explica a diferença de custo entre eles — não é coincidência.

## Passo 2 — Antes de escrever a Parte 2, faça um inventário rápido de TODAS as chaves que você já criou neste bloco

Volte mentalmente pelas tarefas anteriores: você tomou decisões de criptografia pro banco de dados de pacientes, pro backup do NAS, pro TLS do portal, pras VPNs. Cada uma dessas decisões implica pelo menos uma chave existindo em algum lugar. Liste elas antes de decidir onde cada uma deveria morar — é fácil esquecer uma se você for direto pro design sem esse inventário.

## Passo 3 — "Quem tem acesso" não é uma resposta técnica, é uma resposta de GOVERNANÇA

Você já tem uma estrutura de papéis definida num projeto anterior (1x03) — quem é o Data Custodian, quem é Accountable, quem só é Responsible por apoio técnico. Use essa estrutura já existente em vez de inventar papéis novos. E pense numa regra importante de segurança: uma única pessoa deveria ter acesso a TODAS as chaves ao mesmo tempo? Ou isso concentraria risco demais numa única conta?

## Passo 4 — Separe "chave comprometida" de "chave perdida" — são problemas opostos

Comprometida significa que alguém indevido TEM a chave — a resposta é revogar e trocar rápido. Perdida significa que NINGUÉM tem a chave, nem você — a resposta certa geralmente envolve algum tipo de cópia de recuperação (key escrow), guardada com o mesmo cuidado que a chave original. Não trate os dois cenários com a mesma resposta, porque as consequências (e as ações corretas) são bem diferentes.

## Passo 5 — Na Parte 3, você precisa fazer uma conta real, não uma opinião

O enunciado te dá um número de custo (aproximadamente $1-2 por chave por mês) — multiplique isso pelo número de chaves que você inventariou no Passo 2 (adicione uma margem razoável) pra chegar num custo anual real. Depois, procure no seu Registro de Riscos de um projeto anterior (1x03) qual risco quantificado (ALE) mais se relaciona com "o que aconteceria se essa chave de criptografia específica fosse comprometida". Pode ser que o risco mais parecido não fale literalmente sobre "chaves de criptografia" — pense em qual consequência final (acesso não autorizado a que dado?) seria a mesma, não importa o caminho técnico exato do ataque.

## Passo 6 — A resposta final ("o investimento se justifica?") precisa ser uma comparação de proporção, não só "sim, é barato"

Depois de ter os dois números (custo do HSM por ano vs. ALE do risco relacionado), calcule a proporção entre eles. Uma proporção de "isso custa uma fração minúscula do risco que resolve" é um argumento muito mais forte numa auditoria de segurança do que simplesmente dizer "é barato, então vale a pena".

## Onde entregar

O arquivo final vai como `14-key_management.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
