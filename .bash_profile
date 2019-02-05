# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/bin/git

export GOPATH=$HOME/work/go

unset USERNAME
export LANG=ru_RU.UTF8

shopt -s cdspell
shopt -s cmdhist
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTIGNORE="&:ls:exit:bg:fg"
export HISTCONTROL="ignoredups"

function parse_git_branch {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;0m\]"
PS1="$GREEN[\u@\h \W $RED\$(parse_git_branch)$GREEN]$WHITE\$ "

. $HOME/bin/git-completion.bash

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -la'
alias la='ls -a'
alias l='ls -CF'

alias itmux='tmux attach || tmux new'

if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi
