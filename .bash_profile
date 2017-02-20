###############################################
# General settings
###############################################
export EDITOR=vim
export LD_LIBRARY_PATH="/usr/X11R6/lib:"$LD_LIBRARY_PATH

###############################################
# Optional settings
###############################################
# Automatically highlight matches with grep
export GREP_OPTIONS=--color=auto
# Format the bash command prompt
export PS1='\[\e[1;31m\]\u@\h:\[\e[1;34m\]\w\[\e[1;26m\]\$\[\e[0;1m\] '
# Override the default ls colors
export CLICOLOR=1
export LSCOLORS=bxfxbxdxcxegedabagacad
##############################################
# Quickly source bash profile
##############################################
alias bp='source ~/.bash_profile'

##############################################
# Use the vim version installed by brew
##############################################
alias vim='/usr/local/bin/vim'

source ~/.bashrc
