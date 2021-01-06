#!/usr/bin/env bash

CMD="alacritty --class __math -e R"
# CMD="st -n __math -e R"

if [[ ! -z $(pgrep -f "$CMD") ]]; then
    echo true
    i3 [instance="__math"]scratchpad show
    i3 [instance="__math"] move position center
else
    echo false
    $CMD &
fi
