#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

cp -n ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

sed 's/^\# ZSH_CUSTOM=.*$/ZSH_CUSTOM=\~\/\.dotfiles\/zsh/g' -i ~/.zshrc

cd /tmp && git clone https://github.com/powerline/fonts.git --depth=1
/tmp/fonts/install.sh
rm -rf /tmp/fonts

rm -rf ~/.zshrc
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

