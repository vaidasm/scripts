# ZSH options
setopt rm_star_silent

# ENV
export EDITOR="vim"

export GOPATH="$HOME/Go"

# PATH
if [ -d "$HOME/.datadog-dockerfiles/" ]; then
  export PATH="$PATH:$HOME/.datadog-dockerfiles/bin"
fi
