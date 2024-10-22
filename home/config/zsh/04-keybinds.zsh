# Vim mode {{{ #
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^o' vi-cmd-mode
bindkey '^[' vi-cmd-mode

# Edit line in vim with `V` in normal mode:
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'V' edit-command-line
# }}} Vim mode #

# vim: foldmethod=marker
