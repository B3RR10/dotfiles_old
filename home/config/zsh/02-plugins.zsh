if [[ ! -d ${ZINIT[HOME_DIR]} ]]; then
    mkdir -p ${ZINIT[HOME_DIR]}
    git clone https://github.com/zdharma/zinit.git ${ZINIT[HOME_DIR]}
fi

source ${ZINIT[HOME_DIR]}/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit wait lucid for \
    blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions \
    OMZP::colored-man-pages \
    OMZP::fzf \
    OMZP::git \
    svn as'completion' pick'_pip' atpull'zinit creinstall -q .' OMZP::pip \
    svn PZT::modules/completion

zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/key-bindings.zsh

zinit ice wait'1' lucid as'completion' aliases
zinit snippet '$DOTREPO/dotdrop/completion/_dotdrop-completion.zsh'

zicompdef _dotdrop-completion.zsh dot
zicompdef _dotdrop-completion.zsh sdot

zinit ice wait lucid atload'zicompinit; zicdreplay'
zinit light zsh-users/zsh-syntax-highlighting

if whence zi | grep "zinit" >/dev/null; then
    unalias zi
fi

eval "$(zoxide init zsh)"
