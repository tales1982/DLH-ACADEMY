# 9. O Impositor do AppArmor

**Objetivo:** Implantar e configurar perfis do AppArmor em modo de imposição (enforce) para todos os serviços expostos à rede, implementando controle de acesso obrigatório que limita o dano mesmo se um serviço for comprometido.

## Contexto

Quando o crypto-miner comprometeu o billing-srv-01 através do Apache (incidente do 1x00), ele teve acesso total ao sistema de arquivos como `www-data`. O AppArmor teria confinado o processo do Apache apenas aos diretórios de que ele precisa. O AppArmor é a diferença entre "o atacante conseguiu um shell no nosso servidor web" e "o atacante conseguiu um shell que só acessa `/var/www`". Um perfil customizado para a aplicação de faturamento da MedDefense garante que mesmo um zero-day na aplicação não consiga alcançar os diretórios de dados de pacientes.

## Instruções

Escreva um script `9-apparmor_config.sh` que:

- Verifique se o AppArmor está instalado e rodando
- Liste todos os perfis atuais e seu status
- Mude os perfis do Apache e MySQL de complain para enforce
- Crie um perfil customizado do AppArmor para uma aplicação da MedDefense que restrinja o acesso ao sistema de arquivos apenas aos diretórios necessários
- Reporte processos sem confinamento que deveriam ter perfis
- Imprima um resumo com contagens de enforce/complain/unconfined

## Saída Esperada

```
$ sudo ./9-apparmor_config.sh
[*] Checking AppArmor status...
    AppArmor module: loaded
    AppArmor service: active
[*] Profile enforcement:
    /usr/sbin/apache2        complain -> enforce  [ENFORCED]
    /usr/sbin/mysqld         complain -> enforce  [ENFORCED]
    /usr/sbin/sshd           enforce              [OK]
[*] Custom profile: /opt/meddefense/billing-app   [CREATED] [ENFORCED]
[*] Unconfined network-exposed processes:
    /usr/sbin/rsyslogd       [UNCONFINED - Profile recommended]
Profiles in enforce: 4 | Complain: 0 | Unconfined: 1
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `9-apparmor_config.sh`
