# ZSH options
setopt rm_star_silent

ZSH_THEME=robbyrussell
HYPHEN_INSENSITIVE="true"
RM_STAR_SILENT="true"

# ENV
export EDITOR="vim"
export GOPATH="$HOME/Go"
export NODE_ENV="development"

# PATH
export PATH="$HOME/.local/bin:$HOME/.dotfiles/bin:$PATH"

if [ -d "$HOME/.datadog-dockerfiles/" ]; then
  export PATH="$PATH:$HOME/.datadog-dockerfiles/bin"
fi
