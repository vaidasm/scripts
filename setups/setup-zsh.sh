#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

sed 's/^\# ZSH_CUSTOM=.*$/ZSH_CUSTOM=\~\/\.dotfiles\/zsh/g' ~/.zshrc
