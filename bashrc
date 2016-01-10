export PATH=$HOME/bin:$PATH

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

export PTG_HOME=/Users/mdeland/src/Gumilev/ptg
export DECLASS_HOME=/Users/mdeland/src/declass
export PH_HOME=/Users/mdeland/src/ph

export PYTHONPATH=$PYTHONPATH:$DECLASS_HOME:$PH_HOME
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export DATA=~/DATA/
export GOPATH=~/gocode/
export PATH=$PATH:$GOPATH/bin
export GHCPATH=/usr/local/ghc/bin

export PATH=$GHCPATH:$PATH

export PGDATA=/usr/local/var/postgres/
export PGCONFIG=/usr/local/bin/pg_config

stty stop undef # to unmap ctrl-s

alias wa="cd ~/src/wagon/app"
alias wt="cd ~/src/wagon/client"
alias ws="cd ~/src/wagon/server"
alias we="cd ~/src/wagon/atom-wrapper"
alias ww="cd ~/src/wagon"
alias wagon_local="WAGON_CLIENT_PATH=/Users/mdeland/src/wagon/client/dist/wagon WAGON_APP_URL=https://wagon.dev out/Wagon\ -\ Staging-darwin-x64/Wagon\ -\ Staging.app/Contents/MacOS/Electron"

# iterm coloring
export LSCOLORS=dxfxcxdxbxegedabagacad
export TERM=xterm-256color
alias ls="ls -G"

alias mysqlfrus="mysql -h declassification-engine.org -u declass -pGdSwY6uV"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

COQTOP="/usr/local"

[ -s "/Users/mdeland/.scm_breeze/scm_breeze.sh" ] && source "/Users/mdeland/.scm_breeze/scm_breeze.sh"
