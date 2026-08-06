# O que você precisa fazer

## Passo 1 — Sysmon não é nativo do Windows — ele precisa ser baixado e instalado

Diferente de tudo que você configurou até agora (auditoria, PowerShell logging, políticas de senha), que já existem no Windows e só precisam ser LIGADOS, o Sysmon é uma ferramenta separada da Microsoft Sysinternals que precisa ser baixada e instalada como um serviço + driver de kernel. É por isso que esta tarefa tem um fluxo diferente: baixar → instalar com uma configuração → verificar que o serviço e o driver estão rodando.

## Passo 2 — A configuração faz TODA a diferença — sem ela, o Sysmon captura ruído demais para ser útil

Rodar `Sysmon64.exe -accepteula -i` SEM um arquivo de configuração ativa só o Event ID 1 (criação de processo) com um conjunto mínimo de campos. É a configuração XML (`sysmonconfig.xml`) que ativa e ajusta TODOS os outros tipos de evento (conexão de rede, criação de arquivo, modificação de registro, etc.) e, mais importante, filtra o ruído — sem os filtros de exclusão, um servidor gera centenas de milhares de eventos por dia só de atividade legítima do sistema operacional, tornando os logs inúteis na prática.

## Passo 3 — O script tem um plano B para quando o laboratório não tem acesso à internet

Baixar a configuração de referência da SwiftOnSecurity via `Invoke-WebRequest` pode falhar se o DC do laboratório estiver isolado da internet (comum em ambientes de treinamento). Por isso o script cai para o `sysmonconfig.xml` já versionado neste repositório como baseline — a implantação não trava só porque a fonte externa não está acessível. Esse tipo de "plano B documentado" é o mesmo princípio de "justifique todo desvio" que já apareceu no módulo 2x00.

## Passo 4 — O teste final prova que a INSTALAÇÃO funcionou, não só que o comando não deu erro

Rodar `Sysmon64.exe -i` sem erro não garante que o driver realmente carregou e está gerando telemetria — pode falhar silenciosamente em alguns cenários (driver bloqueado por política, por exemplo). Criar um arquivo real em `C:\Windows\Temp\` e depois CONFIRMAR que o Event ID 11 apareceu no log do Sysmon é a prova de que a cadeia inteira (serviço → driver → geração de evento → gravação no log) está funcionando de ponta a ponta — não basta "o comando rodou", tem que ser "o evento apareceu."

## Onde entregar

Os arquivos finais vão como `9-sysmon_deploy.ps1` e `sysmonconfig.xml`, no repositório `dlh-cyber_security`, diretório `blue_team/2x01_windows_fortress`.
