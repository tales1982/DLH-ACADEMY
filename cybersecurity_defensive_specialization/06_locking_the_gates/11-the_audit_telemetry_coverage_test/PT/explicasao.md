# O que você precisa fazer

Essa tarefa é o "teste de fumaça" da Tarefa 10: você já implantou as regras, agora precisa provar, com evidência, que cada uma delas realmente captura o que deveria.

## Passo 1 — Cada um dos 6 testes segue o mesmo padrão de 3 passos

Para cada evento: (1) execute o comando que deveria disparar a regra, (2) espere um instante e rode `ausearch -ts recent -k <chave>` para procurar o evento, (3) registre se encontrou (CAPTURED) ou não (MISSED). Isso é literalmente repetir a mesma lógica de verificação 6 vezes, uma para cada chave de auditoria da Tarefa 10.

## Passo 2 — "Controlado" é a palavra-chave do enunciado — não faça nada destrutivo de verdade

Para testar acesso a `/etc/shadow`, você não precisa modificar o arquivo, só ler (`sudo cat /etc/shadow > /dev/null`). Para testar cron, crie um arquivo de teste temporário de cron, verifique que ele foi auditado, e DELETE esse arquivo de teste antes do script terminar — o enunciado exige explicitamente uma limpeza (cleanup) para não deixar rastros perigosos (contas de teste, arquivos, tarefas de cron) no sistema.

## Passo 3 — O JSON de saída precisa registrar EVIDÊNCIA, não só "passou/falhou"

Cada entrada do `audit_validation.json` deve ter o nome do teste, a chave de auditoria esperada (ex: "identity"), o comando exato que foi executado, o timestamp, se foi capturado, e quantos eventos (ou um trecho do evento) o `ausearch` encontrou. Isso serve como evidência de conformidade auditável — não é suficiente dizer "true/false", precisa mostrar o rastro.

## Passo 4 — Pense em timing: `ausearch -ts recent` pode não pegar eventos que acabaram de acontecer sem um pequeno delay

Dependendo da carga do sistema, pode haver um pequeno atraso entre o evento acontecer e ele aparecer no log de auditoria. Um `sleep 1` curto entre disparar o evento e buscar por ele evita falsos "MISSED" por causa de timing, não por causa de regra quebrada.

## Onde entregar

O arquivo final vai como `11-audit_coverage_test.sh` e `audit_validation.json`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
