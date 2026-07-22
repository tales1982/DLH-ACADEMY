# O que você precisa fazer

Esse exercício muda o nível de análise: ao invés de olhar cada CVE como um caso isolado, você vai procurar o padrão estrutural por trás deles. É o tipo de raciocínio que separa "eu corrigi essa vulnerabilidade" de "eu entendi por que essa classe de vulnerabilidade continua aparecendo".

## Passo 1 — Escolha CVEs que realmente tenham CWE atribuído

Nem todo CVE do relatório vem com uma tag de CWE clara no NVD — alguns aparecem como "sem informação" (o NVD literalmente não mapeou uma categoria). Antes de escolher seus 3 CVEs pra Parte 1, confira na própria página do NVD se existe mesmo um CWE-XXX específico listado, e não presuma que qualquer CVE crítico automaticamente tem um.

## Passo 2 — Hierarquia: não pare no primeiro nível

Ao visitar a página do CWE em cwe.mitre.org, procure a seção que mostra o relacionamento "ChildOf" (filho de). Um CWE bem específico (nível "Variant" ou "Base") geralmente é filho de uma categoria mais ampla (nível "Class"). Anote os dois níveis — o específico e o pai — porque isso é o que a tarefa está pedindo quando fala em "posição na hierarquia".

## Passo 3 — Top 25 é sobre frequência, não sobre gravidade de um caso específico

Ao checar se um CWE está no Top 25, você pode notar algo interessante: nem todo CVE crítico (nota 9.8, por exemplo) pertence a uma categoria de CWE que está no Top 25. Pense sobre o que isso significa — será que "estar no Top 25" mede a mesma coisa que "esse CVE específico é perigoso"?

## Passo 4 — Análise de padrão: procure achados SEM CVE também

A Parte 2 pede pra olhar todos os 31 achados, não só os que têm CVE. Muitos achados do relatório são configurações incorretas (sem CVE nenhum) — mas o CWE também tem categorias pra descrever esse tipo de problema (por exemplo, existe uma categoria específica pra "serviço vinculado a um endereço IP irrestrito"). Olhe os achados de banco de dados exposto na rede (existe mais de um no relatório) e pergunte-se: eles são o mesmo tipo de erro, cometido duas vezes, em dois softwares diferentes? Faça a mesma pergunta pros sistemas fim-de-vida (EOL) — quantos aparecem no relatório, e são todos a mesma causa raiz?

## Passo 5 — A recomendação da Parte 3 pede "categoria de treinamento pra DESENVOLVEDORES", não "prioridade de correção"

Essa é uma pegadinha sutil: o padrão que mais se repete no scan pode não ser a melhor resposta pra essa pergunta específica. Pense na diferença entre um problema que se resolve com uma política/checklist de configuração (aplicável a qualquer equipe de TI) e um problema que só se resolve ensinando quem escreve código a programar diferente. A pergunta é sobre a segunda categoria.

## Onde entregar

O arquivo final vai como `3-cwe_analysis.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x02_the_weak_links`. Três partes: Rastreamento de CVEs até CWEs, Análise de Padrões, e Recomendação.
