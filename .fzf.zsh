# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eder/.fzf/bin* ]]; then
  export PATH="$PATH:/home/eder/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eder/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/eder/.fzf/shell/key-bindings.zsh"

