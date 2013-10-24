
os=`uname`

# if there is not tmux session.excute tmux.
if [ $os = "Darwin" ];then
    echo "Cheking tmux session. see below."
    tmux list-session || tmux
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
# pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# virtulenv / virtualenvwrapper
if [ $os = "Darwin" ];then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
else
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
fi
export WORKON_HOME=$HOME/.virtualenvs
source `which virtualenvwrapper.sh`

# Perl
# perlbrew
[[ -s $HOME/perl5/perlbrew/etc/bashrc ]] && source $HOME/perl5/perlbrew/etc/bashrc
