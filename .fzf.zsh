# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/eder/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/eder/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/eder/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/eder/.fzf/shell/key-bindings.zsh"

