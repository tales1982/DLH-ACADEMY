# O que você precisa fazer

Essa é a única tarefa do bloco que é puramente um exercício de design — você não está analisando algo que já existe, está desenhando algo novo do zero. Isso muda o tipo de raciocínio exigido.

## Passo 1 — Antes de desenhar as zonas, decida um princípio geral que governe TODAS as regras

Uma arquitetura de segmentação de verdade não lista manualmente toda combinação proibida — ela parte de um princípio (geralmente "negar tudo por padrão, permitir só o que foi explicitamente listado") e depois só precisa listar as EXCEÇÕES permitidas. Decida esse princípio antes de escrever a Parte 1, porque ele vai simplificar demais a Parte 2.

## Passo 2 — Ao decidir em qual zona cada ativo entra, use o Registro de Ativos, não a intuição

Alguns ativos são mais difíceis de classificar do que parecem à primeira vista (por exemplo, uma estação de trabalho que controla um equipamento médico é uma "estação clínica" ou um "dispositivo médico"?). Volte no Registro de Ativos do 1x00 e veja como CADA ativo já foi categorizado lá — use essa categorização já existente, ao invés de decidir de novo do zero.

## Passo 3 — As Regras de Firewall precisam corrigir achados REAIS do 1x02, não ser genéricas

Pelo menos duas das suas 10 regras deveriam corrigir diretamente uma exposição específica que você já documentou (o banco de dados aberto pra rede toda, a interface de gerenciamento do backup exposta, o servidor que está na internet sem necessidade real). Não escreva regras genéricas de "boas práticas de firewall" — escreva regras que resolvem um problema que você já provou que existe.

## Passo 4 — Ao percorrer a Kill Chain #1 passo a passo, seja honesto quando a segmentação NÃO ajuda

Nem todo passo de uma kill chain é sobre rede. Os primeiros passos (phishing, por exemplo) não têm nada a ver com segmentação — isso é um problema de treinamento e segurança de e-mail, não de arquitetura de rede. Diga isso explicitamente ao invés de fingir que a segmentação resolve tudo.

## Passo 5 — A porcentagem final das 5 kill chains precisa ter uma exceção honesta

É bem provável que pelo menos uma das suas 5 kill chains principais NÃO seja resolvida pela segmentação de jeito nenhum — porque ela não depende de alcançar algo através da rede, depende de um acesso que a pessoa já tem legitimamente. Identifique qual é essa exceção e explique por que ela é estruturalmente diferente das outras, ao invés de forçar 100% de cobertura.

## Onde entregar

O arquivo final vai como `14-segmentation_architecture.md`, no repositório `dlh-cyber_security`, diretório `blue_team/1x03_defense_blueprint`. As 3 partes completas: Definição de Zonas, Regras de Firewall, e Impacto na Kill Chain.
