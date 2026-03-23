###############################################
# General settings
###############################################
export EDITOR=vim
export LD_LIBRARY_PATH="/usr/X11R6/lib:"$LD_LIBRARY_PATH

 ###############################################
# Optional settings
###############################################
# Automatically highlight matches with grep
# Format the bash command prompt
export PS1='\[\e[1;31m\]\u@\h:\[\e[1;34m\]\w\[\e[1;26m\]\$\[\e[0;1m\] '

 ##############################################
# Quickly source bash profile
##############################################
alias bp='source ~/.bash_profile'

[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
