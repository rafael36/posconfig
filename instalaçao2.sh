#!/bin/bash


# Clonar o repositório
git clone https://github.com/rafael36/posconfig.git




# Acessar a pasta clonada
cd posconfig/


sudo chmod +x script.sh



# Definindo os pacotes em um array
pacotes=(
  "hyprland"
  "firefox"
  "chromium"
  "git"
  "ttf-dejavu"
  "ttf-liberation"
  "ttf-font-awesome"
  "go"
  "jq"
  "qbittorrent"
  "noto-fonts-extra"
  "hyprpaper"
  "alacritty"
  "code"
  "fuse2"
  "waybar"
  "polkit-gnome"
  "pavucontrol"
  "nano"
  "pulsemixer"
  "p7zip"
  "nwg-look"
  "noto-fonts"
  "qt6-wayland"
  "slurp"
  "amdvlk"
  "lib32-amdvlk"
  "grim"
  "zerotier-one"
  "gsimplecal"
  "wine-staging"
  "winetricks"
  "wine-mono"
  "wine-gecko"
  "lib32-alsa-plugins"
  "docker"
  "python3"
  "python-pip"
  "nemo"
  "flatpak"
  "btop"
  "psensor"
  "xdg-desktop-portal-hyprland"
  "vlc"
  "lib32-libpulse"
  "mesa"
  "vulkan-radeon"
  "xf86-video-amdgpu"
  "xf86-video-ati"
  "mpv"
  "steam"
)

# Instalar os pacotes
for pacote in "${pacotes[@]}"
do
    echo "Instalando $pacote..."
    sudo pacman -S --noconfirm "$pacote"
done

echo "Todos os pacotes foram instalados!"



    # Extrair o arquivo de configurações
    tar -xzf configeatalhos.tar.gz

    cd configpasta


    # Criar diretórios necessários
    mkdir -p /home/rafael/.config/gtk-3.0
    mkdir -p /home/rafael/.themes
    mkdir -p /home/rafael/.config/ulauncher
    mkdir -p /home/rafael/.local/share/nwg-look
    mkdir -p /home/rafael/.config/xsettingsd
    mkdir -p /home/rafael/.config/waybar
    mkdir -p /home/rafael/.config/alacritty
    mkdir -p /home/rafael/.config/hypr
    mkdir -p /home/rafael/.local/share/applications


    tar -xf MyBreeze-Dark-GTK.tar

    mv MyBreeze-Dark-GTK /home/rafael/.themes


    mv wallhaven-85dpxo_1920x1080.png wallhaven-7331ko_1920x1080.png /home/rafael/

    mv nwg-look/gsettings /home/rafael/.local/share/nwg-look
    mv gtk-3.0/settings.ini /home/rafael/.config/gtk-3.0
    mv .gtkrc-2.0 /home/rafael
    mv settings.json /home/rafael/.config/ulauncher
    mv xsettingsd/xsettingsd.conf /home/rafael/.config/xsettingsd
    mv script.sh /home/rafael/.config/hypr/



    # Criar ambiente virtual Python
    python -m venv /home/rafael/venv
    echo "source /home/rafael/venv/bin/activate" >> /home/rafael/.bashrc
    sed -i "1s|^|VIRTUAL_ENV_DISABLE_PROMPT=1\n|" /home/rafael/venv/bin/activate
    /home/rafael/venv/bin/pip install yt-dlp selenium bs4

# Operações com sudo
sudo bash -c '
    mkdir -p /usr/share/nemo/actions


flatpak install flathub com.obsproject.Studio

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
    git clone https://aur.archlinux.org/sunshine.git
	
    # Instala os pacotes
    cd google-chrome && makepkg -si --noconfirm && cd ..
    cd brave-bin && makepkg -si --noconfirm && cd ..
    cd parsec-bin && makepkg -si --noconfirm && cd ..
    cd ulauncher && makepkg -si --noconfirm && cd ..
    cd sunshine && makepkg -si --noconfirm && cd ..

    # Limpeza dos diretórios
    rm -rf /home/rafael/aur-builds

    echo "Instalação concluída!"


    echo "Reinciando!"

    sudo reboot