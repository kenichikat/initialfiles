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
    test -d /opt/homebrew/share/google-cloud-sdk/ && source /opt/homebrew/share/google-cloud-sdk/path.zsh.inc
    test -d /opt/homebrew/share/google-cloud-sdk/ && source /opt/homebrew/share/google-cloud-sdk/completion.zsh.inc
    # vscode
    test -d /Applications/Visual\ Studio\ Code.app && export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
elif [ ${OS} = "Linux" ]; then
    # snap
    test -d /snap && export PATH=/snap/bin:$PATH
fi

# direnv
which direnv > /dev/null && export EDITOR=vim && eval "$(direnv hook zsh)"

# asdf
if [ -d $HOME/.asdf ]; then
    source "$HOME/.asdf/asdf.sh"
    fpath=(${ASDF_DIR}/completions $fpath)
fi

# asdf rust
export RUST_WITHOUT=rust-docs
export RUST_SOURCE=1

# asdf golang
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
source ${HOME}/.asdf/plugins/golang/set-env.zsh

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ken/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
