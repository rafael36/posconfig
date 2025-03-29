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
mkdir /mnt/hd2

sudo chmod 777 /mnt/hd2

sudo mount /dev/sda1 /mnt/hd2

mkdir /mnt/hd2/docker

# montar hd2 permanente
echo '
# /dev/sda1
UUID=66611ca8-7791-4a23-93d3-dcb7daf5c577  /mnt/hd2  ext4  defaults,noatime  0  2' | sudo tee -a /etc/fstab

# python
python -m venv /home/rafael/venv

echo 'source /home/rafael/venv/bin/activate' >> /home/rafael/.bashrc

sed -i '1s|^|VIRTUAL_ENV_DISABLE_PROMPT=1\n|' /home/rafael/venv/bin/activate

/home/rafael/venv/bin/pip install yt-dlp selenium bs4


# android avd
echo 'ANDROID_SDK_HOME=/mnt/hd2/android-avd
ANDROID_AVD_HOME=/mnt/hd2/android-avd/.android/avd

' | sudo tee -a /etc/environment


# docker
sudo mkdir /etc/docker

sudo touch /etc/docker/daemon.json

echo '{
 "data-root": "/mnt/hd2/docker"
}

' | sudo tee -a /etc/docker/daemon.json


# Mover wallpapers para a pasta home
mv wallhaven-85dpxo_1920x1080.png wallhaven-7331ko_1920x1080.png /home/rafael/

# Mover atalhos para aplicações
mv shotcut.desktop retroarch.desktop losslesscut.desktop /home/rafael/.local/share/applications

# Mover configurações do Waybar
mv config /home/rafael/.config/waybar/

# Mover atalhos diretorio nano
mv open_in_code.nemo_action open_in_terminal.nemo_action /usr/share/nemo/actions

# Mover configurações do Alacritty
mv alacritty.toml /home/rafael/.config/alacritty

# Mover configurações do Hyprland
mv hyprpaper.conf hyprland.conf /home/rafael/.config/hypr

# Extrair e mover tema GTK
tar -xf MyBreeze-Dark-GTK.tar
mv MyBreeze-Dark-GTK /home/rafael/.themes

echo "Instalação concluída!"
