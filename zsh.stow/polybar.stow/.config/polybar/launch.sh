#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar -r top &
if (xrandr | grep "HDMI1 connected" > /dev/null)
then
    polybar -r top2 &
fi

echo "Bars launched..."
