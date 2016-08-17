# Add dockerfiles
if [ -d "$HOME/.datadog-dockerfiles" ]; then
  git -C "$HOME/.datadog-dockerfiles" pull
else
  git clone https://github.com/DATA-DOG/dockerfiles.git ~/.datadog-dockerfiles
fi


