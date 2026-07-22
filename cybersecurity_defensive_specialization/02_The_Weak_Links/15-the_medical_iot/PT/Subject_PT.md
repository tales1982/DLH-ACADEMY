# 15. O IoT Médico

**Objetivo:** Avaliar vulnerabilidades em dispositivos médicos conectados com atenção específica às implicações para a segurança do paciente.

## Contexto

Uma vulnerabilidade numa estação de trabalho e uma vulnerabilidade numa bomba de infusão não são a mesma categoria de problema. Uma pode roubar dados. A outra pode afetar a dosagem. O relatório de scan encontrou achados tanto nos monitores Philips quanto nas bombas BD Alaris. O boletim da BD é real. O risco é real.

## Instruções

Analise os achados de IoT médico do relatório de scan (Achados 010, 016, 024 e quaisquer achados relacionados).

1. **Avaliação BD Alaris:** Pesquise o boletim de segurança da BD Alaris para o firmware 12.1.2. (Pesquise por "BD Alaris security bulletin" ou verifique bd.com.) Documente: qual vulnerabilidade é descrita, o que o fornecedor recomenda como mitigação, e se a MedDefense implementou a recomendação.
2. **Avaliação Philips IntelliVue:** Os monitores expõem interfaces web não autenticadas e portas HL7 na rede plana. Que dados fluem através dessas interfaces? O que um atacante com acesso de rede seria capaz de ver ou fazer?
3. **Dimensão de Segurança do Paciente:** Em 3-4 frases, explique por que vulnerabilidades em dispositivos médicos estão numa categoria de risco diferente das vulnerabilidades de sistemas de TI. Qual é o pior cenário para uma bomba de infusão comprometida vs uma estação de trabalho comprometida?
4. **Desafio de Correção:** Por que corrigir dispositivos médicos é mais difícil do que corrigir sistemas de TI? Identifique pelo menos 3 fatores específicos de dispositivos médicos (regulatório, operacional, dependência do fornecedor).

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `15-medical_iot.md`
