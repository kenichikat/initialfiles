# prompt
PROMPT='%% '
RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? " 

# keybind
bindkey -d
bindkey -e

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

# for tmux
TERM=screen-256color

# aliases
alias ll="ls -Gl"
alias la="ls -Gla"
alias rm="rm -i"
alias lessf="less +F"
alias t="tmux"
alias tf="terraform"
alias cdw="cd ~/work"

# homebrew
if [ -d /opt/homebrew ]; then
  export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:$PATH
fi

#direnv
which direnv > /dev/null && export EDITOR=vim && eval "$(direnv hook zsh)"

# asdf
if [ -d $HOME/.asdf ]; then
    source "$HOME/.asdf/asdf.sh"
    fpath=(${ASDF_DIR}/completions $fpath)
    source ~/.asdf/plugins/golang/set-env.zsh
    export ASDF_GOLANG_MOD_VERSION_ENABLED=true
fi

#  initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
