[[ -f $ZNAP_HOME/znap.zsh ]] ||
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $ZNAP_HOME

source $ZNAP_HOME/znap.zsh

znap source ohmyzsh/ohmyzsh \
    lib/{git,key-bindings} \
    plugins/{colored-man-pages,direnv,fzf,git,git-extras,rsync}

znap source Aloxaf/fzf-tab
# set case insensitive and partial completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `C-h` and `C-l`
zstyle ':fzf-tab:*' switch-group 'ctrl-h' 'ctrl-l'

znap source rupa/z

znap source zsh-users/zsh-completions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap fpath _dotdrop 'cat /usr/share/zsh/site-functions/_dotdrop'
compdef _dotdrop dt
