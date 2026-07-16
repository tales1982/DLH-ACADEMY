# 5. As Peças Faltantes

**Objetivo:** Identificar lacunas sistêmicas num framework de controles, analisando o que está ausente — não só o que está presente.

## Contexto

Você dá um passo atrás e observa sua Matriz Resumo de Controles do Task 4. Algumas células estão preenchidas. Outras estão vazias. As células vazias não são acidentes. Elas representam pontos cegos sistemáticos na postura de segurança da MedDefense.

James Chen olha por cima do seu ombro para a matriz:

> "Está vendo essas lacunas? É isso que me tira o sono à noite. Temos fechaduras em algumas portas, mas nenhuma câmera para ver quem está passando. Temos um firewall, mas nada que nos avise se alguém consegue passar por ele. Temos um processo de backup, mas nenhum procedimento de recuperação testado."

## Instruções

Analise sua Matriz Resumo de Controles (Task 4) e identifique no mínimo **6 lacunas de controle significativas**. Uma lacuna é significativa quando:

- Um ativo crítico não tem nenhum controle de uma função específica (ex: o servidor de EHR tem controles preventivos, mas nenhum controle detectivo).
- Uma função inteira está ausente de uma categoria (ex: não existem controles Administrativos Corretivos).
- Um controle existe, mas não cobre um ativo crítico (ex: o antivírus está implantado em servidores, mas não nas estações de trabalho).

Para cada lacuna, documente:

```
Gap ID: [G-001, G-002, etc.]
Gap Description: [O que está faltando -- seja específico]
Category x Function Missing: [ex: "Technical Detective"]
Affected Asset(s) or Zone: [O que fica desprotegido]
Risk if Unaddressed: [O que poderia acontecer -- conecte aos pilares CIA]
Evidence: [Por que você sabe que isso está faltando -- referencie sua matriz, os artefatos ou suas observações]
```

Ao final, responda esta pergunta em 2-3 frases:

> Olhando para suas lacunas como um todo, que padrão você enxerga? A postura de segurança da MedDefense é mais orientada à prevenção ou à detecção? O que isso implica sobre a capacidade da empresa de responder a um incidente que consiga passar pelos controles preventivos?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `5-control_gaps.md`
