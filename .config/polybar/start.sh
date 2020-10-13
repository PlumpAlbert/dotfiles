#!/bin/sh
PIDFILE='/tmp/polybar-pid'
BARFILE='/tmp/polybar-bar'
BAR="$1"
[ -f "$PIDFILE" ] && kill "$(cat "$PIDFILE")"

# Wait for dwm to start in order to socket work properly
while ! [ -S /tmp/dwm.sock ]; do
  sleep 1s
done

[ -f "$BARFILE" -a -z "$BAR" ] && export BAR="$(cat $BARFILE)";

case "$BAR" in
  'winxp')
    echo "winxp" > "$BARFILE";
    export CONFIG="$HOME/.config/polybar/winxp";
    ;;
  *)
    echo 'example' > "$BARFILE";
    export CONFIG="$HOME/.config/polybar/config"
    ;;
esac

polybar -r -c "$CONFIG" "$BAR" > /dev/null 2>&1 &
echo $! > "$PIDFILE"
