# 13. O Mapeamento ATT&CK

**Objetivo:** Mapear sequências de ataque realistas para as táticas do MITRE ATT&CK, construindo fluência no framework que todo SOC usa diariamente.

## Contexto

O MITRE ATT&CK é a língua compartilhada da indústria de segurança. Quando um analista de SOC diz "detectamos T1566.001," todo profissional de segurança do mundo sabe que ele está falando de um anexo de spear phishing. Quando um relatório de incidente mapeia um ataque para táticas do ATT&CK, qualquer equipe consegue entender a sequência sem ler uma narrativa.

Você não precisa memorizar o framework inteiro. Você precisa conseguir ler uma descrição de ataque e mapear cada passo pra tática correta. As técnicas vêm com a experiência. As táticas são o que importa agora.

**As 14 Táticas Enterprise do ATT&CK** (na ordem da sequência de ataque): Reconhecimento, Desenvolvimento de Recursos, Acesso Inicial, Execução, Persistência, Escalada de Privilégio, Evasão de Defesa, Acesso a Credenciais, Descoberta, Movimento Lateral, Coleta, Comando e Controle, Exfiltração, Impacto.

**Arquivos Fornecidos:** `attack-scenarios-attck.txt` (2 narrativas de ataque detalhadas contra a MedDefense, 9 e 8 passos respectivamente — Cenário Alpha: campanha de ransomware "Operação Flatline"; Cenário Beta: roubo de dados por insider "A Saída Silenciosa")

## Instruções

Para cada um dos 2 cenários de ataque:

1. Leia a narrativa completa.
2. Para cada passo numerado, identifique a tática do ATT&CK correspondente.
3. Para cada passo, identifique a técnica do ATT&CK mais provável (navegue até attack.mitre.org e encontre o ID específico da técnica). Se múltiplas técnicas se aplicarem, escolha a mais específica e anote as alternativas.

Formato:

```
Cenário [Alpha/Beta]:
Passo [N]: [Descrição breve da narrativa]
  Tática: [Nome da tática do ATT&CK]
  Técnica: [Nome da técnica + ID, ex: "Phishing: Spearphishing Attachment (T1566.001)"]
  Fator MedDefense: [O que no ambiente da MedDefense habilita esse passo?]
```

Depois dos dois mapeamentos, escreva uma **Avaliação de Cobertura ATT&CK** (um parágrafo): Olhando os dois cenários, quais táticas do ATT&CK aparecem em ambos os ataques? O que isso diz sobre onde a MedDefense precisa de capacidade de detecção mais urgentemente?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `13-attck_mapping.md`
