export PATH=$HOME/bin:/usr/local/sbin:$PATH

export PYTHONPATH="$HOME/bin:$PYTHONPATH"
export HADOOP_HOME=/usr/local/Cellar/hadoop/1.0.1

export JAVA_HOME=$(/usr/libexec/java_home)

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" scp

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

stty stop undef # to unmap ctrl-s

# iterm coloring
export LSCOLORS=dxfxcxdxbxegedabagacad
export TERM=xterm-256color
alias ls="ls -G"

alias start_postgres="postgres -D /usr/local/var/postgres"
