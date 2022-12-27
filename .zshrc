eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"

[[ -f ~/.zsh/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/zsh-snap

source ~/.zsh/zsh-snap/znap.zsh
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source jeffreytse/zsh-vi-mode 
# znap source kutsan/zsh-system-clipboard

# bindkey -v

autoload -U compinit; compinit
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select


[ -f "/Users/maxgiga/.ghcup/env" ] && source "/Users/maxgiga/.ghcup/env" # ghcup-env

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
export VISUAL_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERM="xterm-256color"
export FNM_DIR="$HOME/.fnm"
export SHELL=/bin/zsh
alias lldb-vscode="/opt/homebrew/Cellar/llvm/15.0.6/bin/lldb-vscode"

alias ll="exa -l"

typeset -aU path

path=("$HOME/.local/bin"  $path)
path=("$HOME/.cargo/bin"  $path)

# export CPATH="/opt/homebrew/include"
# export LIBRARY_PATH="/opt/homebrew/lib"
export GCC_X86="/opt/gcc-12.1.0/bin/"
# export SWIFT="/opt/homebrew/Cellar/swift/5.7/bin/"

source /Users/maxgiga/.config/broot/launcher/bash/br


git-fuzzy-diff ()
 {
 	PREVIEW_PAGER="less --tabs=4 -Rc"
 	ENTER_PAGER=${PREVIEW_PAGER}
 	if [ -x "$(command -v delta)" ]; then
 		PREVIEW_PAGER="delta | ${PREVIEW_PAGER}"
 		ENTER_PAGER="delta | sed -e '1,4d' | ${ENTER_PAGER}"
 	fi

 	# Don't just diff the selected file alone, get related files first using
 	# '--name-status -R' in order to include moves and renames in the diff.
 	# See for reference: https://stackoverflow.com/q/71268388/3018229
 	PREVIEW_COMMAND='git diff --color=always '$@' -- \
 		$(echo $(git diff --name-status -R '$@' | grep {}) | cut -d" " -f 2-) \
 		| '$PREVIEW_PAGER

 	# Show additional context compared to preview
 	ENTER_COMMAND='git diff --color=always '$@' -U10000 -- \
 		$(echo $(git diff --name-status -R '$@' | grep {}) | cut -d" " -f 2-) \
 		| '$ENTER_PAGER

 	git diff --name-only $@ | \
 		fzf ${GIT_FZF_DEFAULT_OPTS} --exit-0 --preview "${PREVIEW_COMMAND}" \
 		--preview-window=top:85% --bind "enter:execute:${ENTER_COMMAND}"
 }



source ~/.vi_system_buffer.zsh
alias config='/usr/bin/git --git-dir=/Users/maxgiga/.cfg/ --work-tree=/Users/maxgiga'
