#!/usr/bin/env bash

DPI=$(xrdb -query -all | grep Xft.dpi | awk -F ' ' '{print $2}')

if test -z "$DPI"; then
	DPI=96
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if (( $DPI > 96 )); then
	polybar -r hidpi >>/dev/null 2>&1 &
else
	polybar -r lodpi >>/dev/null 2>&1 &
fi

echo "Bars launched..."
