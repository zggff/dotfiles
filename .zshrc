eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

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


#[ -f "/Users/maxgiga/.ghcup/env" ] && source "/Users/maxgiga/.ghcup/env" # ghcup-env

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
export VISUAL_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERM="xterm-256color"
