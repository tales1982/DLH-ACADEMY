# 5. O Escudo do Kernel

**Objetivo:** Fortalecer a pilha de rede do kernel Linux e as proteções de memória via sysctl para impedir que o servidor seja usado como ponto de pivô ou alvo de exploração.

## Contexto

Na cadeia de ataque do Crimson Tide (Fase 3), o atacante se moveu lateralmente pela rede plana. Se um servidor Linux comprometido tem o IP forwarding habilitado, ele se torna um roteador para o atacante. Se redirecionamentos ICMP são aceitos, o atacante pode redirecionar tráfego. Se o ASLR está desabilitado, exploits de corrupção de memória se tornam trivialmente confiáveis. Essas são configurações desligadas por padrão que nunca deveriam estar ligadas em um servidor de produção.

## Instruções

Escreva um script `5-sysctl_hardening.sh` que:

- Faça backup do `sysctl.conf` atual
- Aplique hardening da pilha de rede, desabilitação de IPv6 e parâmetros de proteção de memória
- Aplique as configurações imediatamente com `sysctl -p`
- Verifique cada configuração lendo de volta em `/proc/sys/`
- Imprima um PASS/FAIL para cada configuração

## Saída Esperada

```
$ sudo ./5-sysctl_hardening.sh
[*] Backing up /etc/sysctl.conf
[*] Applying kernel hardening parameters...
net.ipv4.ip_forward = 0                    [PASS]
net.ipv4.conf.all.accept_redirects = 0     [PASS]
net.ipv4.conf.default.accept_redirects = 0 [PASS]
net.ipv4.conf.all.send_redirects = 0       [PASS]
net.ipv4.conf.all.accept_source_route = 0  [PASS]
net.ipv4.conf.all.log_martians = 1         [PASS]
net.ipv4.tcp_syncookies = 1                [PASS]
net.ipv4.icmp_echo_ignore_broadcasts = 1   [PASS]
net.ipv6.conf.all.disable_ipv6 = 1         [PASS]
net.ipv6.conf.default.disable_ipv6 = 1     [PASS]
kernel.randomize_va_space = 2              [PASS]
fs.suid_dumpable = 0                       [PASS]
kernel.dmesg_restrict = 1                  [PASS]
kernel.kptr_restrict = 2                   [PASS]
Parameters applied: 14
Verified PASS: 14
Verified FAIL: 0
```

## Repositório

- **Repositório GitHub:** `dlh-cyber_security`
- **Diretório:** `blue_team/2x00_locking_the_gates`
- **Arquivo:** `5-sysctl_hardening.sh`
