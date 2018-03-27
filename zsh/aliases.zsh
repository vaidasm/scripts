# Archlinux
if [ -f /etc/arch-release ]; then
  alias pacman='sudo pacman'
fi

if [ -f /bin/systemctl ]; then 
  alias systemctl='sudo systemctl'
  alias s="sudo systemctl"
fi

# Docker
alias d="docker"
alias dc="docker-compose"
alias run-behat="docker-compose exec --user www php /var/www/vendor/bin/behat"
alias run-unit="docker-compose exec --user www php /var/www/vendor/bin/phpunit"
alias comp="docker-compose exec --user www php composer"
alias t="~/.dotfiles/bin/run-component phpunit"
alias b="~/.dotfiles/bin/run-component behat"
alias j="npm test --"
alias jw="npm test -- --watch"
