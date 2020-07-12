#!/bin/sh
### Setting wallpaper

# Set wallpaper from previous session
#eval "$HOME/.fehbg"

# Launch script to set random wallpaper every 1 min
#/usr/local/bin/scripts/wallpaper -d 1m "$HOME/Pictures" &

# Pick random picture and set wallpaper
#img="$(/usr/local/bin/scripts/pick -r "$HOME/Pictures")"
#[ $(identify -format '%w/%h != 1.7' "$img" | bc -l) ] \
#  && feh --bg-fill "$(blur-wallpaper "$img")" \
#  || feh --bg-fill "$img"
