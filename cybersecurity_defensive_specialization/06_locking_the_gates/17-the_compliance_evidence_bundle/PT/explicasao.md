# O que você precisa fazer

Essa é a tarefa final do projeto — um script que não coleta nenhum dado novo do sistema, apenas AGREGA os 6 arquivos JSON já produzidos pelas tarefas anteriores em um único artefato de conformidade.

## Passo 1 — Isso é puramente composição de JSON, use `jq` para juntar tudo

O trabalho aqui é: ler cada um dos 6 arquivos com `jq`, extrair os campos relevantes de cada um, e montar um objeto JSON novo e maior que os combina. Não há hardening nem verificação de sistema nessa tarefa — é inteiramente sobre pegar dados que já existem e organizá-los no formato exigido.

## Passo 2 — "13 remediados" e "13 verificados" mas "15 selecionados" — os 2 controles que faltam viram desvios

Repare na aritmética do output esperado: 15 controles selecionados no perfil CIS (Tarefa 1), mas só 13 remediados/verificados, e exatamente "Deviations documented: 2". Isso significa que 2 dos 15 controles originais foram DELIBERADAMENTE deixados sem remediar (por exemplo, porque não se aplicavam, ou porque exigiam uma janela de manutenção que ainda não aconteceu) — e cada um desses 2 precisa de uma entrada completa de desvio: motivo, risco aceito, controle compensatório e responsável.

## Passo 3 — "Overall compliance: 86.7%" precisa ser uma conta explícita, não um número inventado

13 de 15 controles verificados = 86,67%, que arredonda para 86.7%. Use exatamente essa divisão (controles verificados / controles selecionados) para calcular a porcentagem, para que o número seja auditável e reproduzível, não estimado.

## Passo 4 — Esse arquivo é o que "prova" o trabalho de todo o projeto para um auditor externo

Pense em quem vai ler `compliance_report.json`: não é o James Chen ou a Sarah Park, é potencialmente um auditor de conformidade HIPAA ou um avaliador externo que nunca viu o projeto antes. Cada campo precisa fazer sentido sozinho, sem precisar abrir os outros 6 arquivos de evidência para entender o que aconteceu — mas o campo "evidence files used" deve listar exatamente quais arquivos fundamentam cada conclusão, para rastreabilidade.

## Onde entregar

O arquivo final vai como `17-compliance_bundle.sh`, no repositório `dlh-cyber_security`, diretório `blue_team/2x00_locking_the_gates`.
