#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'st -n __math -e R') ]]; then
    echo true
    i3 [instance="__math"]scratchpad show
    i3 [instance="__math"] move position center
else
    echo false
    st -n __math -e R &
fi
