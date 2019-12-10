# ZSH options
setopt rm_star_silent

ZSH_THEME=robbyrussell
HYPHEN_INSENSITIVE="true"
RM_STAR_SILENT="true"

# ENV
export EDITOR="vim"
export GOPATH="$HOME/Development/go"
export NODE_ENV="development"
export VAULT_ADDR="https://vault.ibuildnew.com"

# PATH
export PATH="$PATH:$HOME/.local/bin:$HOME/.dotfiles/bin:$HOME/.config/composer/vendor/bin:$HOME/.symfony/bin"

if [ -d "$HOME/.datadog-dockerfiles/" ]; then
  export PATH="$PATH:$HOME/.datadog-dockerfiles/bin"
fi
