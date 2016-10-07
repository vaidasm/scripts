# Archlinux
if [ -f /etc/arch-release ]; then
  alias pacman='sudo pacman'
  alias systemctl='sudo systemctl'
  alias service='sudo systemctl'
fi

# Docker
alias d="docker"
alias dc="docker-compose"
