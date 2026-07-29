# 6. A Prova Técnica

**Objetivo:** Demonstrar domínio técnico prático executando uma checagem de segurança rápida usando ferramentas de todo o módulo.

## Contexto

James Chen precisa saber que você consegue FAZER o que recomenda, não só escrever sobre isso. Antes da reunião com a diretoria, ele te pede para rodar uma validação técnica rápida na sua própria máquina para provar proficiência. "Me mostra que você consegue inspecionar um certificado, verificar um hash, checar um exploit e auditar um sistema. Cinco minutos cada."

## Instruções

Execute as 4 checagens técnicas rápidas a seguir e documente os comandos e a saída de cada uma.

### Checagem 1 — Inspeção de Certificado

Use o OpenSSL para inspecionar o certificado de qualquer site ativo. Produza um resumo de 5 linhas: Subject, Issuer, Validade, Algoritmo de Chave, entradas SAN.

### Checagem 2 — Verificação de Hash

Crie um arquivo, faça o hash com SHA-256, modifique o arquivo, faça o hash de novo. Documente os dois hashes e confirme que são diferentes. Em uma frase: por que isso importa para verificar a integridade do firmware do FortiGate antes de instalá-lo?

### Checagem 3 — Pesquisa de Exploit

Rode `searchsploit fortigate` ou `searchsploit fortios`. Documente a saída. Existe um exploit público para o CVE-2023-27997? O que isso te diz sobre a urgência de aplicar o patch?

### Checagem 4 — Auditoria de Sistema

Rode `sudo lynis audit system --quick` na sua máquina. Reporte: o Hardening Index, os 3 principais avisos e uma sugestão que você aplicaria ao billing-srv-01 da MedDefense.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x05_board_briefing`
- **Arquivo:** `6-technical_proof.md`
