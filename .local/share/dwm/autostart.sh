#!/bin/sh
### Setting wallpaper

# Set wallpaper from previous session
#eval "$HOME/.fehbg"

# Launch script to set random wallpaper every 1 min
#/usr/local/bin/scripts/wallpaper -d 1m "$HOME/Pictures" &

# Pick random picture and set wallpaper
wallpaper "$(pick -r "$HOME/Pictures")"
