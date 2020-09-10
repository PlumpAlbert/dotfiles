#!/bin/sh
if ! [ $(which entr) ]; then
  sh -c "$HOME/.config/polybar/bar.sh"
else
  (echo "$HOME/.config/polybar/config" | entr "$HOME/.config/polybar/bar.sh") &
fi
