#!/bin/bash

git config --global user.email "vaidas.m@datadog.org"
git config --global user.name "Vaidas Mikalauskas"
git config --global core.excludesfile ~/.gitignore_global

echo ".idea/*" > ~/.gitignore_global

# Add dockerfiles
if [ -d "$HOME/.datadog-dockerfiles" ]; then
  git -C "$HOME/.datadog-dockerfiles" pull > /dev/null
else
  git clone git@github.com:DATA-DOG/dockerfiles.git "$HOME/.datadog-dockerfiles"
fi

rm -rf "$HOME/.vimrc";
ln -s "$HOME/.dotfiles/templates/vimrc" "$HOME/.vimrc";

# Setup composer
if [ ! -f "$HOME/.local/bin/composer" ]; then
  mkdir -p "$HOME/.local/bin"
  curl -o $HOME/.local/bin/composer.phar https://getcomposer.org/composer.phar
  chmod +x $HOME/.local/bin/composer.phar
  ln -s $HOME/.local/bin/composer.phar $HOME/.local/bin/composer
fi

# Setup PhpStorm
if [ ! -d "$HOME/Apps/PhpStorm/current" ]; then
  echo "Downloading PhpStorm"
  curl -o $HOME/Downloads/phpstorm.tar.gz https://download-cf.jetbrains.com/webide/PhpStorm-2017.1.2.tar.gz
  update-storm $HOME/Downloads/phpstorm.tar.gz
fi

# Setup DataGrip
if [ ! -d "$HOME/Apps/DataGrip/current" ]; then
  echo "Downloading DataGrip"
  curl -o $HOME/Downloads/datagrip.tar.gz https://download-cf.jetbrains.com/datagrip/datagrip-2017.1.1.tar.gz
  update-datagrip $HOME/Downloads/datagrip.tar.gz
fi

