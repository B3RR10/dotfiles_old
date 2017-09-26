#!/usr/bin/env bash

if [[ ! -z $(pgrep -f 'termite --name __scratchpad -e tmux -u') ]]; then
	echo true
	i3 scratchpad show
else
	echo false
	termite --name __scratchpad -e 'tmux -u' &
fi
