#!/usr/bin/env bash

BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` ]]; then
    if [[ `echo $BATTINFO | grep -P -o '\d+(?=%)'` < 15 ]]; then
          /home/mberrio/.config/i3/i3exit suspend
    elif [[ `echo $BATTINFO | grep -P -o '\d+(?=%)'` < 25 ]]; then
        DISPLAY=:0.0 /usr/bin/notify-send -u critical -t 0 "Low Battery" "$BATTINFO"
    fi
fi
