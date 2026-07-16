# Briefing para o Conselho — Postura de Segurança da MedDefense

*(Tradução de apoio — a versão em inglês é o entregável oficial e respeita o limite de 300 palavras.)*

A segurança da MedDefense hoje impede que alguns ataques comecem, mas tem quase nenhuma forma de perceber um que tenha sucesso, ou de se recuperar depois.

**Achado Crítico:** Nossos sistemas geram logs de segurança, mas ninguém os revisa, e nada nos alerta automaticamente. Uma infecção de mineração de criptomoeda rodou sem detecção no nosso servidor de faturamento por duas semanas, descoberta só porque deixou o computador lento. Se um atacante mais sério tivesse entrado do mesmo jeito, provavelmente só descobriríamos depois que o cuidado ao paciente já tivesse sido interrompido.

**Ações Prioritárias:**
1. Instalar um monitoramento básico que nos alerte sobre atividade suspeita, começando pelos nossos sistemas mais críticos — cerca de $30.000, dentro de um mês.
2. Tirar nosso único backup de dados da mesma rede dos sistemas que ele protege, e guardar uma cópia fora do local — cerca de $14.400 por ano, dentro de um mês.
3. Separar nossos dispositivos de dosagem de medicamentos numa rede protegida própria, para que uma violação em outro lugar não consiga alcançá-los — cerca de $30.000, neste trimestre.

**Argumento de Negócio:** Uma única violação hospitalar parecida que revisamos custou $3,2 milhões pra se recuperar e onze dias de desvio de ambulâncias — nosso orçamento inteiro de $120.000 é menos de quatro por cento desse único mês ruim.

**Encerramento:** Sem ação, o resultado mais provável não é um risco futuro hipotético, mas uma repetição do que já aconteceu duas vezes na nossa própria rede.
