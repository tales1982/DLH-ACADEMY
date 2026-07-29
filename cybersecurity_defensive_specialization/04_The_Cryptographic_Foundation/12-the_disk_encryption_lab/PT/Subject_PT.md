# 12. O Laboratório de Criptografia de Disco

**Objetivo:** Configurar criptografia de disco LUKS num loop device, entender as implicações operacionais e projetar uma estratégia de criptografia de backup pra MedDefense.

## Contexto

O NAS-01 armazena todos os backups da MedDefense em texto puro. Se o NAS for roubado, todo prontuário de paciente fica exposto. Se o NAS for acessado através da rede plana (o que suas kill chains do 1x01 demonstraram), os backups ficam legíveis. Criptografar o armazenamento de backup em repouso é uma prioridade de Fase 1 do seu roadmap.

Antes de você mexer em produção, você pratica num alvo seguro: um loop device na sua própria máquina.

## Instruções

### Parte 1 - Configuração do LUKS

Crie um arquivo de 500MB pra usar como disco virtual:

```
dd if=/dev/zero of=encrypted_volume.img bs=1M count=500
```

Configure a criptografia LUKS nesse arquivo:

1. Formate com LUKS: `sudo cryptsetup luksFormat encrypted_volume.img`
2. Abra o volume criptografado: `sudo cryptsetup luksOpen encrypted_volume.img secure_vol`
3. Crie um sistema de arquivos: `sudo mkfs.ext4 /dev/mapper/secure_vol`
4. Monte e escreva dados de teste
5. Desmonte e feche: `sudo cryptsetup luksClose secure_vol`

Documente cada comando e sua saída.

### Parte 2 - Verificação

Depois de fechar o volume LUKS, tente ler o arquivo bruto:

```
strings encrypted_volume.img | head -50
```

Você consegue ver os dados que você escreveu? O que isso prova sobre criptografia em repouso?

Agora reabra o volume e verifique que os dados estão intactos. Documente o ciclo completo de abrir-montar-ler-desmontar-fechar.

### Parte 3 - O Script de Automação do LUKS

Escreva um script `12-luks_manager.sh` que aceita um argumento de modo:

- `create`: cria um volume criptografado com LUKS de um tamanho especificado
- `open`: abre e monta o volume
- `close`: desmonta e fecha o volume

### Parte 4 - Design de Criptografia de Backup da MedDefense

Projete a estratégia de criptografia em repouso pro NAS-01. Aborde:

- Qual nível de criptografia é apropriado (disco completo, volume, nível de arquivo) e por quê
- O que acontece com a performance do backup (estime o overhead com base nas suas medições de performance da T1)
- Onde a chave de criptografia é armazenada (NÃO no próprio NAS, explique por quê)
- O que acontece se a chave for perdida (implicações pra recuperação de backup)
- Como isso se integra com o controle de replicação de backup externo (offsite) da sua estratégia do 1x03 (a réplica na nuvem também precisa ser criptografada, e com a chave de quem?)

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/1x04_crypto_foundation`
- **Arquivo:** `12-luks_manager.sh`, `12-disk_encryption.md`
