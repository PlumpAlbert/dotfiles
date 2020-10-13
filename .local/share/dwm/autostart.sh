#!/bin/sh
#[ $(pidof dwmblocks) ] || dwmblocks &
if [ "$(which picom)" ]; then
  [ $(pidof picom) ] || picom &
else
  [ $(pidof compton) ] || compton &
fi
[ $(pidof lxqt-notificationd) ] || lxqt-notificationd &
[ $(pidof nm-applet) ] || nm-applet &
#[ $(pidof pasystray) ] || pasystray &
[ $(pidof lxqt-policykit-agent) ] || lxqt-policykit-agent &
[ $(pidof redshift) ] || redshift-gtk &
numlockx on
### Setting wallpaper

# Set wallpaper from previous session
eval "$HOME/.fehbg"

# Launch script to set random wallpaper every 1 min
#wallpaper --blur -d 1m "$HOME/Pictures" &

# Pick random picture and set wallpaper
#wallpaper "$(pick -r "$HOME/Pictures")"

#qwall 1m
"$HOME/.local/scripts/jack_init.sh"
echo "$HOME/.Xresources" | entr -p xresupdate

sleep 3s
"$HOME/.config/polybar/start.sh"
