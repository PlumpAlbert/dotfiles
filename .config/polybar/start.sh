#!/bin/sh
PIDFILE='/tmp/polybar-pid'

killold() {
  kill "$(cat "$PIDFILE")"
  sleep 1s
}

[ -f "$PIDFILE" ] && killold
polybar -c "$HOME/.config/polybar/config" example & > /dev/null 2>&1
echo $! > "$PIDFILE"
