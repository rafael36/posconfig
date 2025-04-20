#!/bin/bash

# Verifique se o jq está instalado
if ! command -v jq &> /dev/null
then
    echo "O jq não está instalado. Instalando..."
    sudo apt-get install jq -y
fi

# Carregar os pacotes do arquivo JSON
pacotes=$(jq -r '.pacotes[]' pacotes.json)

# Instalar os pacotes
for pacote in $pacotes
do
    echo "Instalando $pacote..."
    sudo pacman -S --noconfirm $pacote
done

echo "Todos os pacotes foram instalados!"
