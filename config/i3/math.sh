#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'termite --name __math -e R') ]]; then
    echo true
    i3 [instance="__math"]scratchpad show
    i3 [instance="__math"] move position center
else
    echo false
    termite --name __math -e 'R' &
fi
