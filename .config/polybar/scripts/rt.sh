#!/bin/sh

ICON="👨💻"
! [ "$(ps -o pid= -C rescuetime)" ] && echo ""
! [ -f "$HOME/.local/share/rescuetime.key" ] && echo $ICON
key="$(cat "$HOME/.local/share/rescuetime.key")"
url="https://www.rescuetime.com/anapi/data\
?key=$key\
&format=csv\
&i=day\
&rb=$(date '+%F')\
&re=$(date '+%F')\
&rk=productivity"
data="$(curl -sL $url)"
vp=$(echo "$data" | awk -F, '$4==2 {print $2}')
p=$(echo "$data" | awk -F, '$4==1 {print $2}')
seconds=$((vp + p))

echo "$ICON $(date -u -d @${seconds} +'%H:%M')"
