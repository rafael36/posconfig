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
    mkdir -p /home/rafael/.config/gtk-3.0
    mkdir -p /home/rafael/.config/ulauncher
    mkdir -p /home/rafael/.themes
    mkdir -p /home/rafael/.local/share/nwg-look
    mkdir -p /home/rafael/.config/xsettingsd
    mkdir -p /home/rafael/.themes/MyBreeze-Dark-GTK/gtk-4.0
    mkdir -p /home/rafael/.config/waybar
    mkdir -p /home/rafael/.config/alacritty
    mkdir -p /home/rafael/.config/hypr
    mkdir -p /home/rafael/.local/share/applications

    mv nwg-look/gsettings /home/rafael/.local/share/nwg-look
    mv gtk-3.0/settings.ini /home/rafael/.config/gtk-3.0
    mv .gtkrc-2.0 /home/rafael
    mv settings.json /home/rafael/.config/ulauncher
    mv xsettingsd/xsettingsd.conf /home/rafael/.config/xsettingsd




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
    mkdir -p /usr/share/nemo/actions
    mkdir /mnt/hd2
    # Alterações de permissões e montagem
    chmod 777 /mnt/hd2
    mount /dev/sda1 /mnt/hd2
    echo "# /dev/sda1
UUID=66611ca8-7791-4a23-93d3-dcb7daf5c577  /mnt/hd2  ext4  defaults,noatime  0  2" >> /etc/fstab

    # Configuração do Docker
    mkdir /etc/docker
    mv daemon.json /etc/docker
    chmod 777 /etc/docker
    chmod 777 /mnt/hd2/docker
    systemctl enable docker
    systemctl start docker

    # Configuração do Android AVD
    echo "ANDROID_SDK_HOME=/mnt/hd2/android-avd
ANDROID_AVD_HOME=/mnt/hd2/android-avd/.android/avd
" >> /etc/environment


pacman -S steam


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
