#!/bin/bash

# Clonar o repositório
git clone https://github.com/rafael36/posconfig.git

# Acessar a pasta clonada
cd posconfig/

# Extrair o arquivo de configurações
tar -xzf configeatalhos.tar.gz

# Criar diretórios necessários
mkdir -p /home/rafael/.themes
mkdir -p /home/rafael/.config/waybar
mkdir -p /home/rafael/.config/alacritty
mkdir -p /home/rafael/.config/hypr
mkdir -p /home/rafael/.local/share/applications
mkdir -p /usr/share/nemo/actions
mkdir /mnt/hd2


# montar hd2 permanente
echo '
# /dev/sda1
UUID=66611ca8-7791-4a23-93d3-dcb7daf5c577  /mnt/hd2  ext4  defaults,noatime  0  2' | sudo tee -a /etc/fstab

# python
python -m venv /home/rafael/venv

echo 'source /home/rafael/venv/bin/activate' >> /home/rafael/.bashrc

sed -i '1s|^|VIRTUAL_ENV_DISABLE_PROMPT=1\n|' /home/rafael/venv/bin/activate

/home/rafael/venv/bin/pip install yt-dlp selenium bs4


# Mover wallpapers para a pasta home
mv wallhaven-85dpxo_1920x1080.png wallhaven-7331ko_1920x1080.png /home/rafael/

# Mover atalhos para aplicações
mv shotcut.desktop retroarch.desktop losslesscut.desktop /home/rafael/.local/share/applications

# Mover configurações do Waybar
mv config /home/rafael/.config/waybar/

# Mover configurações do Alacritty
mv alacritty.toml /home/rafael/.config/alacritty

# Mover configurações do Hyprland
mv hyprpaper.conf hyprland.conf /home/rafael/.config/hypr

# Extrair e mover tema GTK
tar -xf MyBreeze-Dark-GTK.tar
mv MyBreeze-Dark-GTK /home/rafael/.themes

# Dar permissão de execução ao script de instalação adicional
chmod +x instalaralgunsprogramasgitclone.sh

# Executar o script de instalação de programas
./instalaralgunsprogramasgitclone.sh
