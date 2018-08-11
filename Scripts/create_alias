#!/usr/bin/env sh

if [[ $# -eq 0 ]] || [[ $# -gt 1 ]]; then
    echo "Please insert the username"
fi

termination=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 4 | head -n 1)

echo "$1_$termination" | xclip -selection clipboard

notify-send "Create Email Alias" "The alias $1 was created and copied in clipboard"
