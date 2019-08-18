#!/usr/bin/env zsh

if [[ "$COLORS" == "true" ]]; then
    zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
    zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
    zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==00;32=00;32}:${(s.:.)LS_COLORS}")';
else
    zstyle ':completion:*:warnings' format $'No matches for: %d'
fi
# zstyle ':completion:*:processes' command "ps -au$USER"
zstyle ':completion:*:processes' command "ps -u $USER -o pid,comm"
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command "ps xho command"

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'


zstyle '*' single-ignored show
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:messages' format '%d'


zstyle ':completion:*' list-colors ''


zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
