# 12. Os Sistemas Legados

**Objetivo:** Avaliar o perfil de risco único de sistemas em fim-de-vida (EOL) que nunca mais vão receber outro patch de segurança.

## Contexto

Um sistema em fim-de-vida não é só "mais uma vulnerabilidade." É um sistema permanentemente vulnerável. Todo CVE divulgado a partir de agora que afete essa versão de SO vai permanecer sem correção. Para sempre. A estação de trabalho da ressonância magnética rodando Windows XP já acumulou mais de uma década de vulnerabilidades críticas não corrigidas. A pergunta não é se ela está vulnerável. A pergunta é de quantas formas.

## Instruções

O relatório de scan identifica 3 sistemas em fim-de-vida na MedDefense. Para cada um:

- **Sistema 1:** Windows XP SP3 (10.10.1.70, Estação da Ressonância Magnética)
- **Sistema 2:** Windows Server 2012 R2 (10.10.2.31, Servidor de Impressão)
- **Sistema 3:** Ubuntu 18.04 LTS sem ESM (10.10.2.15, Servidor de Faturamento)

Para cada sistema:

1. **Pesquisa de EOL:** Vá ao NVD e pesquise por CVEs críticos afetando essa versão de SO publicados nos últimos 2 anos. Quantos resultados? (Você não precisa documentar todos, conte e anote os 2 mais críticos.)
2. **Exposição Permanente:** Explique em 2-3 frases por que EOL é categoricamente diferente de "não corrigido." Por que você nunca consegue fechar esse risco só com patches?
3. **Achados do Scan:** Liste todos os achados do relatório de scan que afetam esse sistema específico. Algum deles é explorável especificamente porque o SO é EOL?
4. **Controles Compensatórios:** Que controles compensatórios foram propostos no 1x00 (T6 para a ressonância)? Esses controles endereçam adequadamente as vulnerabilidades encontradas no scan? Se não, que controles adicionais você recomendaria?
5. **Decisão de Negócio:** Se a MedDefense só pode migrar UM desses três sistemas pra fora do EOL no próximo trimestre (restrição de orçamento), qual deveria ser? Justifique usando a criticidade do ativo (do 1x00) e a exposição a ameaças (do 1x01).

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x02_the_weak_links`
- **Arquivo:** `12-legacy_systems.md`
