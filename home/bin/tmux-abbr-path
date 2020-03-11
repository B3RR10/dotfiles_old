#!/bin/bash
echo "$( dirname "$1" | sed -e "s;^$HOME;~;" -e 's;/\([^/\.]\)[^/]*;/\1;g' -e 's;/\.\([^/]\)[^/]*;/\.\1;g' )/$( basename "$1" )"
