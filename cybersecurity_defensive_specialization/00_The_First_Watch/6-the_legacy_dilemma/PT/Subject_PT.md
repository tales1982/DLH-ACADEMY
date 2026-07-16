# 6. O Dilema do Sistema Legado

**Objetivo:** Desenhar uma estratégia de controles compensatórios para um sistema que não pode ser corrigido (patched), atualizado ou substituído, sob restrições operacionais reais.

## Contexto

Enquanto monta seu inventário de ativos, você visita o departamento de Radiologia do MedDefense Central. O departamento opera um aparelho de ressonância magnética (MRI) fabricado por uma empresa que desde então foi adquirida por outra. O software de controle do MRI roda em Windows XP Embedded. A certificação do fabricante só cobre essa versão específica do sistema operacional. Qualquer troca de SO anula a certificação do dispositivo médico e potencialmente viola requisitos regulatórios.

### Fatos-Chave

- O aparelho de MRI custou $2,1 milhões e está no 6º ano de uma vida útil operacional esperada de 12 anos.
- O Windows XP não recebe atualizações de segurança desde abril de 2014.
- A estação de controle do MRI precisa se comunicar com o servidor PACS (Picture Archiving and Communication System) para transmitir os exames de imagem. Ela exige conectividade de rede.
- O departamento de radiologia processa aproximadamente 45 exames de MRI por dia. Indisponibilidade afeta diretamente o cuidado ao paciente.
- A configuração atual de rede coloca a estação do MRI na mesma VLAN que o restante das estações de trabalho do hospital.

O Marcus deixou um post-it na pasta de arquivos do MRI:

> "CRÍTICO: isso está na minha mesa há 6 meses. Ninguém quer lidar com isso. O risco é real. -M"

## Instruções

Você não pode corrigir (patch) o sistema. Você não pode atualizar o SO. Você não pode substituir o equipamento (orçamento). Você não pode desconectá-lo da rede (necessidade clínica). Toda solução óbvia esbarra numa restrição real.

1. **Análise de Risco:** Explique em 3-4 frases por que essa estação do MRI representa um risco crítico de segurança para **toda a rede** da MedDefense, não só para o departamento de Radiologia. Conecte sua explicação a características específicas de vulnerabilidade do Windows XP e à arquitetura de rede.

2. **Estratégia de Controles Compensatórios:** Proponha no mínimo 3 controles compensatórios, de pelo menos 2 categorias diferentes (Técnico, Administrativo, Físico). Para cada controle:
   - Descreva especificamente o que ele faz.
   - Classifique-o (Categoria + Função).
   - Explique como ele reduz o risco sem exigir modificação do SO.
   - Identifique quaisquer limitações ou risco residual.

3. **Prioridade de Implementação:** Se a MedDefense só pudesse implementar UM dos controles que você propôs imediatamente (restrição de orçamento), qual proporcionaria a maior redução de risco? Justifique sua escolha.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `6-compensating_controls.md`
