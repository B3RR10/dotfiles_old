#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'st -n __scratchpad -e tmux -u') ]]; then
    echo true
    i3 [instance="__scratchpad"] scratchpad show
    i3 [instance="__scratchpad"] move position center
else
    echo false
    st -n __scratchpad -e tmux -u &
fi
