#!/bin/bash

# Add dockerfiles
if [ -d "$HOME/.datadog-dockerfiles" ]; then
  git -C "$HOME/.datadog-dockerfiles" pull > /dev/null
else
  git clone git@github.com:DATA-DOG/dockerfiles.git "$HOME/.datadog-dockerfiles"
fi
