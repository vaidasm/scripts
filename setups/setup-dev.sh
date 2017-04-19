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

# Setup PhpStorm
if [ -f "$HOME/Apps/PhpStorm/current" ]; then
  curl -o $HOME/Downloads/phpstorm.tar.gz https://download-cf.jetbrains.com/webide/PhpStorm-2017.1.2.tar.gz
  update-storm $HOME/Downloads/phpstorm.tar.gz
fi


