export PATH=$HOME/bin:/usr/local/sbin:$PATH

export PYTHONPATH="$HOME/bin:$PYTHONPATH"
export HADOOP_HOME=/usr/local/Cellar/hadoop/1.0.1

export JAVA_HOME=$(/usr/libexec/java_home)

unalias fs &> /dev/null
alias fs="hadoop fs"
unalias hls &> /dev/null
alias hls="fs -ls"

export PATH=$PATH:$HADOOP_HOME/bin

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" scp

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias git="hub"
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias ga="git add"
alias gl="git lola"
alias gb="git branch --sort=-committerdate"
alias gd="git diff"
alias gfp="git fetch --prune"
alias gitclean='git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d'
alias dm="ssh -A -t bastion ssh dwh-edge1001"

export DATA=~/DATA/
export GOPATH=~/gocode/
export PATH=$PATH:$GOPATH/bin
export GHCPATH=/usr/local/ghc/bin

export PATH=$GHCPATH:$PATH

export PGDATA=/usr/local/var/postgres/
export PGCONFIG=/usr/local/bin/pg_config

stty stop undef # to unmap ctrl-s

# iterm coloring
export LSCOLORS=dxfxcxdxbxegedabagacad
export TERM=xterm-256color
alias ls="ls -G"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

COQTOP="/usr/local"

# [ -s "/Users/mdeland/.scm_breeze/scm_breeze.sh" ] && source "/Users/mdeland/.scm_breeze/scm_breeze.sh"

export PHP_IDE_CONFIG='serverName=mdeland.inside-box.net'
# eval "$(direnv hook bash)"

alias start_postgres="postgres -D /usr/local/var/postgres"
