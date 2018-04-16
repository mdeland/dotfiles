# begin devtools provisioning to setup local development

# Remove any existing /box/www/devtools_readonly/bin from the path
PATH=$(echo $PATH | sed 's/\/box\/www\/devtools_readonly\/bin[:]*//g')

# Remove any existing /usr/local/bin from the path
PATH=$(echo $PATH | sed 's/\/usr\/local\/bin[:]*//g')

# Add /usr/local/bin and /box/www/devtools_readonly/bin to the top of your PATH
export PATH=/usr/local/bin:/box/www/devtools_readonly/bin:$PATH
# end devtools provisioning
# begin devtools
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[<\033[32m\]\$(parse_git_branch)\[\033[00m\]> $ "

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

if [[ !  -z  $(show_virtual_env) ]]; then
  PS1="$(show_virtual_env) $PS1"
fi

# end devtools
# begin devtools
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
# end devtools

[ -s "/Users/mdeland/.scm_breeze/scm_breeze.sh" ] && source "/Users/mdeland/.scm_breeze/scm_breeze.sh"

# eval "$(pyenv init -)"

# This line was automatically added by Toolbox.
export PATH="$PATH:/Users/mdeland/.toolbox/homebrew/toolbox-bin:/Users/mdeland/.toolbox/homebrew/sbin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

export SPARK_LOCAL_IP=127.0.0.1
export SPARK_PATH=~/src/spark-2.1.0-bin-hadoop2.7
export SPARK_HOME="/Users/mdeland/src/spark-2.1.0-bin-hadoop2.7"
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=/Users/mdeland/.pyenv/shims/python
export PYSPARK_DRIVER_PYTHON=ipython
export PYTHONPATH=$SPARK_HOME/libexec/python:$SPARK_HOME/libexec/python/build:$PYTHONPATH
alias spark_home="cd ${SPARK_HOME};"

export BOX_REC_PATH=/Users/mdeland/src/box-recomm
export PYTHONPATH=$PYTHONPATH:$BOX_REC_PATH

#For python 3, You have to add the line below or you will get an error
# export PYSPARK_PYTHON=python3
alias snotebook='$SPARK_PATH/bin/pyspark --master local[2]'

export ACS_API_KEY="147158310243bb02be05974915db8602d370d791"
export QDS_API_TOKEN="b280ff459c834d80b8a648c9250f910e3a1195d5b5a44d3087cc575b79fdd763"

export JARVIS_SCRIPTS_EMAIL="mdeland@box.com"
export JARVIS_SCRIPTS_JENKINS_TOKEN="7ca65cda6adb1219d6f3b4c07219d43a"

export PATH=$SPARK_HOME/bin:$PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/mdeland/src/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/mdeland/src/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/mdeland/src/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/mdeland/src/google-cloud-sdk/completion.bash.inc'
fi
