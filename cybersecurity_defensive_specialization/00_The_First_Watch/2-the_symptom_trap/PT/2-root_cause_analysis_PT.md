# Análise de Causa Raiz — billing-srv-01

## 1. Identificação do Processo

O `kworker` (PID 8834) não é um processo real do kernel Linux — threads kworker de verdade rodam como `root` e aparecem como `[kworker]`. Este roda como `www-data`, a partir de `/var/www/html/.cache/kworker`, com um nome escolhido para passar despercebido na lista de processos. `stratum+tcp://pool.monero.org:4443` é o protocolo usado para falar com um pool de mineração; o `config.json` confirma isso, com três pools de Monero como alternativas. **Isso é um payload de cryptojacking**, minerando Monero silenciosamente no servidor de faturamento.

## 2. Classificação do Comprometimento Real

**O problema real de segurança não é a Disponibilidade — dois outros pilares foram quebrados primeiro**, e a saturação de CPU é só o último evento visível da cadeia.

**Confidencialidade:** o minerador roda de dentro do próprio diretório da aplicação web, como `www-data`, o que indica que alguém obteve acesso não autorizado ao servidor através da própria aplicação.

**Integridade:** o atacante então enviou e executou um binário que nunca fez parte do software da MedDefense, disfarçado para parecer legítimo — uma alteração não autorizada do sistema.

## 3. Por que a Solução do Administrador Falha

**Um upgrade de hardware não resolve o problema de segurança.** O minerador está configurado (`threads: 4`, `cpu-priority` fixo) para usar toda a CPU que tiver disponível, então uma VM maior só entrega mais capacidade de mineração ao atacante. Também não resolve como o atacante entrou — a mesma vulnerabilidade seria transferida para a nova VM.

## 4. Conexão com o Incidente de Janeiro

**O minerador e o ransomware de janeiro apontam para a mesma fragilidade de base.** Dois comprometimentos diferentes no mesmo servidor após uma reconstrução completa significam que a reconstrução resetou o sintoma, não a causa. As anotações do Marcus apontam o Apache 2.4.29 (com vulnerabilidades RCE conhecidas) como o provável ponto de entrada compartilhado. Pergunta em aberto: o Apache foi corrigido durante a reconstrução, ou a mesma versão vulnerável foi reinstalada?

## Recomendação

1. Confirmar a versão do Apache no `billing-srv-01` contra os avisos conhecidos de RCE da 2.4.29.
2. Rejeitar o upgrade de hardware — ele aumenta o custo sem corrigir a vulnerabilidade.
3. Auditar outros servidores que ainda rodam Apache 2.4.29.
