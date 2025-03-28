eval "$(/opt/homebrew/bin/brew shellenv)"
if [[ -e /etc/zshenv ]]
then
  source /etc/zshenv
fi

if [[ -o interactive && -e /etc/zshrc ]]
then
  source /etc/zshrc
fi

export PATH=
path=(
       /opt/homebrew/bin
       $HOME/.local/bin
       ~/bin
       ~/usr/bin
       /usr/kerberos/bin
       /usr/local/bin
       /usr/bin
       /bin
       /usr/sbin
       /sbin
       /usr/local/sbin
       /usr/local/bin
       /Applications/IntelliJ IDEA CE.app/Contents/MacOS
       $HOME/node_modules/.bin
       $HOME/.local/bin:$PATH:$HOME/.local/python-3.6.3/bin
     )

## Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Begin oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Use the node modules needed for js development

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Don't open vim if no file is passed
vim() {
   if [[ $# -eq 0 ]]; then
     return 1
   fi

   command "vim" "$@" 
}

plugins=(git vi-mode zsh-autosuggestions)

# max open files for yosemite
# ulimit -n 65536

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set custom folder to something we can actually track
ZSH_CUSTOM=".zsh_custom"

# Don't show user@computer-name in the comamand line
DEFAULT_USER=$USER

# Manage git config files using config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Alias y to facebook's yarn
alias y='yarnpkg'

# Show lost things on git gui 
alias grecover="gitk --all \$( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )"

# More git shortcuts
alias gdc="git diff --cached"
alias gs="git stash"
alias gsa="git stash apply"
alias gsl="git stash list"
alias gss="git stash save"
alias gsp="git stash pop"

# Quick case-insensitive search
alias agi="ag -i"
alias ag="ag -p ~/.ignore"


##### config #####
alias cond="config diff"
alias conc="config commit"
alias conpush="config push origin master"
alias conpull="config pull"
##### /config #####

##### fzf #####
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# goto - cd into the directory of the selected file
goto() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Accept history selection instead of putting it on
# the command line
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

##### fzf #####
alias f='vim $(fzf-tmux)'

### Alias brew to pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

alias goprojects="cd $HOME/Projects/"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# NVM for node management
export NVM_DIR="$HOME/.nvm"

alias nvm_start='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &&
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'  # This loads nvm
export PATH="/usr/local/opt/ruby/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
nvm_start
