#!/bin/bash

pacman_packages=(
  hyprland firefox chromium git ttf-dejavu ttf-liberation ttf-font-awesome
  go jq qbittorrent noto-fonts-extra hyprpaper alacritty code fuse2
  waybar polkit-gnome pavucontrol nano pulsemixer p7zip nwg-look noto-fonts
  qt6-wayland slurp amdvlk grim zerotier-one gsimplecal
  xdg-desktop-portal-hyprland vlc
)

install_pacman_packages() {
  echo "Instalando pacotes..."
  sudo pacman -Syu --noconfirm "${pacman_packages[@]}"
}

install_pacman_packages



pacman_packages2=(
mesa vulkan-radeon
  xf86-video-amdgpu xf86-video-ati mpv wine-gecko
)

install_pacman_packages() {
  echo "Instalando pacotes..."
  sudo pacman -Syu --noconfirm "${pacman_packages2[@]}"
}

install_pacman_packages
