# zsh specify configuration
bindkey -e
autoload -Uz compinit && compinit

PROMPT='[%n@%m]%% '
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? " 

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups 
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# color
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# aliases
alias ll="ls -Gl"
alias la="ls -Gla"
alias rm="rm -i"
alias t="tmux"
alias tf="terraform"

# homebrew
export PATH=/usr/local/bin:$PATH

# Python
export PATH=$HOME/.pyenv/shims:$PATH
which pyenv > /dev/null 2>&1 && eval "$(pyenv init -)"
which virtualenv > /dev/null 2>&1 && eval "$(pyenv virtualenv-init -)"

# Ruby
export PATH=$HOME/.rbenv/shims:$PATH
which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"
