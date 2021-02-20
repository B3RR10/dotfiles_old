#!/usr/bin/env bash

CMD="kitty --class __scratchpad"
# CMD="st -n __scratchpad"

if [[ ! -z $(pgrep -f "$CMD") ]]; then
    echo true
    i3 [instance="__scratchpad"] scratchpad show
    i3 [instance="__scratchpad"] move position center
else
    echo false
    $CMD &
fi
