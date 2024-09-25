#!/bin/bash

# Requisitos
sudo apt-get install mpv xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev xdotool zip unzip -y

# Instalación
cd "$(dirname "$0")/recursos/xwinwrap" || exit 1
make
sudo make install
make clean
cd ../..
mkdir -p "/$HOME/.local/share/nemo/actions/set-as-video-wallpaper-chmodmasx"
cp "$(dirname "$0")/recursos/action/set-as-video-wallpaper.sh" "$HOME/.local/share/nemo/actions/set-as-video-wallpaper-chmodmasx/"
cp "$(dirname "$0")/recursos/action/set-video-wallpaper.nemo_action" "$HOME/.local/share/nemo/actions/"
