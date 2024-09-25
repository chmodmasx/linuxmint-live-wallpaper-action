#!/bin/bash

# Crear el archivo .desktop para que el video se autoejecute en el inicio
DESKTOP_FILE="$HOME/.config/autostart/video-wallpaper-autostart-chmodmasx.desktop"

# Verificar si el archivo ya existe y eliminarlo (opcional, si quieres reemplazar el archivo cada vez)
if [ -f "$DESKTOP_FILE" ]; then
    rm "$DESKTOP_FILE"
fi

# Crear el archivo .desktop
touch "$DESKTOP_FILE"
chmod +x "$DESKTOP_FILE"
echo "[Desktop Entry]" > "$DESKTOP_FILE"
echo "Type=Application" >> "$DESKTOP_FILE"
echo "Exec=bash -c \"sleep 2; xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -- mpv -wid WID --loop --no-audio '$(readlink -f "$1")'\"" >> "$DESKTOP_FILE"
echo "Hidden=false" >> "$DESKTOP_FILE"
echo "NoDisplay=false" >> "$DESKTOP_FILE"
echo "X-GNOME-Autostart-enabled=true" >> "$DESKTOP_FILE"
echo "Name=Video Wallpaper" >> "$DESKTOP_FILE"
echo "Comment=Reproduce un video como fondo de pantalla" >> "$DESKTOP_FILE"

# Cerrar cualquier instancia de xwinwrap
pkill -9 xwinwrap

# Ejecutar el video como fondo de pantalla
xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -- mpv -wid WID --loop --no-audio --hwdec=auto "$1"

# Lamentablemente esto es lo unico que encuentro para recargar el escritorio
xdotool search --class nemo windowactivate %@ key F5
#xdotool key Super+d
#xdotool key Super+d
