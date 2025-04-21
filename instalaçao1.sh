#!/bin/bash

# Instala o Arch com seus arquivos
archinstall --config user_configuration.json --creds user_credentials.json

# Copia o script principal
cp posconfig.sh /mnt/home/rafael/posconfig.sh
chmod +x /mnt/home/rafael/posconfig.sh

# Executa dentro do chroot
arch-chroot /mnt /bin/bash -c "bash /home/rafael/posconfig.sh"
