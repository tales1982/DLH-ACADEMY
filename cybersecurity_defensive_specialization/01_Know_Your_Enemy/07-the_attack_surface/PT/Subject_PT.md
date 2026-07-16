# 7. A Superfície de Ataque

**Objetivo:** Mapear sistematicamente a superfície de ataque da MedDefense em três dimensões: externa, interna e humana.

## Contexto

Uma superfície de ataque é todo ponto onde um atacante poderia tentar interagir com seus sistemas, seus dados ou suas pessoas. Não é a mesma coisa que uma vulnerabilidade. Uma porta trancada faz parte da superfície de ataque. Uma porta trancada com a fechadura quebrada é uma vulnerabilidade nessa superfície. Entender a superfície te diz onde olhar. Encontrar as vulnerabilidades te diz o que consertar.

Essa tarefa usa bastante o Resumo de Varredura de Rede e o Registro de Ativos do Projeto 1x00. Tenha-os abertos.

## Instruções

Produza um Mapa de Superfície de Ataque da MedDefense organizado em três seções.

### Seção 1: Superfície Externa (acessível pela Internet)

Para cada ponto de entrada, documente: o que é, qual ativo está por trás, qual proteção existe (referencie controles do 1x00) e qual gap está documentado (referencie gaps do 1x00).

Cubra no mínimo: portal do paciente (`web-srv-01`), endpoints de VPN, infraestrutura de e-mail (O365), site público, DNS, e qualquer outro serviço acessível externamente identificado na varredura de rede.

### Seção 2: Superfície Interna (acessível uma vez dentro da rede)

Essa seção deve referenciar proeminentemente o achado de rede plana (flat network) do 1x00. Documente: serviços expostos (MySQL no `billing-srv-01`, PostgreSQL no `ehr-db-01`, ambos acessíveis por toda a rede), interfaces de gerenciamento (NAS, admin do FortiGate, interfaces web de IoT), sistemas legados (Windows XP, Server 2012 R2), credenciais padrão (PACS, IoT médico), e a ausência de segmentação de rede.

Para cada entrada: o ativo, a exposição (porta/serviço da varredura de rede), e por que isso importa numa rede plana.

### Seção 3: Superfície Humana (pessoas que podem ser alvo)

Mapeie os alvos humanos por cargo, nível de acesso e vulnerabilidade a engenharia social. Cubra: equipe clínica (acesso ao EHR, baixa conclusão de treinamento de segurança), recepção (ponto de acesso físico, primeiro contato), equipe de TI (privilégios elevados, equipe pequena = fadiga), executivos (alvos de BEC, informação estratégica), e contratados externos (acesso além do controle direto da MedDefense).

Para cada cargo: o que eles conseguem acessar, por que são alvos, e qual gap de treinamento ou controle (do 1x00) aumenta o risco deles.

### Entrega Final

No final, escreva um **Resumo de Avaliação de Superfície** (um parágrafo): Qual das três superfícies representa o maior risco para a MedDefense hoje, e por quê?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `7-attack_surface_map.md`
