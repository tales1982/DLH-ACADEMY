# Inventário de Controles de Segurança — MedDefense Health Systems

## Controles

### C-001
- **Nome do Controle:** Regra de Firewall — Restrição de Entrada Web
- **Descrição:** A política "Allow-Web-Inbound" do FortiGate só permite tráfego HTTP/HTTPS vindo da internet para o `web-srv-01`, na DMZ; qualquer outro caminho de entrada é bloqueado por padrão, e o tráfego que passa é registrado.
- **Categoria:** Técnico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** `web-srv-01` (site público / portal do paciente)
- **Fonte:** Artefato 1 — Configuração de Firewall, regra "Allow-Web-Inbound"

### C-002
- **Nome do Controle:** Regra de Firewall — Acesso ao Servidor Restrito a VPN
- **Descrição:** As políticas "Allow-VPN-Westside" e "Allow-VPN-HQ" só deixam tráfego alcançar a subnet de servidores se ele vier pelas interfaces de VPN site-a-site, bloqueando acesso direto da internet a essa subnet.
- **Categoria:** Técnico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Subnet de servidores (`ehr-srv-01`, `ehr-db-01`, `billing-srv-01`, `ad-dc-01`, `file-srv-01`)
- **Fonte:** Artefato 1 — Configuração de Firewall, regras "Allow-VPN-Westside" / "Allow-VPN-HQ"

### C-003
- **Nome do Controle:** Regra de Firewall Deny-All (Padrão de Bloqueio)
- **Descrição:** A última política ("Deny-All") bloqueia e registra qualquer tráfego que não tenha batido com nenhuma regra de permissão anterior.
- **Categoria:** Técnico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Toda a rede interna
- **Fonte:** Artefato 1 — Configuração de Firewall, regra "Deny-All"

### C-004
- **Nome do Controle:** Autenticação SSH Somente por Chave (ehr-srv-01)
- **Descrição:** O `sshd_config` desativa login por senha e login como root, exigindo autenticação por chave pública para acessar o servidor via SSH.
- **Categoria:** Técnico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** `ehr-srv-01`
- **Fonte:** Artefato 2 — Configuração SSH

### C-005
- **Nome do Controle:** Log Detalhado de Autenticação SSH (ehr-srv-01)
- **Descrição:** O `sshd_config` define `LogLevel VERBOSE` e registra na facility AUTH, guardando um registro das tentativas de autenticação no servidor.
- **Categoria:** Técnico
- **Função:** Detectivo
- **Ativo(s) Protegido(s):** `ehr-srv-01`
- **Fonte:** Artefato 2 — Configuração SSH

### C-006
- **Nome do Controle:** Política de Complexidade e Rotação de Senha
- **Descrição:** A política da empresa exige senhas com 8+ caracteres, maiúscula, minúscula, número e símbolo, trocadas a cada 90 dias, com histórico das últimas 5 senhas.
- **Categoria:** Administrativo
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Todas as contas de usuário
- **Fonte:** Artefato 3 — Política de Senhas

### C-007
- **Nome do Controle:** Bloqueio de Conta por Tentativas Falhas
- **Descrição:** Contas ficam bloqueadas por 30 minutos após 5 tentativas de login falhas, aplicado via Group Policy do Active Directory nos sistemas Windows.
- **Categoria:** Técnico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Contas de usuário gerenciadas pelo AD (sistemas Windows)
- **Fonte:** Artefato 3 — Política de Senhas, Seção 5 (Aplicação)

### C-008
- **Nome do Controle:** Proteção de Endpoint Sophos
- **Descrição:** Antivírus implantado em 372 estações Windows 10/11, bloqueando e colocando em quarentena ameaças detectadas ativamente (ex: adware, URLs de phishing, trojans nos últimos 30 dias).
- **Categoria:** Técnico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Estações Windows (Central, Westside, HQ)
- **Fonte:** Artefato 4 — Relatório de Status do Antivírus Sophos

### C-009
- **Nome do Controle:** Backup Completo Noturno (Veeam)
- **Descrição:** O Veeam roda um backup completo noturno das VMs principais para o NAS-01, retido por 14 dias, permitindo restauração após perda ou corrupção de dados.
- **Categoria:** Técnico
- **Função:** Corretivo
- **Ativo(s) Protegido(s):** `ehr-srv-01`, `ehr-db-01`, `billing-srv-01`, `ad-dc-01`, `file-srv-01`, `web-srv-01`
- **Fonte:** Artefato 5 — Configuração de Backup

### C-010
- **Nome do Controle:** Guarda de Segurança Uniformizado (Entrada Principal)
- **Descrição:** Um guarda da ClearView fica na entrada principal do Central de segunda a sexta, 07h–19h, registrando visitantes e verificando crachás antes de permitir a entrada.
- **Categoria:** Físico
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Entrada principal / recepção do Central
- **Fonte:** Artefato 6 — Contrato de Segurança Física

### C-011
- **Nome do Controle:** Cobertura de Câmeras (CFTV)
- **Descrição:** Câmeras analógicas cobrem a entrada principal, entrada do PS e garagem no Central (gravadas em DVR de 30 dias), mais uma câmera na entrada principal da Westside.
- **Categoria:** Físico
- **Função:** Detectivo
- **Ativo(s) Protegido(s):** Entradas do prédio, garagem
- **Fonte:** Artefato 6 — Contrato de Segurança Física, Sistema de Câmeras

### C-012
- **Nome do Controle:** Treinamento Anual de Conscientização em Segurança
- **Descrição:** Módulo obrigatório "CyberSafe Basics" cobrindo higiene de senhas, reconhecimento de phishing e consciência de segurança física para todos os funcionários.
- **Categoria:** Administrativo
- **Função:** Preventivo
- **Ativo(s) Protegido(s):** Todos os funcionários / todos os sistemas (reduz erro humano)
- **Fonte:** Artefato 7 — Registros de Treinamento

### C-013
- **Nome do Controle:** Retenção Local de Logs de Tráfego do FortiGate
- **Descrição:** O firewall retém seus próprios logs de tráfego localmente por 30 dias, fornecendo um registro da atividade de rede para revisão posterior.
- **Categoria:** Técnico
- **Função:** Detectivo
- **Ativo(s) Protegido(s):** Perímetro de rede (visibilidade)
- **Fonte:** Artefato 8 — Gestão de Logs

## Matriz Resumo de Controles

| | Preventivo | Detectivo | Corretivo | Compensatório | Dissuasório |
|---|---|---|---|---|---|
| **Técnico** | C-001, C-002, C-003, C-004, C-007, C-008 | C-005, C-013 | C-009 | | |
| **Administrativo** | C-006, C-012 | | | | |
| **Físico** | C-010 | C-011 | | | |
