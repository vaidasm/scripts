#!/bin/bash

USER=vaidas
USER_HOME=/home/vaidas

if [ `whoami` != "root" ]; then
    echo "Must be run with root"
    exit 255;
fi

# Disable pc speeker
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
rmmod pcspkr 2> /dev/null

# Install defaults
pacman -Sy --needed gcc pkg-config make fakeroot binutils openssh sudo vim terminator git firefox zsh docker docker-compose networkmanager

# Install yaourt
sudo -u $USER mkdir -p $USER_HOME/.local/src/

pacman -Q package-query 2> /dev/null
if [ "$?" != "0" ]; then
  sudo -u $USER git clone https://aur.archlinux.org/package-query.git $USER_HOME/.local/src/package-query
  cd $USER_HOME/.local/src/package-query
  sudo -u $USER makepkg -si
fi

pacman -Q yaourt >> /dev/null
if [ "$?" != "0" ]; then
  sudo -u $USER git clone https://aur.archlinux.org/yaourt.git $USER_HOME/.local/src/yaourt
  cd $USER_HOME/.local/src/yaourt
  sudo -u $USER makepkg -si
fi

# Enable servises
systemctl enable NetworkManager

# Clone this dir
sudo -u $USER git clone https://github.com/vaidasm/scripts.git $USER_HOME/.dotfiles

# Install google chrome
pacman -Q google-chrome >> /dev/null
if [ "$?" != "0" ]; then
  sudo -u $USER yaourt -S google-chrome
fi

# Add user to groups
groupadd docker
sudo gpasswd -a ${USER} docker

# Setup zsh
sudo -u $USER $USER_HOME/.dotfiles/setups/setup-zsh.sh
sudo -u $USER $USER_HOME/.dotfiles/setups/setup-dev.sh

# Enable sudo
echo "vaidas ALL=(ALL) ALL" >> /etc/sudoers

# Enable zsh
chsh -s /bin/zsh $USER
