. "$HOME/.bashrc"
PATH=/usr/local/bin:$PATH
export PATH

export PATH=/usr/local/share/python:$PATH
export PATH=/Users/mdeland/src/libsvm-3.12:$PATH
export PATH=/Users/mdeland/src/libsvm-3.12/tools:$PATH
alias tunnel=start_autossh
#alias vim=/usr/local/bin/mvim

#export M2_HOME=/usr/local/Cellar/maven/3.0.4/libexec/
#export M2=$M2_HOME/bin
#export MAVEN_OPTS="-Dhttp.proxyHost=localhost -Dhttp.proxyPort=3129"
#export PATH=$M2:$PATH
export DATA=/Users/mdeland/data/

export WEKAHOME=/Users/mdeland/src/weka-3-6-7
export CLASSPATH=$WEKAHOME/weka.jar:$CLASSPATH
export HADOOP_HOME=/usr/local/Cellar/hadoop/1.0.1/libexec
export PIG_HOME=/Users/mdeland/src/pig-0.10.0
export PATH=$PIG_HOME/bin:$PATH

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias gs="git status"
alias gc="git commit"
alias gr="git checkout"
alias ga="git add"
alias gl="git lola"

#tunnel
#~/proxies/ssh-tunnel-web

set -o vi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin

# OPAM configuration
. /Users/mdeland/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH="$HOME/Library/Haskell/bin:$PATH"
eval "$(rbenv init - --no-rehash)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH=/usr/local/sbin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
eval "$(hub alias -s)"
