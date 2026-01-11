# Append to the history file
shopt -s histappend

# Set history lenght and file size
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command and update it if needed
shopt -s checkwinsize

# Setup mode (vi or emacs)
set -o emacs

# Check username
WHO=$(whoami)

# Bold
BLACK='\033[1;30m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No color

# Prompt
PS1='['${GREEN}'\u@\h'${NC}'] ('${BLUE}'\w'${NC}') 
  '
#PS1='╭─ ['${GREEN}'\u@\h'${NC}'] ('${BLUE}'\w'${NC}') 
#╰─  '

# Source aliases
if [ -f /Users/${WHO}/.bash_aliases ]; then
  . /Users/${WHO}/.bash_aliases
fi

# Bash autocomplete
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add support for Alt on MacOS
bind '"\e[1;3D": backward-word'
bind '"\e[1;3C": forward-word'

# Only run tmux in interactive shells
case $- in
  *i*)
    [ -z "$TMUX" ] && {
      SESSION_NAME="default"
      tmux attach -t "$SESSION_NAME" 2>/dev/null || exec tmux new -s "$SESSION_NAME"
    }
    ;;
esac
