# O que você precisa fazer

Essa é a tarefa mais avançada até agora tecnicamente, porque envolve escrever a sintaxe de um perfil do AppArmor do zero, não só ligar/desligar uma configuração existente.

## Passo 1 — `aa-status` é o seu comando de leitura, `aa-enforce`/`aa-complain` são os de escrita

`aa-status` mostra quais perfis existem e se estão em enforce, complain, ou se o processo está unconfined. Para mudar de modo, você usa `aa-enforce /caminho/para/o/binario` (isso ativa o link simbólico correto dentro de `/etc/apparmor.d/`).

## Passo 2 — O perfil customizado é a parte mais trabalhosa: sintaxe do AppArmor tem uma estrutura própria

Um perfil básico se parece com:
```
/opt/meddefense/billing-app {
  #include <abstractions/base>
  /opt/meddefense/billing-app/** r,
  /opt/meddefense/billing-app/logs/** w,
  /var/lib/mysql/billing.sock rw,
  deny /etc/shadow r,
}
```
O ponto central: liste APENAS os caminhos que a aplicação realmente precisa acessar (leitura, escrita, execução), e tudo que não está listado fica implicitamente negado no modo enforce. Adicione `deny` explícito para os caminhos mais sensíveis (como `/etc/shadow`) para deixar claro no perfil que aquilo é proposital, mesmo que já fosse implicitamente negado.

## Passo 3 — Carregue o perfil novo com `apparmor_parser`

Depois de escrever o arquivo do perfil em `/etc/apparmor.d/`, você precisa rodar algo como `apparmor_parser -r /etc/apparmor.d/opt.meddefense.billing-app` para recarregar e ativar o perfil (o nome do arquivo no AppArmor costuma ser o caminho com barras substituídas por pontos).

## Passo 4 — "Unconfined" não é necessariamente um erro do seu script, é um achado real do sistema

O `rsyslogd` aparecer como unconfined no output esperado é intencional — o exercício quer que seu script identifique e REPORTE esse caso como um risco, não que ele crie um perfil para absolutamente todo processo do sistema. Diferencie "processos que eu configurei" de "processos que eu apenas relatei como não confinados".

## Onde entregar

O arquivo final vai como `9-apparmor_config.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
