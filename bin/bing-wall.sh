#!/bin/sh
cd $(dirname $0)
img=$(wget -qO - https://www.bing.com | grep -o "url:.*1920x1080.jpg" | cut -d'"' -f2)
[ -z "$img" ] && exit 1
wget -qN https://www.bing.com$img || exit 1
img=$(echo $img | sed 's/.*\///')
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
gsettings set org.gnome.desktop.background picture-uri file:$(pwd)/$img
