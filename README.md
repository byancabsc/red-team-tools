# red-team-tools
Um toolkit abrangente de ferramentas e scripts para operações de Red Team.

Este repositório serve como um toolkit abrangente de ferramentas, scripts e recursos essenciais para operações de Red Team, desde reconhecimento e exploração até pós-exploração e engenharia social.

## Conteúdo

* [Reconnaissance](#reconnaissance)
* [Vulnerability Scanning](#vulnerability-scanning)
* [Exploitation](#exploitation)
* [Post-Exploitation](#post-exploitation)
* [Web Reconnaissance & Fuzzing](#web-reconnaissance--fuzzing)
* [Social Engineering](#social-engineering)
* [Utilities](#utilities)
* [Custom Scripts](#custom-scripts)
* [Instalação e Configuração Rápida (Script de Setup)](#instalação-e-configuração-rápida-script-de-setup)

---

### Reconnaissance

Ferramentas focadas na coleta de informações sobre alvos.

* **[WhatWeb](#whatweb)**
* **[enum4linux](#enum4linux)**
* **[Nikto](#nikto)**

### Vulnerability Scanning

Ferramentas para identificar vulnerabilidades em sistemas e aplicações.

* **[Burp Suite](#burp-suite)**
* **[Nikto](#nikto)** (Também útil para varredura de vulnerabilidades web)

### Exploitation

Ferramentas e frameworks para exploração de vulnerabilidades.

* **[Metasploit Framework](#metasploit-framework)**
* **[msfvenom](#msfvenom)**
* **[sshpass](#sshpass)** (Para automação de SSH em certas explorações)
* **[Plink](#plink)** (Para conectividade SSH/Telnet no Windows, útil para port forwarding)

### Post-Exploitation

Ferramentas para manter o acesso e elevar privilégios após a exploração inicial.

* **[WinPEAS / LinPEAS](#winpeas--linpeas)**
* **[Invoke-Obfuscation](#invoke-obfuscation)**
* **[Amsi-Bypass-Catalog](#amsi-bypass-catalog)**

### Web Reconnaissance & Fuzzing

Ferramentas para descoberta de conteúdo web e fuzzing.

* **[feroxbuster](#feroxbuster)**
* **[gobuster](#gobuster)**
* **[ffuf](#ffuf)**
* **[wfuzz](#wfuzz)**

### Social Engineering

Ferramentas para campanhas de engenharia social.

* **[Gophish](#gophish)**

### Utilities

Ferramentas de uso geral para análise de rede e outros.

* **[Wireshark](#wireshark)**
* **[Smbclient](#smbclient)**

### Custom Scripts

Scripts personalizados desenvolvidos ou coletados.

* **[SMB Check Dir Perms Script](#smb-check-dir-perms-script)**

---

## Detalhes das Ferramentas

### Metasploit Framework
Um framework de exploração poderoso e versátil.
* **Repositório Oficial:** [https://github.com/rapid7/metasploit-framework](https://github.com/rapid7/metasploit-framework)

### msfvenom
Parte do Metasploit, usado para gerar payloads personalizados.
* **Documentação:** Consulte a documentação do Metasploit.

### Plink
Uma ferramenta de linha de comando para conectividade SSH, Telnet, Rlogin e Raw para Windows. Útil para túneis e port forwarding.
* **Download/Documentação:** [https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

### WinPEAS / LinPEAS
Scripts para enumeração de privilégios em sistemas Windows e Linux, respectivamente.
* **Repositório Oficial:** [https://github.com/carlospolop/PEASS-ng](https://github.com/carlospolop/PEASS-ng)

### Invoke-Obfuscation
Um framework PowerShell para ofuscação de scripts.
* **Repositório Oficial:** [https://github.com/danielbohannon/Invoke-Obfuscation](https://github.com/danielbohannon/Invoke-Obfuscation)

### Amsi-Bypass-Catalog
Um catálogo de técnicas e scripts para bypass do AMSI (Anti-Malware Scan Interface).
* **Repositório Oficial:** [https://github.com/S3cur3Th1sSh1t/Amsi-Bypass-Catalog](https://github.com/S3cur3Th1sSh1t/Amsi-Bypass-Catalog)

### feroxbuster
Uma ferramenta de fuzzing rápido para diretórios e arquivos web.
* **Repositório Oficial:** [https://github.com/epi052/feroxbuster](https://github.com/epi052/feroxbuster)

### gobuster
Uma ferramenta para força bruta de diretórios, subdomínios, buckets S3, etc.
* **Repositório Oficial:** [https://github.com/OJ/gobuster](https://github.com/OJ/gobuster)

### ffuf
Um fuzzer rápido para reconhecimento web.
* **Repositório Oficial:** [https://github.com/ffuf/ffuf](https://github.com/ffuf/ffuf)

### wfuzz
Um fuzzer web altamente configurável.
* **Repositório Oficial:** [https://github.com/xmendez/wfuzz](https://github.com/xmendez/wfuzz)

### sshpass
Uma ferramenta para passar a senha para comandos ssh interativos.
* **Geralmente disponível nos gerenciadores de pacotes Linux.**

### enum4linux
Uma ferramenta para enumerar informações do Windows e Samba usando NetBIOS/SMB.
* **Repositório Oficial:** [https://github.com/CiscoCXSecurity/enum4linux](https://github.com/CiscoCXSecurity/enum4linux)

### Burp Suite
Um proxy web essencial para testes de segurança de aplicações web.
* **Site Oficial:** [https://portswigger.net/burp](https://portswigger.net/burp)

### Wireshark
Um analisador de protocolo de rede amplamente utilizado.
* **Site Oficial:** [https://www.wireshark.org/](https://www.wireshark.org/)

### Nikto
Um scanner de vulnerabilidades de servidor web.
* **Repositório Oficial:** [https://github.com/sullo/nikto](https://github.com/sullo/nikto)

### Smbclient
Um cliente de linha de comando para acesso a compartilhamentos SMB/CIFS.
* **Parte do pacote Samba, geralmente pré-instalado em sistemas Linux.**

### WhatWeb
Identifica websites. Sua função é adivinhar ou identificar tecnologias web usadas por um site.
* **Repositório Oficial:** [https://github.com/urbanadventurer/WhatWeb](https://github.com/urbanadventurer/WhatWeb)

### Gophish
Um toolkit de código aberto para campanhas de phishing.
* **Repositório Oficial:** [https://github.com/gophish/gophish](https://github.com/gophish/gophish)

---

## Custom Scripts

Scripts personalizados desenvolvidos ou coletados.

### SMB Check Dir Perms Script
Um script personalizado para verificar permissões de diretórios SMB.

Para incluir este script, você pode criar o arquivo dentro da pasta `custom-scripts`.

**Caminho:** `custom-scripts/smb-check-dir-perms.sh`

```bash
# Baixe o script diretamente para a pasta custom-scripts
curl -o custom-scripts/smb-check-dir-perms.sh [https://raw.githubusercontent.com/isabellecda/cyber-scripts/main/smb-check-dir-perms.sh](https://raw.githubusercontent.com/isabellecda/cyber-scripts/main/smb-check-dir-perms.sh)
