# Estratégia de Controles Compensatórios — Estação de MRI (Radiologia, Central)

## 1. Análise de Risco

Essa estação de MRI é um risco para a rede inteira, não só para a Radiologia, porque o Windows XP não recebe atualizações de segurança desde 2014 — mais de uma década de falhas públicas e já armadas (incluindo as vulnerabilidades baseadas em SMB que alimentaram o WannaCry, que atacava justamente sistemas Windows sem correção) se aplicam a ele. Como a estação fica na mesma VLAN que todas as outras estações do hospital, não existe nenhuma fronteira de rede isolando-a: um atacante que comprometa qualquer estação comum consegue pivotar diretamente até o MRI, e um atacante que comprometa o próprio MRI — um alvo fácil dado seu sistema operacional — consegue pivotar lateralmente até sistemas que guardam PHI. A característica de vulnerabilidade (um SO antigo, sem correção, amplamente explorado) se combina com a característica de arquitetura (uma rede plana, sem segmentação) para transformar um único equipamento legado numa porta de entrada — ou num ponto de pivô — para a rede do hospital inteira, não um problema isolado do departamento de Radiologia.

## 2. Estratégia de Controles Compensatórios

### Controle 1
- **Descrição:** Mover a estação do MRI da VLAN compartilhada do hospital para um segmento de rede isolado só dela, com uma regra de firewall permitindo apenas o tráfego necessário para alcançar o servidor PACS — nada mais entra ou sai.
- **Categoria:** Técnico
- **Função:** Compensatório
- **Como reduz o risco (sem modificar o SO):** Não toca na instalação do Windows XP em nenhum momento; muda só onde a estação fica posicionada na rede. Isso remove a exposição identificada na Análise de Risco — em vez de ser alcançável por (e conseguir alcançar) qualquer outra estação do hospital, o MRI só consegue falar com o único sistema que realmente precisa.
- **Limitações / Risco Residual:** Não corrige as vulnerabilidades não corrigidas em si. Se um atacante comprometer o próprio servidor PACS (o único sistema ainda autorizado a falar com o MRI), ou obtiver acesso local/físico à estação, esse controle não oferece nenhuma proteção. Também depende da regra de firewall ser configurada e mantida corretamente.

### Controle 2
- **Descrição:** Estabelecer um processo formal e documentado de aceitação de risco e monitoramento para o MRI: uma exceção por escrito, assinada tanto pela liderança de TI quanto pela liderança clínica/compliance, com revisão trimestral obrigatória, um responsável nomeado para acompanhar o caso, e um prazo definido de substituição atrelado aos 6 anos restantes de vida útil do equipamento.
- **Categoria:** Administrativo
- **Função:** Compensatório
- **Como reduz o risco (sem modificar o SO):** Não toca no equipamento de forma alguma — garante que o risco já conhecido seja ativamente rastreado e escalado para quem tem autoridade de orçamento, em vez de ficar parado sem resposta, como já está há 6 meses na mesa do Marcus.
- **Limitações / Risco Residual:** É puro processo, não uma proteção técnica — não reduz a exposição real do equipamento. Se as revisões forem puladas ou tratadas como formalidade, o controle não oferece proteção nenhuma, e depende inteiramente do cumprimento organizacional, que a MedDefense já demonstrou ser inconsistente em outras áreas (ex: solicitações de segurança sem resposta por meses).

### Controle 3
- **Descrição:** Restringir o acesso físico à estação de controle do MRI apenas à equipe autorizada de radiologia, e desativar ou travar fisicamente as portas USB da máquina para impedir a conexão de mídia removível.
- **Categoria:** Físico
- **Função:** Preventivo
- **Como reduz o risco (sem modificar o SO):** Mesmo com o isolamento de rede em vigor, qualquer pessoa que consiga chegar fisicamente perto da estação poderia conectar um dispositivo USB e contornar completamente todos os controles de rede. Restringir o acesso físico e travar as portas USB fecha esse caminho sem tocar no SO.
- **Limitações / Risco Residual:** Não protege contra as credenciais de um funcionário autorizado sendo comprometidas, nem contra mau uso através do único canal de rede ainda permitido (PACS). A restrição física só é tão forte quanto o sistema de crachá/porta que a aplica — que a volta pelas instalações do Task 3 já mostrou ser fraco em outras partes do prédio.

## 3. Prioridade de Implementação

Se apenas um controle pudesse ser implementado imediatamente, o **Controle 1 (segmentação de rede)** proporciona a maior redução de risco. Ele ataca diretamente a exposição arquitetural identificada na Análise de Risco — a VLAN plana e sem segmentação — em vez de gerenciar o problema administrativamente ou fechar um caminho secundário de contorno. Também é uma mudança técnica pontual que, uma vez configurada corretamente, não depende de cumprimento humano contínuo como o Controle 2 depende, e protege contra o caminho de ataque mais provável e escalável (comprometimento via rede e movimento lateral), em vez do caminho de acesso físico, que exige que o atacante já esteja dentro do prédio.
