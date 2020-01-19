#!/usr/bin/env bash

image=/tmp/screen_locked.png

grim $image
mogrify -scale 5% -scale 2000% $image
