# 12. STRIDE Por Toda a Arquitetura

**Objetivo:** Aplicar STRIDE em nível de superfície a três sistemas críticos adicionais pra construir uma consciência de ameaça ampla em todo o ambiente da MedDefense.

## Contexto

O EHR é a joia da coroa, mas não é o único sistema que interessa a um atacante. O Active Directory controla a autenticação de todo usuário e serviço. O servidor PACS armazena imagens médicas essenciais pro diagnóstico. A infraestrutura de rede é o tecido que conecta tudo.

Uma passada rápida de STRIDE em cada um desses sistemas identifica as ameaças mais críticas sem a profundidade total da análise do EHR. Pense nisso como triagem: identifique a ameaça mais perigosa em cada categoria STRIDE, e siga em frente.

## Instruções

Aplique STRIDE a 3 sistemas adicionais. Para cada sistema, identifique uma ameaça por categoria STRIDE (a mais crítica). Formato:

```
Sistema: [Nome]
Notas de Arquitetura: [Breve: quais componentes, quais conexões, do 1x00]
```

| STRIDE | Ameaça | Impacto | Severidade |
|---|---|---|---|
| S | ... | ... | C/A/M/B |
| T | ... | ... | C/A/M/B |
| R | ... | ... | C/A/M/B |
| I | ... | ... | C/A/M/B |
| D | ... | ... | C/A/M/B |
| E | ... | ... | C/A/M/B |

`Ameaça Principal: [Qual é a mais perigosa pra esse sistema e por quê?]`

### Os 3 Sistemas

1. **PACS / Imagem Médica** (`pacs-srv-01` + estação de MRI rodando Windows XP + caminho de rede até as estações de radiologia). Considere: credenciais compartilhadas, SO legado, dados de imagem não criptografados, acesso via rede plana.

2. **Active Directory** (`ad-dc-01` + `ad-dc-02`). Considere: ele controla a autenticação de toda a organização, fraquezas na política de senha, ausência de MFA, o que acontece se um DC for comprometido.

3. **Infraestrutura de Rede** (firewall FortiGate + switch core + roteador consumidor Westside + túneis VPN). Considere: o FortiGate é a única defesa de perímetro, o roteador Westside é de nível consumidor, as regras de VPN são permissivas demais, não há segmentação interna.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `12-stride_architecture.md`
