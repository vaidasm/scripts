#!/bin/bash

# Personal details
git config --global user.name "Vaidas Mikalauskas"
git config --global user.email "vaidas@dutrys.com"

# Config
git config --global push.default tracking
git config --global pull.rebase true
git config --global rebase.autosquash true
git config --global branch.autosetupmerge always

# Aliases
git config --global --add alias.permission-reset '!git diff -p -R | grep -E \"^(diff|(old|new) mode)\" | git apply'

# Other
git config --global color.ui true

# Global gitignore
git config --global core.excludesfile ~/.gitignore_global
if [ ! -f ~/.gitignore_global ]; then
  echo "/.idea/" > ~/.gitignore_global
fi
