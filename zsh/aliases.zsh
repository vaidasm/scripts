# Archlinux
if [ -f /etc/arch-release ]; then
  alias pacman='sudo pacman'
fi

if [ -f /bin/systemctl ]; then 
  alias systemctl='sudo systemctl'
  alias s="sudo systemctl"
fi

# Docker
alias chown="sudo chown"
alias chmod="sudo chmod"
alias chv="sudo chown -R $USER:$USER ."
alias d="docker"
alias dc="docker-compose"
alias ecs="docker-compose exec --user=www php /var/www/vendor/bin/ecs check app"
alias run-behat="docker-compose exec --user www php /var/www/vendor/bin/behat"
alias run-unit="docker-compose exec --user www php /var/www/vendor/bin/phpunit"
alias comp="docker-compose exec --user www php composer"
alias t="~/.dotfiles/bin/run-component phpunit"
alias tp="~/.dotfiles/bin/run-component paratest"
alias b="~/.dotfiles/bin/run-component behat"
alias j="npm test --"
alias gdd="git branch | grep develop -v | grep master -v | xargs git branch -d"
alias jw="npm test -- --watch"
alias es="npm run eslint-run"
alias esx="npm run eslint-run ./resources/assets/scripts"
alias fl="npm flow check"
alias yh="SOURCE_MAPS=cheap-module-eval-source-map npm run hot"
alias yw="SOURCE_MAPS=cheap-module-eval-source-map npm run watch"
