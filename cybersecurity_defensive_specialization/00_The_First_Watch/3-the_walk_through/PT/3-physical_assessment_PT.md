# Avaliação de Segurança Física — MedDefense Central

<!-- Para cada observação, decomponha o risco em seus quatro componentes formais:
     Vulnerabilidade, Ameaça, Impacto (nomeie o(s) pilar(es) CIA) e Severidade
     (justificada em uma frase, ponderando facilidade de exploração x gravidade do impacto). -->

## Observação 1 — Acesso à Sala de Servidores

- **Vulnerabilidade:** A sala de servidores fica num corredor público, compartilhado com o refeitório; a porta aceita o mesmo crachá genérico de todo funcionário, sem câmera e sem registro de visitantes.
- **Ameaça:** Alguém sem motivo legítimo para estar ali (crachá emprestado, funcionário oportunista) entra sem ser notado, já que nada registra quem passou por lá.
- **Impacto:** Adulterar ou acessar o hardware quebra **Confidencialidade** e **Integridade**; danificar o equipamento quebra **Disponibilidade** — a sala hospeda o EHR e o servidor de faturamento.
- **Severidade:** Alta — não exige nenhuma habilidade técnica para explorar, e a sala hospeda sistemas críticos para o cuidado ao paciente e o faturamento.

## Observação 2 — Armário de Rede

- **Vulnerabilidade:** O armário de rede não tem fechadura, a porta fica entreaberta, e há uma folha colada na parede com usuário e senha da interface do switch, visível para qualquer pessoa que passe.
- **Ameaça:** Alguém sem autorização — um visitante, prestador de serviço, ou funcionário sem essa responsabilidade — entra no armário destrancado, lê as credenciais coladas na parede e as usa para logar na interface de gerenciamento do switch.
- **Impacto:** Com esse acesso, o invasor pode desligar o switch (**Disponibilidade**), reconfigurar portas ou VLANs (**Integridade**), ou espelhar portas para interceptar dados em trânsito (**Confidencialidade**).
- **Severidade:** Crítica — não exige nenhuma habilidade técnica (a senha está escrita na parede, a porta nem tranca), e o switch comprometido pode derrubar ou interceptar o tráfego de um andar inteiro.

## Observação 3 — Posto de Enfermagem

- **Vulnerabilidade:** A estação do EHR não tem bloqueio automático de sessão, e uma placa pede aos funcionários para não deslogar entre turnos, deixando prontuários de pacientes abertos na tela para qualquer um ver.
- **Ameaça:** Alguém que passa pelo posto sem ninguém por perto — um visitante, outro paciente, ou um funcionário sem necessidade de ver aquele prontuário — lê ou altera o prontuário aberto sem que ninguém perceba.
- **Impacto:** Ver o prontuário exposto quebra **Confidencialidade**; alterá-lo quebra **Integridade** — os dois expõem diretamente dados de saúde protegidos do paciente.
- **Severidade:** Alta — não exige nenhuma habilidade, só estar perto de uma estação pública, e o dado exposto é informação de saúde regulada do paciente.

## Observação 4 — Dispositivo Médico IoT

- **Vulnerabilidade:** O monitor de sinais vitais roda um firmware de 2019 e está na mesma faixa de rede das estações de trabalho comuns, sem nenhum isolamento para dispositivos médicos.
- **Ameaça:** Um atacante que comprometa qualquer estação nessa mesma faixa de rede consegue se mover lateralmente até o monitor e explorar falhas conhecidas do firmware desatualizado.
- **Impacto:** Adulterar o dispositivo ou suas leituras quebra **Integridade** e **Disponibilidade** — uma ameaça direta à segurança do paciente, já que a equipe clínica depende de sinais vitais precisos e contínuos.
- **Severidade:** Crítica — firmware desatualizado somado à falta de segmentação de rede significa que um comprometimento em qualquer lugar daquela faixa alcança um dispositivo de suporte à vida.

## Observação 5 — Saída de Emergência

- **Vulnerabilidade:** Uma saída de incêndio que liga a área pública de espera à ala administrativa restrita está presa aberta com uma cunha de madeira, anulando o controle de acesso que normalmente protegeria essa porta.
- **Ameaça:** Qualquer pessoa da área de espera — sem crachá, sem registro, sem acompanhamento — entra direto na ala administrativa, incluindo o corredor que leva à TI e às salas da diretoria.
- **Impacto:** A entrada física sem restrição na área de TI e diretoria quebra **Confidencialidade**, e pode viabilizar adulterações futuras (um dispositivo plantado, documentos roubados), quebrando **Integridade**.
- **Severidade:** Alta — não exige nenhuma habilidade ou esforço para explorar (a porta já está aberta), e dá acesso direto à TI e à diretoria sem nenhuma credencial.
