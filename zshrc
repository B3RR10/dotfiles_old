if [[ -f ~/.zpm/zpm.zsh ]]; then
	source ~/.zpm/zpm.zsh
else
	git clone --recursive https://github.com/horosgrisa/zpm ~/.zpm
	source ~/.zpm/zpm.zsh
fi

autoload -Uz add-zsh-hook

zpm load cd
# zpm load check-deps
# zpm load dircolors
# zpm load eol
zpm load git
zpm load ls
zpm load noempty
zpm load oh-my-zsh-wrapper
zpm load path
zpm load title
# zpm load tmux
zpm load user-promt
zpm load zsh-core
zpm load desyncr/auto-ls
zpm load djui/alias-tips
zpm load bhilburn/powerlevel9k

# --------------- Customize to your needs... --------------- #

export ZSHRC=~/.dotfiles/.zsh
for config ($ZSHRC/**/*.zsh) source $config

export EDITOR=nvim
export GIT_EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.scripts:/home/mberrio/.cargo/bin:$PATH"
export RUST_SRC_PATH=$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export LESSCHARSET=UTF-8

screenfetch

# auto-ls () {
#	if [[ $#BUFFER -eq 0 ]]; then
#	  zle && echo ""
#	  l
#	  echo ""
#	  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
#		git status -s
#	  fi
#
#	  zle && zle redisplay
#	else
#	  zle .$WIDGET
#	fi
# }
#
# fpath+=~/.zfunc
#
# zle -N auto-ls
# zle -N accept-line auto-ls
# add-zsh-hook chpwd auto-ls

# --------------- Theme --------------- #
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_SHOW_WEITABLE=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
source $HOME/.local/share/zpm/bhilburn---powerlevel9k/powerlevel9k.zsh-theme
