#!/bin/sh

ICON="👨💻"
! [ -f "$HOME/.local/share/rescuetime.key" ] && echo $ICON
key="$(cat "$HOME/.local/share/rescuetime.key")"
url="https://www.rescuetime.com/anapi/data?\
key=$key\
&format=csv\
&i=day\
&rb=$(date '+%F')\
&re=$(date '+%F')\
&rk=productivity"
seconds="$(curl -sL $url | awk -F, '$4 > 0 { sum += $2 } END {print sum}')"

echo "$ICON $(date -u -d "@$seconds" +'%H:%M:%S')"
