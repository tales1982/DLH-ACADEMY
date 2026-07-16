# 15. As Anotações do Antecessor

**Objetivo:** Avaliar criticamente uma análise de terceiros, reconciliá-la com seus próprios achados, validar ou contestar suas conclusões, e usá-la para identificar prioridades de segurança voltadas para o futuro.

## Contexto

Enquanto termina de esvaziar as gavetas da mesa do Marcus para tornar o espaço seu, você encontra um envelope lacrado no fundo. Dentro, um documento intitulado "MedDefense Security Assessment, DRAFT v0.3, Marcus Webb." Datado de três meses atrás, a semana antes de o Marcus sair.

O documento está incompleto. O Marcus claramente pretendia terminá-lo, mas ficou sem tempo ou paciência. Ainda assim, ele contém observações, análises e conclusões parciais. Algumas se alinham com seus próprios achados. Outras não. E a última página contém algo que você não esperava.

## Arquivos Fornecidos

- `marcus-draft-assessment.txt`

## Instruções

### Parte 1: Análise Comparativa

Leia o rascunho de avaliação do Marcus. Compare os achados dele com o seu próprio trabalho. Produza uma tabela de comparação:

```
Achado | Avaliação do Marcus | Sua Avaliação | Concorda/Discorda | Resolução
```

- Para achados em que você **concorda**, confirme brevemente o porquê.
- Para achados em que você **discorda**, forneça evidência específica da sua própria análise que sustente sua posição. Referencie seus Gap IDs, Control IDs ou entradas do Registro de Ativos.
- Para achados que o Marcus identificou e **você deixou passar**, avalie se são válidos. Se válidos, adicione-os à sua análise de lacunas com documentação apropriada. Se inválidos (desatualizados, incorretos ou baseados em informação incompleta), explique por quê.
- Para achados que **você** identificou e o Marcus deixou passar, liste-os e hipotetize por que ele pode tê-los deixado passar (acesso limitado? escopo diferente? pressão de tempo?).

### Parte 2: A Última Página

O documento do Marcus termina abruptamente numa seção intitulada "Próximos Passos, Panorama de Ameaças Externas." As anotações dele dizem:

> "A avaliação de postura interna é metade da equação. A outra metade: quem está ativamente mirando organizações como a MedDefense? O setor de saúde está sob ataque sustentado. Grupos APT, operadores de ransomware, ameaças internas. Comecei a acompanhar feeds de inteligência de ameaças e a construir um perfil de agentes de ameaça para a MedDefense, mas fiquei sem tempo."
>
> "Perguntas-chave para a próxima fase:"
> - "Quais categorias de agentes de ameaça são mais relevantes para um grupo hospitalar regional?"
> - "Quais são as TTPs (Táticas, Técnicas e Procedimentos) típicas deles?"
> - "Como nossas lacunas específicas se conectam aos padrões de ataque conhecidos deles?"
> - "Podemos aplicar STRIDE à arquitetura da MedDefense para antecipar onde eles atacariam?"
>
> "Comecei a puxar dados dos avisos de saúde da CISA e dos boletins de ameaça do HHS. Isso precisa virar um Relatório formal de Panorama de Ameaças."

Em 3-4 frases, reflita sobre como o trabalho inacabado do Marcus se conecta com sua avaliação concluída. O que sua avaliação de postura interna diz sobre a exposição da MedDefense a ameaças externas? Por que o panorama de ameaças externas é o próximo passo lógico depois de entender a postura interna?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `15-predecessor_review.md`
