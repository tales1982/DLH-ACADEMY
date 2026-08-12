# O que você precisa fazer

Esse script não recria a configuração do auditd do zero — ele adiciona cinco regras novas ao mesmo arquivo `meddefense.rules` do 2x00 Task 10, recarrega o auditd e prova, com um gatilho real e seguro, que cada regra nova de fato dispara. A parte interessante não é escrever as regras (elas já vêm prontas no enunciado), é lidar com os jeitos que isso pode dar errado silenciosamente.

## Passo 1 — Regras `-w` com glob não resolvido derrubam o carregamento inteiro do arquivo

O enunciado sugere `-w /home/*/.ssh/ -p rwa -k ssh_keys`, mas regras `-w` do auditd não expandem glob em tempo de carga — um `*` literal é tratado como um caminho único que não existe, e o `augenrules --load` rejeita essa linha ("No such file or directory"), derrubando junto TODAS as regras depois dela no arquivo. O script contorna isso deixando o próprio Bash expandir o glob (`shopt -s nullglob; SSH_KEY_DIRS=(/root/.ssh /home/*/.ssh)`) e escrevendo uma linha `-w` por caminho real e existente, incluindo o do root.

## Passo 2 — Duas regras `-w` no mesmo caminho nunca coexistem — só a primeira registrada conta

O script deliberadamente NÃO recria um watch em `/etc/cron.d/`, porque o Task 10 já observa esse caminho exato sob a key `cron_config`. O comentário no código explica por quê: quando duas regras `-w` cobrem o mesmo caminho, o subsistema de auditoria do kernel só marca o evento com a key da regra registrada primeiro — uma segunda regra no mesmo caminho é peso morto que nunca dispara. Por isso a cobertura nova de cron neste script é só `/var/spool/cron/` (o spool por usuário), que é território genuinamente não coberto antes.

## Passo 3 — Reusar o nome de uma key já existente quebra a própria checagem de idempotência do script

A regra de `sudoers.d` usa a key `sudoers_d`, não `sudoers` (que já é usada pelo Task 10 para `/etc/sudoers`). Além da mesma colisão de first-match-wins do Passo 2, uma key compartilhada faria a checagem `grep -qE -- "-k ${key}\$"` dentro de `add_rule_if_missing` encontrar a regra antiga do Task 10 e concluir, errado, que a regra nova já existe — ela nunca seria adicionada, sem nenhum erro visível.

## Passo 4 — O script roda em dois modos: contra o auditd de verdade, ou contra um arquivo de teste isolado

`RULES_FILE` pode ser sobrescrito por variável de ambiente; quando é diferente do caminho padrão (`/etc/audit/rules.d/meddefense.rules`), `LIVE_MODE` vira `0`. Nesse modo, o script não exige root, não chama `augenrules --load` nem `auditctl -R`, e pula toda a validação com `ausearch` (que só faz sentido contra o kernel de auditoria real). Isso permite testar a lógica de escrita de regras sem tocar na configuração real da máquina — e é também por isso que a última linha do script (`[ "$VALIDATION_PASS" -eq "$VALIDATION_TOTAL" ] || [ "$LIVE_MODE" -ne 1 ]`) só exige 5/5 PASS quando está em modo live.

## Passo 5 — A validação usa `--input-logs` e um match restrito para não se enganar com falso positivo

`validate_rule` roda `ausearch --input-logs -ts recent -k "$key"` e filtra o resultado com `grep -c "^type=SYSCALL.*key=\"$key\""`. O `--input-logs` força leitura direta do arquivo de log no disco porque em algumas builds o caminho de consulta padrão do `ausearch` pode retornar vazio mesmo com o evento presente. E o filtro restrito a `type=SYSCALL` existe porque `ausearch -k` agrupa por ID de evento compartilhado — sem essa restrição, um registro `CONFIG_CHANGE` (`op=add_rule`) gerado quando a própria regra foi carregada acabaria "confirmando" a validação mesmo que o gatilho de teste nunca tivesse disparado a regra de verdade.

## Onde entregar

O arquivo final vai como `5-auditd_refine.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x02_eyes_on_endpoint`.
