export PATH="$HOME/bin:$PATH"

export PYTHONPATH="$HOME/bin:$PYTHONPATH"
export HADOOP_HOME=/usr/local/Cellar/hadoop/1.0.1
#export HADOOP_HOME=/usr/local/hadoop

export JAVA_HOME=$(/usr/libexec/java_home)

unalias fs &> /dev/null
alias fs="hadoop fs"
unalias hls &> /dev/null
alias hls="fs -ls"

export PATH=$PATH:$HADOOP_HOME/bin

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" scp

export PTG_HOME=/Users/mdeland/kfit/Gumilev/ptg
export PYTHONPATH=$PYTHONPATH:/Users/mdeland/kfit
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export DATA=~/data/
export GOPATH=~/gocode/
export PATH=$PATH:$GOPATH/bin

export PGDATA=/usr/local/var/postgres/
export PGCONFIG=/usr/local/bin/pg_config

stty stop undef # to unmap ctrl-s

# iterm coloring
export LSCOLORS=dxfxcxdxbxegedabagacad
export TERM=xterm-256color
alias ls="ls --color=auto"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

COQTOP="/usr/local"
