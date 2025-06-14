#!/bin/bash

# Habilitar o repositório multilib, se ainda não estiver habilitado
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
  echo "Habilitando o repositório multilib..."
  sudo sed -i '/#\[multilib\]/,/#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /etc/pacman.conf
  sudo pacman -Sy
else
  echo "Repositório multilib já habilitado."
fi

sudo pacman -S --noconfirm git

# Clonar o repositório
#git clone https://github.com/rafael36/posconfig.git

# Acessar a pasta clonada
#cd posconfig/

# ---------- Instalação de pacotes ----------
pacotes=(
  "hyprland" "kvantum" "kvantum-qt5" "qt5ct" "qt6ct" "arc-gtk-theme" "firefox" "chromium" "git" "ttf-dejavu" "ttf-liberation"
  "ttf-font-awesome" "cantarell-fonts" "go" "jq" "ark" "qbittorrent" "noto-fonts-extra" "hyprpaper"
  "alacritty" "nvim" "noto-fonts" "noto-fonts-cjk" "noto-fonts-emoji" "fuse2" "ttf-jetbrains-mono-nerd" "waybar" "polkit-gnome" "dconf" "pavucontrol" "nano"
  "pulsemixer" "p7zip" "rofi" "sddm" "nwg-look" "noto-fonts" "qt6-wayland" "slurp" "amdvlk"
  "lib32-amdvlk" "grim" "zerotier-one" "gsimplecal" "wine-staging" "winetricks" "tigervnc"
  "wine-mono" "wine-gecko" "lib32-alsa-plugins" "docker" "python3" "python-pip" "papirus-icon-theme"
  "nemo" "flatpak" "btop" "psensor" "xdg-desktop-portal-hyprland" "vlc" "wl-clipboard" "cliphist"
  "lib32-libpulse" "mesa" "vulkan-radeon" "xf86-video-amdgpu" "xf86-video-ati"
  "mpv" "steam" "ripgrep"
)

for pacote in "${pacotes[@]}"; do
  echo "Instalando $pacote..."
  sudo pacman -S --noconfirm "$pacote"
done

echo "Todos os pacotes foram instalados!"

# ---------- Extração e movimentação dos arquivos de configuração ----------
tar -xvf configpasta.tar.gz

mkdir -p \
  /home/rafael/.config/gtk-3.0 \
  /home/rafael/.themes \
  /home/rafael/.local/share/nwg-look \
  /home/rafael/.config/xsettingsd \
  /home/rafael/.config/waybar \
  /home/rafael/.config/alacritty \
  /home/rafael/.config/hypr \
  /home/rafael/.local/share/applications

tar -xf MyBreeze-Dark-GTK.tar
mv MyBreeze-Dark-GTK /home/rafael/.themes
mv wallhaven-*.png /home/rafael/
mv nwg-look/gsettings /home/rafael/.local/share/nwg-look
mv gtk-3.0/settings.ini /home/rafael/.config/gtk-3.0
mv .gtkrc-2.0 /home/rafael/
mv Kvantum sunshine /home/rafael/.config/
mv alacritty.yml /home/rafael/.config/alacritty
mv xsettingsd/xsettingsd.conf /home/rafael/.config/xsettingsd
mv script.sh /home/rafael/.config/hypr/
mv lazyvim.desktop aprendendoingles.desktop google-chromepoder.desktop aprendendogo.desktop shotcut.desktop obsidian.desktop retroarch.desktop losslesscut.desktop kdenlive.desktop heroic.desktop /home/rafael/.local/share/applications
mv config /home/rafael/.config/waybar/
mv alacritty.toml /home/rafael/.config/alacritty
mv hyprpaper.conf hyprland.conf /home/rafael/.config/hypr

# ---------- Ambiente virtual Python ----------
python -m venv /home/rafael/venv
echo "source /home/rafael/venv/bin/activate" >>/home/rafael/.bashrc
sed -i "1s|^|VIRTUAL_ENV_DISABLE_PROMPT=1\n|" /home/rafael/venv/bin/activate
/home/rafael/venv/bin/pip install yt-dlp selenium bs4

# ---------- Montagem automática do HD ----------
sudo mkdir -p /mnt/hd2
sudo chmod 777 /mnt/hd2
sudo mount /dev/sdb1 /mnt/hd2

# Garantir entrada no fstab
if ! grep -q "UUID=f8e32812-2c81-45fb-81a2-20287ac6fd08" /etc/fstab; then
  echo "UUID=f8e32812-2c81-45fb-81a2-20287ac6fd08  /mnt/hd2  ext4  defaults,noatime  0  2" | sudo tee -a /etc/fstab
fi

# ---------- Configuração do Android AVD ----------
if ! grep -q "ANDROID_SDK_HOME" /etc/environment; then
  echo "
ANDROID_SDK_HOME=/mnt/hd2/android-avd
ANDROID_AVD_HOME=/mnt/hd2/android-avd/.android/avd
" | sudo tee -a /etc/environment
fi

# ---------- Flatpak ----------
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --user flathub com.obsproject.Studio
#flatpak install --noninteractive flathub com.obsproject.Studio

# ---------- LazyVim ----------
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

sudo bash <<'EOF'
# ---------- Nemo Actions ----------
mkdir -p /usr/share/nemo/actions
mv open_in_code.nemo_action open_in_terminal.nemo_action /usr/share/nemo/actions

# ---------- Docker ----------
mkdir -p /etc/docker
mv daemon.json /etc/docker
usermod -aG docker rafael

# ---------- Zerotier ----------
mv zerotier-one /var/lib

# ---------- Systemctl ----------
ln -sf /usr/lib/systemd/system/zerotier-one.service /etc/systemd/system/multi-user.target.wants/zerotier-one.service
ln -sf /usr/lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service
ln -sf /usr/lib/systemd/system/docker.service /etc/systemd/system/multi-user.target.wants/docker.service
EOF

# ---------- LazyVim ----------
git clone https://github.com/LazyVim/starter ~/.config/nvim

# ---------- Script ----------
mv hyprland_config.sh /home/rafael

# Aplicando as configurações
dconf write /org/gnome/desktop/interface/gtk-theme "'MyBreeze-Dark-GTK'"
dconf write /org/gnome/desktop/interface/icon-theme "'Papirus-Dark'"
dconf write /org/gnome/desktop/interface/cursor-theme "'Adwaita'"
dconf write /org/gnome/desktop/interface/font-name "'Cantarell 11'"

# ---------- Instalação de pacotes do AUR ----------
mkdir -p /home/rafael/aur-builds
cd /home/rafael/aur-builds

repos_aur=(
  "yay"
)

for repo in "${repos_aur[@]}"; do
  git clone https://aur.archlinux.org/$repo.git
  cd $repo && makepkg -si --noconfirm && cd ..
done

rm -rf /home/rafael/aur-builds

yay -S --noconfirm google-chrome brave-bin parsec-bin sunshine arc-gtk-theme

sudo bash <<'EOF'
# ---------- Google Chrome ----------
rm -f /usr/share/applications/com.google.Chrome.desktop
rm -f /usr/share/applications/google-chrome.desktop
rm -f /usr/share/applications/chromium.desktop
mv chromium.desktop /usr/share/applications
mv google-chrome.desktop /usr/share/applications
EOF

echo "Instalação concluída!"
