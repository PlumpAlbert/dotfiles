#!/bin/sh
dwmblocks &
picom &
nm-applet &
pasystray &
/usr/bin/lxqt-policykit-agent &
### Setting wallpaper

# Set wallpaper from previous session
eval "$HOME/.fehbg"

# Launch script to set random wallpaper every 1 min
#wallpaper --max -d 1m "$HOME/Pictures" &

# Pick random picture and set wallpaper
#wallpaper "$(pick -r "$HOME/Pictures")"


sleep 1s
start-pulseaudio-x11
sleep 1s
jack_init.sh
