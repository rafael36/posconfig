#!/bin/bash

# Cria um diretório para os pacotes do AUR
mkdir -p ~/aur-builds
cd ~/aur-builds

# Clona os repositórios do AUR
git clone https://aur.archlinux.org/google-chrome.git
git clone https://aur.archlinux.org/brave-bin.git
git clone https://aur.archlinux.org/parsec-bin.git

# Instala os pacotes
cd google-chrome && makepkg -si --noconfirm && cd ..
cd brave-bin && makepkg -si --noconfirm && cd ..
cd parsec-bin && makepkg -si --noconfirm && cd ..

# Limpeza opcional dos diretórios
rm -rf ~/aur-builds

echo "Instalação concluída!"
