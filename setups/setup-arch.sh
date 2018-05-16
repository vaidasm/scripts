#!/bin/bash

USER=vaidas
USER_HOME=/home/vaidas

if [ `whoami` != "root" ]; then
    echo "Must be run with root"
    exit 255;
fi

echo "NOENTER=0" >> /etc/yaourtrc
echo "EDITFILES=0" >> /etc/yaourtrc
echo "NOCONFIRM=0" >> /etc/yaourtrc

# Disable pc speeker
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
rmmod pcspkr 2> /dev/null

# Install defaults
pacman -Sy --needed patch gcc pkg-config make fakeroot binutils \
                    openssh sudo vim terminator git firefox zsh \
                    docker docker-compose networkmanager nodejs npm \
                    pwgen atom composer ttf-bitstream-vera vault \
                    sshpass ttf-dejavu ttf-ubuntu-font-family \
                    gimp htop ansible meld mariadb-clients

echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.d/max_watches.conf
sudo sysctl -p --system

if getent group docker | grep &>/dev/null "\b${USER}\b"; then
  sudo adduser $USER docker
fi

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
systemctl enable docker

# Clone this dir
sudo -u $USER git clone https://github.com/vaidasm/scripts.git $USER_HOME/.dotfiles

# Install google chrome
sudo -u $USER yaourt -S --noconfirm --needed google-chrome slack-desktop spotify

# Add user to groups
groupadd docker 2> /dev/null
sudo gpasswd -a ${USER} docker 2> /dev/null

# Setup zsh
sudo -u $USER $USER_HOME/.dotfiles/setups/setup-zsh.sh
sudo -u $USER $USER_HOME/.dotfiles/setups/setup-dev.sh

# Enable sudo
echo "vaidas ALL=(ALL) ALL" >> /etc/sudoers

# Enable zsh
chsh -s /bin/zsh $USER

# Idea config
echo "fs.inotify.max_user_watches = 524288" > /etc/sysctl.d/max-wathes.conf
sysctl -p --system
