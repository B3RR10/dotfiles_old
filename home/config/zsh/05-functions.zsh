#  auto_ls {{{ #
auto-ls () {
    if [[ -z $BUFFER ]]; then
        zle && echo ""
        ls
        echo ""
        if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
            git status --column=row --short
        fi
        echo ""

        zle && zle redisplay
    else
        zle .$WIDGET
    fi
}
zle -N auto-ls
zle -N accept-line auto-ls
add-zsh-hook chpwd auto-ls
#  }}} auto_ls #

# Fre {{{ #
fre_chpwd() {
  fre --add "$(pwd)"
}
typeset -gaU chpwd_functions
chpwd_functions+=fre_chpwd
# }}} Fre #

# vim: foldmethod=marker
