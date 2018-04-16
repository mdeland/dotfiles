# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mdeland/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  dotenv
  git
  osx
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

export PATH=$HOME/bin:/usr/local/sbin:$PATH
PATH=$(echo $PATH | sed 's/\/box\/www\/devtools_readonly\/bin[:]*//g')

# Remove any existing /usr/local/bin from the path
PATH=$(echo $PATH | sed 's/\/usr\/local\/bin[:]*//g')
export PATH=/usr/local/bin:/box/www/devtools_readonly/bin:$PATH

# This line was automatically added by Toolbox.
# export PATH="$PATH:/Users/mdeland/.toolbox/homebrew/toolbox-bin:/Users/mdeland/.toolbox/homebrew/sbin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export BOX_REC_PATH=/Users/mdeland/src/box-recomm
export PYTHONPATH="$HOME/bin:$PYTHONPATH"
export PYTHONPATH=$PYTHONPATH:$BOX_REC_PATH

export SPARK_LOCAL_IP=127.0.0.1
export SPARK_PATH=~/src/spark-2.1.0-bin-hadoop2.7
export SPARK_HOME="/Users/mdeland/src/spark-2.1.0-bin-hadoop2.7"
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=/Users/mdeland/.pyenv/shims/python
export PYSPARK_DRIVER_PYTHON=ipython
export PYTHONPATH=$SPARK_HOME/libexec/python:$SPARK_HOME/libexec/python/build:$PYTHONPATH
alias spark_home="cd ${SPARK_HOME};"
alias snotebook='$SPARK_PATH/bin/pyspark --master local[2]'

export ACS_API_KEY="147158310243bb02be05974915db8602d370d791"
export QDS_API_TOKEN="b280ff459c834d80b8a648c9250f910e3a1195d5b5a44d3087cc575b79fdd763"

export PATH=$SPARK_HOME/bin:$PATH

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

eval "$(direnv hook zsh)"

# eval "$(pyenv init -)"
[ -s "/Users/mdeland/.scm_breeze/scm_breeze.sh" ] && source "/Users/mdeland/.scm_breeze/scm_breeze.sh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:/Users/mdeland/.toolbox/homebrew/toolbox-bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
