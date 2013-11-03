#!/bin/sh
git diff -p -R | grep -E "^(diff|(old|new) mode)" | git apply
echo "You can add git alias like this:"
echo "  git config --global --add alias.permission-reset '!git diff -p -R | grep -E \"^(diff|(old|new) mode)\" | git apply'"
