# O que você precisa fazer

Essa é a primeira tarefa do bloco que exige privilégios de root de verdade (`sudo`) — isso muda um pouco a dinâmica em relação a tudo que você fez até agora.

## Passo 1 — Confirme que você TEM acesso root antes de começar

Antes de tentar qualquer comando da Parte 1, rode um teste simples (`sudo -v` ou `sudo whoami`) pra confirmar que você consegue autenticar como root no seu ambiente. Se você estiver rodando isso numa máquina/container/sandbox sem privilégios administrativos reais (alguns ambientes de nuvem ou sandboxes restringem isso de propósito), essa tarefa genuinamente não pode ser executada ao vivo nesse ambiente — e a coisa certa a fazer nesse caso é documentar isso honestamente (qual comando falhou, com qual mensagem de erro exata) em vez de inventar uma saída de terminal que nunca aconteceu. Isso não é diferente do que já aconteceu numa tarefa anterior deste mesmo bloco (Tarefa 3, o bloqueio de CAPTCHA do crackstation.net) — transparência sobre uma limitação real do ambiente é sempre preferível a fabricar um resultado.

## Passo 2 — O comando `luksFormat` tem uma confirmação de segurança de propósito — não pule ela sem ler

Repare que o `cryptsetup luksFormat` exige que você digite "YES" em maiúsculas antes de continuar. Isso não é burocracia — é porque esse comando sobrescreve irreversivelmente qualquer coisa que já exista no arquivo/dispositivo alvo. Leia o aviso, e pense por que um comando desse tipo específico teria essa fricção extra quando outros comandos do dia a dia não têm.

## Passo 3 — A pergunta central da Parte 2 é sobre PROVA, não sobre opinião

"O que isso prova sobre criptografia em repouso" não é uma pergunta retórica — você literalmente vai tentar ler o arquivo bruto com uma ferramenta de busca de texto (`strings`) depois de fechar o volume, e comparar o que você consegue ver com o que você escreveu na Parte 1. Se a resposta for "nada legível apareceu", isso é uma demonstração experimental real, não uma afirmação teórica — documente exatamente o que a ferramenta retornou (mesmo que seja só metadados do cabeçalho LUKS, sem nenhum dado real).

## Passo 4 — O ciclo completo da Parte 2 precisa realmente fechar o círculo

"Abrir-montar-ler-desmontar-fechar" não é uma lista de sugestões — é uma sequência específica que você precisa demonstrar do início ao fim, confirmando que o dado sobrevive ao processo inteiro de fechar e reabrir o volume. Se você pular a etapa de fechar e reabrir, você não provou que a criptografia é persistente, só que ela funciona enquanto o volume está aberto (o que é uma afirmação bem mais fraca).

## Passo 5 — O script da Parte 3 pode (e deveria) ser testado em partes, mesmo sem rodar o fluxo completo de root

Mesmo que você não consiga rodar o ciclo completo de criação de volume no seu ambiente, você ainda pode testar a lógica do script isoladamente: a validação de argumentos, as mensagens de uso, o tratamento de erro quando uma dependência (`cryptsetup`) não está disponível. Um script bem escrito detecta e informa claramente quando uma dependência do sistema está faltando, em vez de simplesmente falhar com um erro genérico do sistema operacional.

## Passo 6 — Na Parte 4, use os números REAIS que você já mediu na Tarefa 1, não um chute genérico de "vai ficar mais lento"

Você já tem benchmarks reais de throughput do AES em modo CBC (o modo mais parecido com o que o LUKS usa internamente, XTS) de uma tarefa anterior deste mesmo bloco. Use esses números como base pra estimar o overhead, em vez de simplesmente dizer "haverá algum impacto de performance" sem nenhuma base quantitativa.

## Passo 7 — A pergunta "onde a chave é armazenada" já tem a resposta errada citada no próprio enunciado — evite ela especificamente

O enunciado avisa explicitamente "NÃO no próprio NAS". Antes de escrever sua justificativa, releia a nota da Sarah Park sobre esse exato problema, documentada numa tarefa anterior deste mesmo bloco (Tarefa 0) — ela já articulou o risco específico com as próprias palavras dela. Use esse raciocínio dela como base, não reinvente do zero.

## Onde entregar

Os arquivos finais vão como `12-luks_manager.sh` e `12-disk_encryption.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x04_crypto_foundation`.
