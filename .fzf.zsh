# Setup fzf
# ---------
if [[ ! "$PATH" == */home/deder/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/deder/.fzf/bin"
fi

source <(fzf --zsh)
