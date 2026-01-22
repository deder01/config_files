###############################################
## General settings (login shell env)
################################################
export EDITOR=vim
export LD_LIBRARY_PATH="/usr/X11R6/lib:${LD_LIBRARY_PATH}"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
