# 4. O Vetor Humano

**Objetivo:** Identificar, classificar e analisar vetores de ataque de engenharia social num contexto de saúde, incluindo sinais de alerta e contramedidas.

## Contexto

O firewall mais sofisticado do mundo é inútil se um atacante conseguir ligar pra recepção e conversar até conseguir uma redefinição de senha. Engenharia social explora o único sistema que você não consegue corrigir com patch: a psicologia humana. Na saúde, a superfície de exploração é enorme. A equipe clínica é treinada pra ser prestativa. A equipe administrativa lida com pedidos urgentes o dia todo. Todo mundo está ocupado, estressado, e inclinado a tomar atalhos.

O framework Security+ (2.2) define esses vetores direcionados a humanos: phishing (e-mail), vishing (voz/telefone), smishing (SMS), pretexting (cenários fabricados), comprometimento de e-mail corporativo (BEC), personificação, ataques de watering hole, personificação de marca, e typosquatting. Cada um explora uma alavanca psicológica diferente: urgência, autoridade, familiaridade, medo, ou prestatividade.

## Instruções

Analise os 7 cenários de engenharia social a seguir, mirando a MedDefense. Para cada um, produza:

```
Cenário [N]:
  Tipo de Vetor: [Termo exato do Sec+ 2.2]
  Alvo: [Cargo na MedDefense + por que essa pessoa é vulnerável]
  Alavanca Psicológica: [Urgência / Autoridade / Familiaridade / Medo / Prestatividade / Curiosidade]
  Sinais de Alerta: [3 indicadores específicos que o alvo deveria notar]
  Controle Técnico: [Um controle que reduziria o risco]
  Controle Administrativo: [Uma política ou procedimento que reduziria o risco]
```

### Os Cenários

**Cenário 1:** Um e-mail chega na caixa de entrada de Sarah Park (Diretora de TI), parecendo vir do suporte FortiGate: "Vulnerabilidade crítica de firmware detectada no seu FortiGate 100F. Clique aqui para baixar o patch de emergência. Falha em corrigir dentro de 24 horas pode resultar em encerramento do serviço." O domínio do remetente é `fortinet-support.net`.

**Cenário 2:** O CFO (Robert Kim) recebe um e-mail do que parece ser a Dra. Patricia Morales (CEO): "Robert, preciso que você processe uma transferência de $85.000 pra conta abaixo imediatamente. Isso é pra uma aquisição de equipamento confidencial. Não discuta com ninguém até o negócio fechar. Estou em reuniões o dia todo, só e-mail." O endereço do remetente tem uma diferença sutil do e-mail real da CEO.

**Cenário 3:** Uma enfermeira no MedDefense Central atende o telefone. O ligante se identifica como "Mike, da TI" e diz: "Estamos fazendo uma auditoria de segurança de emergência depois do incidente do servidor de faturamento. Preciso verificar se seu login está funcionando corretamente. Pode me ler seu usuário e a senha que você usa pro sistema de EHR?"

**Cenário 4:** Todos os funcionários da MedDefense recebem uma mensagem de texto: "Estacionamento MedDefense: Sua permissão de estacionamento de funcionário expira amanhã. Renove imediatamente para evitar reboque: [link]." O link leva a uma página que parece o portal interno de RH da MedDefense e pede credenciais do AD.

**Cenário 5:** O site da Regional Healthcare Association (um grupo do setor que médicos da MedDefense visitam mensalmente por créditos de educação continuada) é comprometido. Visitantes que navegam por páginas específicas são silenciosamente redirecionados para um site que tenta explorar uma vulnerabilidade de navegador pra instalar malware.

**Cenário 6:** Alguém registra o domínio `meddefence-portal.com` (repare: "defence" em vez de "defense"). Eles criam uma cópia pixel-perfeita do portal do paciente da MedDefense. Anúncios do Google são comprados pra que esse portal falso apareça acima do real nos resultados de busca por "MedDefense patient portal."

**Cenário 7:** Uma pessoa de jaleco, carregando um estetoscópio e um copo de café com a marca do hospital, se aproxima do corredor restrito que leva ao departamento de TI. Ela segue um funcionário através da porta controlada por crachá, dizendo calorosamente: "Obrigada! Meu crachá está no meu armário, só estou voltando pra pegar uma coisa na minha mesa." O crachá de visitante dela, parcialmente escondido pelo estetoscópio, expirou há dois dias.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x01_know_your_enemy`
- **Arquivo:** `4-social_engineering_analysis.md`
