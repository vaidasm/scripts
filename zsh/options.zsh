# ZSH options
setopt rm_star_silent

ZSH_THEME=robbyrussell

# ENV
export EDITOR="vim"
export GOPATH="$HOME/Go"

# PATH
export PATH="$HOME/.local/bin:$PATH"

if [ -d "$HOME/.datadog-dockerfiles/" ]; then
  export PATH="$PATH:$HOME/.datadog-dockerfiles/bin"
fi
