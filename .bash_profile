###############################################
# General settings
###############################################
export EDITOR=vim
source ~/.bashrc

# virtualenv stuff
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

alias bp='source ~/.bash_profile'
alias bower='sudo bower --allow-root'
alias freezereqs='pip freeze | grep -v "pkg-resources" > requirements.txt'
