# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eder/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/eder/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eder/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/eder/.fzf/shell/key-bindings.bash"
