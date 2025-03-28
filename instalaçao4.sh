#!/bin/bash

# Clonar o repositório
# cgit clone https://github.com/rafael36/posconfig.git

# Acessar a pasta clonada
# cd posconfig/

# Extrair o arquivo de configurações
tar -xzf configeatalhos.tar.gz

cd configpasta


    # Criar diretórios necessários
    mkdir -p /home/rafael/.themes
    mkdir -p /home/rafael/.config/waybar
    mkdir -p /home/rafael/.config/alacritty
    mkdir -p /home/rafael/.config/hypr
    mkdir -p /home/rafael/.local/share/applications
    mkdir -p /usr/share/nemo/actions


    # Extrair e mover tema GTK
    tar -xf MyBreeze-Dark-GTK.tar
    mv MyBreeze-Dark-GTK /home/rafael/.themes

    # Mover wallpapers para a pasta home
    mv wallhaven-85dpxo_1920x1080.png wallhaven-7331ko_1920x1080.png /home/rafael/

    # Criar ambiente virtual Python
    python -m venv /home/rafael/venv
    echo "source /home/rafael/venv/bin/activate" >> /home/rafael/.bashrc
    sed -i "1s|^|VIRTUAL_ENV_DISABLE_PROMPT=1\n|" /home/rafael/venv/bin/activate
    /home/rafael/venv/bin/pip install yt-dlp selenium bs4

# Operações com sudo
sudo bash -c '


mv open_in_code.nemo_action open_in_terminal.nemo_action /usr/share/nemo/actions
'
    # Mover arquivos de configurações
    mv shotcut.desktop retroarch.desktop losslesscut.desktop /home/rafael/.local/share/applications
    mv config /home/rafael/.config/waybar/
    mv alacritty.toml /home/rafael/.config/alacritty
    mv hyprpaper.conf hyprland.conf /home/rafael/.config/hypr


    # Instalar pacotes do AUR
    mkdir -p /home/rafael/aur-builds
    cd /home/rafael/aur-builds

    # Clona os repositórios do AUR
    git clone https://aur.archlinux.org/google-chrome.git
    git clone https://aur.archlinux.org/brave-bin.git
    git clone https://aur.archlinux.org/parsec-bin.git
    git clone https://aur.archlinux.org/ulauncher.git

    # Instala os pacotes
    cd google-chrome && makepkg -si --noconfirm && cd ..
    cd brave-bin && makepkg -si --noconfirm && cd ..
    cd parsec-bin && makepkg -si --noconfirm && cd ..
    cd ulauncher && makepkg -si --noconfirm && cd ..

    # Limpeza dos diretórios
    rm -rf /home/rafael/aur-builds

    echo "Instalação concluída!"

