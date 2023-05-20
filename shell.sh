#!/bin/bash

# Instalar Zsh y Kitty
sudo apt-get update 
sudo apt-get install scrub zsh zsh-autosuggestions zsh-syntax-highlighting git wget -y
#sudo apt-get install kitty -y

# Cambiar shell por defecto a Zsh para el usuario actual y root
sudo usermod --shell /usr/bin/zsh $(whoami)
sudo usermod --shell /usr/bin/zsh root

# Configurar Zsh
wget -O ~/.zshrc https://raw.githubusercontent.com/SxnSess/shell/main/.zshrc

# Instalar plugin de sudo para Zsh
sudo mkdir -p /usr/share/zsh-sudo
sudo wget -O /usr/share/zsh-sudo/sudo.plugin.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Crear enlace simbólico de .zshrc del usuario actual al .zshrc del usuario root
sudo ln -s ~/.zshrc /root/.zshrc

# Instalar lsd
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
sudo sudo dpkg -i lsd_0.23.1_amd64.deb
rm lsd_0.23.1_amd64.deb

# Instalar bat
wget https://github.com/sharkdp/bat/releases/download/v0.23.0/bat_0.23.0_amd64.deb
sudo sudo dpkg -i bat_0.23.0_amd64.deb
rm bat_0.23.0_amd64.deb

# Establecer Kitty como terminal por defecto
sudo update-alternatives --config x-terminal-emulator
# Selecciona el número correspondiente a Kitty en la lista y presiona Enter

# Instalar fzf en el usuario actual
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Cambiar al usuario root y realizar la instalación de fzf
sudo -i <<EOF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
exit
EOF

# Reiniciar la sesión actual para que los cambios surtan efecto
exec zsh
