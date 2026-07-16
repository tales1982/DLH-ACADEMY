# 7. O Registro de Ativos

**Objetivo:** Construir um inventário de ativos abrangente e estruturado, consolidando informações de múltiplas fontes acumuladas ao longo do projeto.

## Contexto

James Chen precisa de uma única fonte de verdade autoritativa para os ativos da MedDefense. Agora mesmo, a informação está espalhada entre seu Environment Summary (Task 0), os incidentes que você analisou (Tasks 1-2), as observações físicas (Task 3), os controles que você documentou (Task 4) e a situação do MRI (Task 6).

> "Também pedi para a Sarah Park extrair um resumo de varredura de rede," diz James, entregando um novo documento. "Cruze tudo. Se um ativo aparecer em uma fonte mas não em outra, eu quero saber."

## Arquivos Fornecidos

- `network-scan-summary.txt` (uma saída simplificada, no estilo Nmap, cobrindo os três sites da MedDefense: endereços IP, hostnames, SO detectado, portas abertas e serviços)

## Instruções

Consolide **TODA** a informação de ativos de cada fonte que você usou neste projeto. Cruze o pacote de integração (Task 0), os incidentes (Tasks 1-2), as observações físicas (Task 3), os artefatos de controle (Task 4), a situação do MRI (Task 6) e o novo resumo de varredura de rede.

Produza um **Registro de Ativos** com os seguintes campos para cada ativo:

```
Asset ID | Nome | Tipo | Localização | Dono (Depto) | SO/Plataforma | Serviços Críticos | Segmento de Rede | Status | Notas
```

- **Tipos de Ativo:** Servidor, Endpoint, Dispositivo de Rede, IoT Médico, Repositório de Dados, Aplicação, Infraestrutura Física
- **Status:** Ativo, Descontinuado, Shadow IT (não gerenciado), Desconhecido

Seu registro precisa incluir no mínimo **20 ativos distintos**.

Depois do registro, forneça uma seção de **Notas de Reconciliação** que documente:

1. Ativos encontrados na varredura de rede que **NÃO** aparecem em nenhuma documentação (shadow IT ou sistemas não documentados).
2. Ativos mencionados na documentação que **NÃO** aparecem na varredura de rede (descontinuado? offline? rede diferente?).
3. Quaisquer discrepâncias ou contradições entre as fontes.

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x00_first_watch`
- **Arquivo:** `7-asset_registry.md`
