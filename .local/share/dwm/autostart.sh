#!/bin/sh
[ $(pidof dwmblocks)] || dwmblocks &
[ $(pidof picom) ] || picom &
[ $(pidof nm-applet) ] || nm-applet &
[ $(pidof pasystray) ] || pasystray &
[ $(pidof lxqt-policykit-agent) ] || lxqt-policykit-agent &
[ $(pidof redshift) ] || redshift-gtk &
numlockx on
### Setting wallpaper

# Set wallpaper from previous session
#eval "$HOME/.fehbg"

# Launch script to set random wallpaper every 1 min
wallpaper --max --blur -d 1m "$HOME/Pictures" &

# Pick random picture and set wallpaper
#wallpaper "$(pick -r "$HOME/Pictures")"


jack_init.sh
