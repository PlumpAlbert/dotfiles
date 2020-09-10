#!/bin/sh
PIDFILE='/tmp/polybar-pid'
CONFIG="$HOME/.config/polybar/config"

[ -f "$PIDFILE" ] && \
  kill "$(cat "$PIDFILE")"
# Wait for dwm to start in order to socket work properly
sleep 1s
polybar -c "$CONFIG" example > /dev/null 2>&1 &
echo $! > "$PIDFILE"
