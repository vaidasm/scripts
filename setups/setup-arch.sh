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

if grep -qe "#Color" /etc/pacman.conf; then
  echo "colors enabled"
else
#  echo Color >> /etc/pacman.conf
fi

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
git clone https://aur.archlinux.org/yay.git $USER_HOME/.local/src/yay
cd $USER_HOME/.local/src/yay
makepkg -si


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
