
os=`uname`

# if there is not tmux session.excute tmux.
if [ $os = "Darwin" ];then
    export PATH=/usr/local/bin:$PATH
    echo "Cheking tmux session. see below."
    tmux list-session 2> /dev/null || tmux
fi

# zsh specify configuration
bindkey -e

autoload -Uz compinit
compinit

PROMPT="%m:%n%% "
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

# aliases
alias ll="ls -l"
alias la="ls -la"
alias rm="rm -i"
alias t="tmux"

# Python
which pyenv > /dev/null && eval "$(pyenv init -)"
# Ruby
which rbenv > /dev/null && eval "$(rbenv init -)"
# php
export PATH=$HOME/.phpenv/bin:$PATH
which phpenv > /dev/null && eval "$(phpenv init -)"
# Perl
