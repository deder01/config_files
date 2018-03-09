# Setup fzf
# ---------
if [[ ! "$PATH" == */home/deder/.fzf/bin* ]]; then
  export PATH="$PATH:/home/deder/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/deder/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/fzf/key-bindings.zsh"

