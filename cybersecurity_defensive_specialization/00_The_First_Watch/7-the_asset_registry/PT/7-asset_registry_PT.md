# Registro de Ativos — MedDefense Health Systems

## Registro

| Asset ID | Nome | Tipo | Localização | Dono (Depto) | SO/Plataforma | Serviços Críticos | Segmento de Rede | Status | Notas |
|---|---|---|---|---|---|---|---|---|---|
| A-001 | ehr-srv-01 | Servidor | Central, sala de servidores | TI | Ubuntu 20.04 | Aplicação EHR | 10.10.2.0/24 | Ativo | Backup noturno via Veeam |
| A-002 | ehr-db-01 | Servidor | Central, sala de servidores | TI | Ubuntu 20.04 / PostgreSQL | Banco de dados do EHR | 10.10.2.0/24 | Ativo | Porta 5432 aberta pra rede inteira; deveria ser restrita ao A-001 |
| A-003 | pacs-srv-01 | Servidor | Central, sala de servidores | TI | Windows Server 2016 | Imagens PACS | 10.10.2.0/24 | Ativo | Não coberto pelo backup noturno |
| A-004 | billing-srv-01 | Servidor | Central, sala de servidores | Financeiro/TI | Ubuntu 18.04 (Apache 2.4.29) | Faturamento/reembolsos | 10.10.2.0/24 | Ativo | Comprometido duas vezes (ransomware Task 1, minerador Task 2); suporte padrão encerrado |
| A-005 | ad-dc-01 | Servidor | Central, sala de servidores | TI | Windows Server 2019 | Controlador de domínio primário | 10.10.2.0/24 | Ativo | — |
| A-006 | ad-dc-02 | Servidor | Central, sala de servidores | TI | Windows Server 2019 | Controlador de domínio secundário | 10.10.2.0/24 | Ativo | — |
| A-007 | file-srv-01 | Servidor | Central, sala de servidores | TI | Windows Server 2016 | Compartilhamentos de arquivo | 10.10.2.0/24 | Ativo | — |
| A-008 | print-srv-01 | Servidor | Central, sala de servidores | TI | Windows Server 2012 R2 | Serviços de impressão | 10.10.2.0/24 | Descontinuado | EOL out/2023, ainda em produção |
| A-009 | backup-srv-01 | Servidor | Central, sala de servidores | TI | Ubuntu 22.04 (Veeam) | Orquestração de backup | 10.10.2.0/24 | Ativo | Mesmo rack do A-010 — ponto único de falha |
| A-010 | NAS-01 | Repositório de Dados | Central, sala de servidores | TI | Synology DSM 7 | Armazenamento de backup (24TB) | 10.10.2.0/24 | Ativo | Sem cópia offsite; DR completo nunca testado |
| A-011 | web-srv-01 | Servidor | Central, DMZ | TI | Ubuntu 20.04 | Site + hospeda o Portal do Paciente | 10.10.2.0/24 | Ativo | Hospeda o A-018 |
| A-012 | UNKNOWN-01 | Servidor | Central, subnet de servidores (10.10.2.99) | Desconhecido | Linux 4.x | Não identificado (SSH + 2 serviços web) | 10.10.2.0/24 | Shadow IT | Não consta em nenhuma documentação |
| A-013 | Frota de Estações (Central) | Endpoint | Central, todos os andares | Clínico/Admin | Windows 10 (~320 unidades) | Uso geral da equipe | 10.10.1.0/24 | Ativo | — |
| A-014 | WS-RAD-01 (controle do MRI) | IoT Médico | Central, Radiologia | Radiologia | Windows XP SP3 | Controle de imagem do MRI | 10.10.1.0/24 | Ativo | Não pode ser corrigido/atualizado/substituído/desconectado (Task 6) |
| A-015 | Frota de Monitores Philips IntelliVue | IoT Médico | Central, UTI/PS/3º andar | Clínico | Firmware Philips | Monitoramento de sinais vitais | 10.10.3.0/24 | Ativo | Rede plana — sem separação de VLAN do A-013 |
| A-016 | Frota de Bombas BD Alaris | IoT Médico | Central, UTI/PS/3º andar | Clínico | fw 12.1.2 (~120 unidades) | Aplicação de dosagem de medicamentos | 10.10.3.0/24 | Ativo | CVEs conhecidas; isolamento recomendado pelo fabricante nunca feito |
| A-017 | MON-VITALS-3F-01 | IoT Médico | Central, quarto 3º andar (10.10.3.47) | Clínico | Fabricante desconhecido | Monitoramento de sinais vitais | 10.10.3.0/24 | Desconhecido | Identificado pela primeira vez na volta pelas instalações do Task 3; fabricante não confirmado |
| A-018 | Portal do Paciente | Aplicação | Hospedado no A-011 | TI/Clínico | Aplicação web | Acesso a resultados de laboratório | N/A (camada de aplicação) | Ativo | Controle de acesso quebrado / IDOR (Task 1, Incidente B) |
| A-019 | Sistema de Gestão da Farmácia | Aplicação | Desconhecido — nos 3 sites | Farmácia | Desconhecido | Registros de dosagem de medicamentos | Desconhecido | Desconhecido | Citado no Incidente C do Task 1; nenhum host identificado na varredura |
| A-020 | FortiGate 100F | Dispositivo de Rede | Central, sala de servidores | TI | FortiOS | Firewall de perímetro / terminação de VPN | Perímetro | Ativo | Regra de saída irrestrita habilitada — causa raiz do Task 2 |
| A-021 | Frota de APs UniFi | Dispositivo de Rede | Central, todos os andares | TI | Ubiquiti UniFi (12 unidades) | Acesso sem fio | 10.10.1.0/24 | Ativo | — |
| A-022 | Armário de Rede (2º andar) | Infraestrutura Física | Central, 2º andar | TI | N/A | Abriga switches/patch panels | N/A | Ativo | Sem fechadura, credenciais coladas na parede (Task 3, Obs. 2) |
| A-023 | Notebook Pessoal do Estagiário de TI | Endpoint | Central (estava no WiFi interno) | N/A (dispositivo pessoal) | Desconhecido | Cliente de torrent não autorizado | 10.10.1.0/24 | Shadow IT | Contornou a rede de convidados por 3 semanas (Task 1, Incidente F) |
| A-024 | ws-srv-01 | Servidor | Westside Clinic | TI | Windows Server 2016 | Servidor de arquivos local + agendamento | 10.10.10.0/24 | Ativo | Possível segundo servidor da Westside nunca confirmado |
| A-025 | Dispositivo Desconhecido (Westside) | Servidor | Westside Clinic (10.10.10.200) | Desconhecido | Linux 5.x | Não identificado (porta 3000) | 10.10.10.0/24 | Shadow IT | Não consta em nenhuma documentação; possível ferramenta de monitoramento não oficial |

## Notas de Reconciliação

### Ativos na varredura de rede mas ausentes de qualquer documentação (Shadow IT / não documentados)

- **A-012 (UNKNOWN-01, 10.10.2.99):** host Linux não identificado com dois serviços web, na mesma subnet dos servidores principais. Sarah não tem nenhum registro dele; suspeita que seja do Marcus ou do estagiário de TI.
- **A-025 (10.10.10.200, Westside):** host Linux não identificado com a porta 3000 aberta (comumente Grafana ou Node.js). Nenhuma documentação em lugar nenhum. Possivelmente uma ferramenta de monitoramento não oficial que alguém configurou.
- **WS-WC-XRAY (10.10.10.100, Westside):** uma estação de raio-X específica de fornecedor aparece na varredura, mas nenhuma fonte anterior a detalhou individualmente — o Task 0 só descreveu a capacidade de imagem da Westside de forma genérica ("raio-X, ultrassom").

### Ativos na documentação mas ausentes da varredura de rede

- **Segundo servidor da Westside:** a nota do Marcus no Task 0 dizia "pode haver outro servidor no armário" da Westside. Ele não aparece em lugar nenhum da varredura, o que sugere que ou não existe, ou estava desligado durante a janela de varredura.
- **A-019 (Sistema de Gestão da Farmácia):** citado explicitamente no registro de incidentes do Task 1, mas nenhum host na varredura está claramente identificado como rodando esse sistema — pode estar num dispositivo não documentado, num serviço de nuvem do fornecedor, ou embutido em outro sistema que não foi identificado separadamente.
- **Rede WiFi de convidados (Central):** tanto o Task 0 quanto o Task 3 mencionam um SSID de convidados separado, mas nenhuma subnet de convidados distinta aparece em lugar nenhum nos resultados da varredura — o que levanta a dúvida se o tráfego de convidados está de fato segmentado, ou só rotulado logicamente.

### Discrepâncias ou contradições entre as fontes

- O diagnóstico do Task 2 apontou o Apache 2.4.29 no `billing-srv-01` (A-004) como o provável ponto de entrada dos dois comprometimentos; a varredura de rede só mostra a porta 80 aberta e não confirma de forma independente a versão do servidor web. Essa afirmação ainda precisa de verificação direta, não só repetição.
- As contagens de dispositivos médicos do Task 0 (~80 monitores, ~120 bombas) são razoavelmente consistentes com a varredura, uma vez consideradas as notas de "dispositivos adicionais omitidos por brevidade" — um dos poucos pontos em que a documentação e a varredura independente realmente concordam.
- O Task 0 descreveu a Westside como tendo seu próprio "armário de servidores para necessidades básicas", sugerindo uma estrutura pequena e autocontida; a varredura confirma apenas um servidor lá (A-024), junto com uma frota inteira de estações chegando ao prédio através de um roteador consumidor sem firewall — a exposição de rede é mais significativa do que a descrição original de "necessidades básicas" sugeria.
