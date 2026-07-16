# 3. A Volta pelas Instalações

**Objetivo:** Aplicar o raciocínio estruturado de risco (Vulnerabilidade, Ameaça, Impacto) a observações físicas em um ambiente real.

## Contexto

James Chen leva você para um tour pelo MedDefense Central. "Observe com os olhos frescos," ele diz. "O Marcus me disse pelo menos duas vezes que o acesso à sala de servidores era um problema. Eu sinalizei isso para a Sarah Park, na TI. Ela disse que estava 'no roadmap.' Isso foi há cinco meses."

Enquanto você caminha pelas instalações, percebe detalhes que um profissional fora da área de segurança passaria despercebido. Cada observação representa uma fragilidade de segurança em potencial. Seu trabalho é decompor cada uma delas em seus componentes formais de risco.

Um risco existe quando três elementos convergem:

- **Vulnerabilidade:** Uma fragilidade ou lacuna específica em um sistema, processo ou estrutura física.
- **Ameaça:** Um evento, agente ou circunstância que poderia explorar a vulnerabilidade.
- **Impacto:** A consequência para a organização caso a ameaça se concretize, medida contra os pilares da CIA.

## Observações

### Observação 1 — Acesso à Sala de Servidores

A sala de servidores fica no térreo, acessada por um corredor compartilhado com o refeitório. A porta usa o mesmo crachá genérico que todo funcionário (clínico, administrativo, de limpeza) recebe no primeiro dia. Não há câmera cobrindo a porta. Não há registro de visitantes.

### Observação 2 — Armário de Rede

Um armário de rede no segundo andar (contendo switches e patch panels) não tem fechadura. A porta está entreaberta. Dentro, colado na parede ao lado do rack de switches, há uma folha plastificada com o rótulo "Credenciais de Manutenção de Rede", contendo usuário e senha para a interface de gerenciamento do switch.

### Observação 3 — Posto de Enfermagem

No posto de enfermagem do terceiro andar, uma estação de trabalho está logada no sistema de EHR com o prontuário de um paciente visível na tela. Nenhum funcionário está presente. A sessão parece estar ociosa há pelo menos 15 minutos. Uma placa acima do posto diz: "Para eficiência, por favor não desconecte entre turnos."

### Observação 4 — Dispositivo Médico IoT

Em um quarto de paciente, um monitor de sinais vitais conectado exibe informações de diagnóstico incluindo o endereço IP do dispositivo (`10.10.3.47`) e a versão do firmware (`v2.1.3`, última atualização em 2019). O cabo de rede vai até uma tomada de parede rotulada "MED-3F-12." Você percebe que essa é a mesma faixa de IP das estações de trabalho que você viu no posto de enfermagem.

### Observação 5 — Saída de Emergência

Uma porta de saída de incêndio entre a área pública de espera e a ala administrativa restrita está presa aberta com uma cunha de madeira. Um aviso manuscrito colado na porta diz: "Por favor não fechar, passagem de funcionários." Através da porta aberta, é possível ver o corredor que leva ao departamento de TI e à sala do James Chen.

## Instruções

Você observa o seguinte durante sua volta pelas instalações do MedDefense Central. Para cada observação, produza uma decomposição estruturada de risco.

Para cada observação, entregue:

```
Observação [N]:
  Vulnerabilidade: [A fragilidade específica]
  Ameaça: [Um cenário plausível que explora essa fragilidade]
  Impacto: [O que acontece se a ameaça se concretizar - especifique o(s) pilar(es) CIA]
  Severidade: [Crítica / Alta / Média / Baixa - justificada em uma frase]
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `3-physical_assessment.md`
