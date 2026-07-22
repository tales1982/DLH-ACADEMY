# 8. A Auto-Auditoria

**Objetivo:** Rodar uma ferramenta real de auditoria de segurança na sua própria máquina, interpretar os resultados, e projetar os achados no ambiente da MedDefense.

## Contexto

Você tem lido um relatório de scan que outra pessoa produziu. Agora você vai gerar o seu próprio. O Lynis é uma ferramenta de auditoria de segurança open-source que verifica seu sistema contra centenas de boas práticas de segurança: hardening de kernel, autenticação, permissões de arquivo, rede, logging, detecção de malware e mais.

Rodá-lo na sua própria máquina te ensina o que um scanner realmente verifica, como ler a saída bruta de uma auditoria, e como distinguir achados importantes de ruído. Depois você vai projetar esse entendimento sobre o ambiente da MedDefense.

## Instruções

### Parte 1: Instalar e Rodar

Na sua máquina Linux ou VM:

```
# Instalar o Lynis
sudo apt update && sudo apt install lynis -y
# OU clonar do GitHub pra versão mais recente
# git clone https://github.com/CISOfy/lynis && cd lynis

# Rodar uma auditoria completa do sistema
sudo lynis audit system
```

### Parte 2: Analisar Resultados

Depois que a auditoria terminar, documente:

- **Hardening Index:** Que nota sua máquina recebeu?
- **Top 5 Warnings:** Liste os 5 avisos mais críticos. Para cada um: o que o Lynis verifica, por que importa, e qual seria a correção.
- **Top 5 Suggestions:** Liste as 5 sugestões mais relevantes (da seção "Suggestions"). Para cada uma: explique qual melhoria de segurança ela recomenda.
- **Detalhamento por Categoria:** O Lynis organiza as verificações por categoria (Kernel, Autenticação, Rede, etc.). Quais categorias tiveram melhor resultado? Quais tiveram pior? O que isso diz sobre a postura de segurança do seu sistema?

### Parte 3: Projeção para a MedDefense

Sem acesso aos servidores da MedDefense, projete o que o Lynis provavelmente encontraria no `billing-srv-01` (Ubuntu 18.04, Apache 2.4.29, MySQL, histórico de comprometimento por cryptominer, autenticação SSH por senha habilitada). Liste 5 achados específicos que você esperaria que o Lynis sinalizasse nesse servidor, com sua justificativa para cada previsão.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `8-lynis_audit.md`
