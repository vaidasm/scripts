#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

cp -n ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

sed 's/^\# ZSH_CUSTOM=.*$/ZSH_CUSTOM=\~\/\.dotfiles\/zsh/g' ~/.zshrc
