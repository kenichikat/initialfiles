# prompt
PROMPT='[%n@%m]%% '
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? " 

# keybind
bindkey -d
bindkey -e

# completion
autoload -U compinit
compinit

# history search
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
alias tailf="tail -f"
alias t="tmux"
alias tf="terraform"

# homebrew
export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

#direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# pyenv
export PATH=$HOME/.pyenv/shims:$PATH
which pyenv > /dev/null 2>&1 && eval "$(pyenv init -)"
which virtualenv > /dev/null 2>&1 && eval "$(pyenv virtualenv-init -)"

# rbenv
export PATH=$HOME/.rbenv/shims:$PATH
which rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
which goenv > /dev/null 2>&1 && eval "$(goenv init -)"
