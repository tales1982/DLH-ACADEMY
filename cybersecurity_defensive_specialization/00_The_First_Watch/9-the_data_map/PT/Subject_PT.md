# 9. O Mapa de Dados

**Objetivo:** Identificar, classificar e rastrear o fluxo de dados sensíveis através dos estados do seu ciclo de vida, para identificar lacunas de proteção.

## Contexto

James Chen volta de uma reunião com o jurídico do hospital:

> "O jurídico acabou de me lembrar que lidamos com informação de saúde protegida de mais de 50.000 pacientes, além de dados financeiros e registros de funcionários. Eles querem saber: onde exatamente nossos dados sensíveis vivem, como eles se movem, e eles estão protegidos em cada etapa?"

Dado não fica parado num lugar só. O prontuário de um paciente está **em repouso** no banco de dados do EHR, **em trânsito** quando um médico o acessa a partir do posto de enfermagem pela rede, e **em uso** quando é exibido na tela. Cada estado exige proteções diferentes, e uma lacuna em qualquer estado é uma lacuna em toda a cadeia.

## Níveis de Classificação de Dados

| Nível | Definição | Exemplo |
|---|---|---|
| **Restrito** | Sensibilidade máxima. Acesso não autorizado causa dano grave. Penalidades regulatórias. | Prontuários médicos, CPFs, números de cartão de crédito |
| **Confidencial** | Informação interna sensível. Acesso não autorizado causa dano significativo. | Salários de funcionários, planos estratégicos, contratos com fornecedores |
| **Interno** | Não é para divulgação pública, mas tem impacto limitado se exposto. | Memorandos internos, organogramas, atas de reunião |
| **Público** | Destinado ao consumo público. Sem dano se divulgado. | Conteúdo do site, telefones públicos |

## Instruções

Identifique as principais categorias de dados presentes na MedDefense. Para cada uma, documente:

```
Categoria de Dado | Classificação | Em Repouso (onde) | Em Trânsito (como) | Em Uso (por quem, em quê) | Proteção Atual | Lacunas de Proteção
```

Cubra no mínimo **7 categorias de dados** (exemplos: prontuários médicos, dados de imagem médica, dados financeiros/faturamento, registros de RH de funcionários, credenciais de sistema, logs de auditoria, dados de pesquisa/ensaios clínicos).

Na coluna **Lacunas de Proteção**, identifique fragilidades específicas em como o dado é protegido em cada estado. Referencie seus achados anteriores quando for relevante (ex: o posto de enfermagem com a sessão do EHR destrancada do Task 3 é uma lacuna na proteção de "dado em uso" para prontuários de pacientes).

Depois da tabela, escreva um **Resumo de Risco de Dados** (um parágrafo) respondendo: Qual é a fragilidade de proteção de dados mais significativa da MedDefense? Considere qual categoria de dado, em qual estado, tem a maior lacuna de proteção em relação ao seu nível de classificação.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `9-data_map.md`
