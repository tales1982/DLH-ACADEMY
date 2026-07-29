# 0. O Inventário Criptográfico

**Objetivo:** Mapear cada fluxo de dados da MedDefense contra seu estado atual de proteção criptográfica, expondo cada lacuna em um único documento.

## Contexto

Antes de conseguir corrigir a postura criptográfica da MedDefense, você precisa ver o quadro completo em um só lugar. Os achados de vulnerabilidade do 1x02 identificaram fraquezas criptográficas individuais (TLS 1.0 no portal, backups não criptografados, DICOM em texto puro). O registro de riscos do 1x03 acompanhou alguns desses como riscos. Mas ninguém produziu um inventário sistemático que mapeia cada categoria de dado, em cada estado, ao seu nível atual de proteção.

Esse é o documento que torna o invisível visível. Quando você terminar, cada célula que disser "Nenhuma" é uma lacuna que o resto deste projeto vai endereçar.

## Arquivos Fornecidos

- `meddefense-crypto-audit-notes.txt`

## Instruções

Produza um **Mapa de Proteção de Dados** pra MedDefense. O mapa é uma matriz que cruza categorias de dados (linhas) com estados de dados (colunas).

**Colunas (Estados de Dados):**

- Em Repouso (armazenado em disco, banco de dados, NAS, backup)
- Em Trânsito (se movendo entre sistemas pela rede)
- Em Uso (sendo processado ou exibido ativamente)

**Linhas (Categorias de Dados):** Use no mínimo estas 7:

1. Prontuários médicos de pacientes (dados EHR no PostgreSQL)
2. Dados financeiros/faturamento (MySQL no billing-srv-01)
3. Imagens médicas (DICOM no PACS)
4. Credenciais (Active Directory, senhas de aplicação)
5. Dados de backup (NAS-01)
6. E-mail (O365)
7. Tráfego de VPN (túneis site-a-site)

Para cada célula, documente:

```
Proteção: [Algoritmo/Protocolo usado, ou "Nenhuma"]
Evidência: [Referência a achado do 1x02, observação do 1x00, ou notas de auditoria]
Status: [Adequado / Fraco / Ausente]
```

Depois da matriz, produza um **Resumo de Lacunas**: Quantas das 21 células (7 × 3) têm proteção adequada? Quantas são fracas? Quantas são ausentes? Qual é a porcentagem geral de cobertura criptográfica?

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `0-crypto_inventory.md`
