source ~/.bashrc
PATH=/usr/local/bin:$PATH
export PATH

export PATH=/usr/local/share/python:$PATH
export PATH=/Users/mdeland/src/libsvm-3.12:$PATH
export PATH=/Users/mdeland/src/libsvm-3.12/tools:$PATH

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

export DATA=/Users/mdeland/data/
export HARMONY_HOME=/Users/mdeland/src/hi/kfit_temp

export STAGING_CREDS='wagon-admin:YicLi4AWKZz4pKxtpDuvKPMNsQBksc'
export PROD_CREDS='wagon-admin:qTZWLvGKJRRiRfAPQgMYHuZw2HAvC6'

export WEKAHOME=/Users/mdeland/src/weka-3-6-7
export CLASSPATH=$WEKAHOME/weka.jar:$CLASSPATH
export HADOOP_HOME=/usr/local/Cellar/hadoop/1.0.1/libexec
export PIG_HOME=/Users/mdeland/src/pig-0.10.0
export PATH=$PIG_HOME/bin:$PATH

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias git="hub"
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias ga="git add"
alias gl="git lola"
alias gb="git branch"
alias gd="git diff"
alias gfp="git fetch --prune"
alias gitclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'

source `brew --prefix`/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/etc/bash_completion.d/hub.bash_completion.sh

set -o vi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin
export PATH=/Users/mdeland/.local/bin:$PATH
export PYTHONPATH=/Users/mdeland/src/nba/nbascrape:$PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/Users/mdeland/src/

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# OPAM configuration
. /Users/mdeland/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH="$HOME/Library/Haskell/bin:$PATH"
eval "$(rbenv init - --no-rehash)"
export PATH="$HOME/.rbenv/bin:$PATH"
export GHCPATH=/usr/local/ghc/bin
export PATH=$GHCPATH:$PATH

eval "$(rbenv init -)"
export PATH=/usr/local/sbin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
eval "$(hub alias -s)"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
source "/Users/mdeland/.scm_breeze/scm_breeze.sh"

infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/.$TERM.ti
tic ~/.$TERM.ti
alias vim=nvim
