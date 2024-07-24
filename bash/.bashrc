# Append to the history file
shopt -s histappend

# Set history lenght and file size
HISTSIZE=1000
HISTFILESIZE=2000

# Check window size after each command and update it if needed
shopt -s checkwinsize

# Prompt
who=$(whoami)

if [ "${who}" == "root" ]; then
  PS1='╭─ \[\033[0;31m\]\h\[\033[00m\]
╰─ \[\033[01;34m\]\w\[\033[00m\]  '
  else
  PS1='╭─ \[\033[01;32m\]\u@\h\[\033[00m\]
╰─ \[\033[01;34m\]\w\[\033[00m\]  '
fi

# Source aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash autocomplete
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
