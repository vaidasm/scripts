# Archlinux
if [ -f /etc/arch-release ]; then
  alias pacman='sudo pacman'
  alias systemctl='sudo systemctl'
  alias service='sudo systemctl'
fi

# Docker
alias d="docker"
alias dc="docker-compose"
alias run-behat="docker-compose exec --user www php /var/www/vendor/bin/behat"
alias run-unit="docker-compose exec --user www php /var/www/vendor/bin/phpunit"
alias s="systemctl"
