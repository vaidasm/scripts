#!/bin/bash

sudo pacman -S --needed playerctl
sudo sh -c "curl https://raw.githubusercontent.com/folixg/pause-on-lock/master/pause-on-lock -o /usr/local/bin/pause-on-lock"
sudo chmod +x /usr/local/bin/pause-on-lock

echo "[Desktop Entry]
Type=Application
Exec=pause-on-lock
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=pause-on-lock" > $HOME/.config/autostart/pause-on-lock.desktop

