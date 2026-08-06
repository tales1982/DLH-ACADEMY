# 2. O Parser de Auditoria do Lynis

**Objetivo:** Analisar um arquivo de relatório e produzir um resumo em JSON, legível por máquina, dos resultados mais importantes da auditoria.

## Contexto

O Lynis guarda os dados mais importantes da auditoria em um arquivo de relatório chave-valor, normalmente `lynis-report.dat`. Esse arquivo é mais fácil de analisar do que a saída do terminal ou o arquivo de log verboso. Converter isso em JSON torna os resultados da auditoria mais fáceis de inspecionar, filtrar e reutilizar em um fluxo de trabalho de segurança.

## Instruções

Rode uma auditoria completa do Lynis no sistema. Depois escreva um script `2-lynis_parse.sh` que:

- aceite o caminho para um arquivo de relatório `.dat` como primeiro argumento (`"$1"`)
- extraia o índice de hardening do Lynis
- extraia cada entrada `warning[]`, `suggestion[]` e `manual_check[]`
- interprete cada achado em:
  - `severity`
  - `test_id`
  - `message`
- produza um relatório JSON estruturado na saída padrão

**Dica:** `man jq`

## Saída Esperada

```
$ ./2-lynis_parse.sh /var/log/lynis-report.dat | jq '.' > lynis_findings.json

$ cat lynis_findings.json
{
  "hardening_index": 62,
  "findings": [
    {
      "severity": "suggestion",
      "test_id": "LYNIS",
      "message": "This release is more than 4 months old. Check the website or GitHub to see if there is an update available."
    },
    {
      "severity": "suggestion",
      "test_id": "DEB-0280",
      "message": "Install libpam-tmpdir to set $TMP and $TMPDIR for PAM sessions"
    },
...
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `2-lynis_parse.sh`, `lynis_findings.json`
