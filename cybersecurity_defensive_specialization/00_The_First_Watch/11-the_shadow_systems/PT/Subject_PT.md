# 11. Os Sistemas Sombra

**Objetivo:** Identificar e avaliar ativos não gerenciados que existem fora da governança oficial de TI da organização, e determinar a resposta apropriada para cada um.

## Contexto

Você está cruzando seu Registro de Ativos (Task 7) com a varredura de rede quando o líder do helpdesk de TI, Mike Torres, passa na sua mesa:

> "Ei, você é o novo pessoal de segurança, certo? Eu deveria mencionar algumas coisas. O Dr. Patel, da Cardiologia, comprou um NAS pessoal e conectou na tomada de rede do escritório dele. Ele guarda dados de pesquisa ali, diz que o drive compartilhado do hospital é lento demais. Ah, e o time de marketing anda usando um Google Drive compartilhado pra arquivos de mídia e comunicados de imprensa. Está vinculado ao Gmail pessoal de alguém. Também tem um Raspberry Pi em algum lugar do segundo andar do Central que o estagiário anterior configurou. Acho que o Marcus até pediu pra ele configurar como algum tipo de monitor de rede, mas ninguém mexeu nisso desde que os dois saíram."

## Instruções

Shadow IT descreve sistemas, serviços ou dispositivos que operam dentro do ambiente de uma organização sem aprovação formal, gerenciamento ou supervisão de segurança da TI. Eles representam uma categoria de risco específica porque são invisíveis para os controles de segurança padrão, não recebem correções, não são monitorados, e frequentemente contêm dados sensíveis.

Para cada um dos três sistemas sombra descritos acima, produza:

### Avaliação de Risco

1. Que dado sensível esse sistema pode conter ou dar acesso a?
2. Quais controles de segurança da matriz oficial (Task 10) NÃO cobrem esse sistema?
3. Qual é o pior cenário possível se esse sistema for comprometido?

### Resposta Recomendada

Escolha uma das três estratégias e justifique sua escolha:

- **Legitimar e Proteger:** Trazer o sistema para a governança de TI, aplicar os controles apropriados, documentá-lo no registro de ativos.
- **Migrar:** Mover o dado/função para um sistema aprovado que já tenha controles.
- **Descontinuar:** Remover o sistema e garantir que o dado seja tratado adequadamente.

### Atualização do Registro de Ativos

Adicione cada sistema sombra ao seu Registro de Ativos (Task 7) com `Status: "Shadow IT"` e notas apropriadas.

---

Depois das três avaliações individuais, escreva uma **Recomendação de Política de Shadow IT** (um parágrafo): Qual mudança de política única reduziria mais efetivamente a probabilidade de futuro shadow IT na MedDefense?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `11-shadow_systems.md`
