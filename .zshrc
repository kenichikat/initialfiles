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

# tmux
TERM=screen-256color

# aliases
alias ll="ls -Gl"
alias la="ls -Gla"
alias rm="rm -i"
alias lessf="less +F"
alias t="tmux"
alias tf="terraform"
alias beep='afplay /System/Library/Sounds/Ping.aiff'
alias cdw="cd ~/work"

# PATH
OS=$(uname)
if [ ${OS} = "Darwin" ]; then
    # homebrew
    test -d /opt/homebrew && export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:$PATH
    # google-cloud-sdk
    if [ -d /opt/homebrew/share/google-cloud-sdk ]; then
        source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
        source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
    fi
    # vscode
    test -d /Applications/Visual\ Studio\ Code.app && export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
    # Antigravity
    test -d /Users/ken/.antigravity/antigravity/bin && export PATH="/Users/ken/.antigravity/antigravity/bin:$PATH"
    # Docker Desktop
    test -d $HOME/.docker && fpath=($HOME/.docker/completions $fpath)
elif [ ${OS} = "Linux" ]; then
    # snap
    test -d /snap && export PATH=/snap/bin:$PATH
fi

# asdf
if [ -d ${ASDF_DATA_DIR:-$HOME/.asdf} ]; then
    export PATH=${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH
    fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

    # golang
    test -d  ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang && source ~/.asdf/plugins/golang/set-env.zsh
fi

# direnv
which direnv > /dev/null && export EDITOR=vim && eval "$(direnv hook zsh)"

# zsh-completions
autoload -Uz compinit
compinit
