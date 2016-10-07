# Archlinux
if [ -f /etc/arch-release ]; then 
  alias pacman='sudo pacman'
  alias systemctl='sudo systemctl'
  alias service='sudo systemctl'
fi

# Wrappers
if [ -f ~/.dotfiles/bin/vim-write ]; then
  alias vim="~/.dotfiles/bin/vim-write"
fi

# Docker
alias d="docker"
alias dc="docker-compose"
