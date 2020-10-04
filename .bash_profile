# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export NO_DEPRECATED_WARNINGS=1
export FAKE_RELEASE=1

export PATH=$HOME/bin:/usr/local/bin:$HOME/bin/git:$PATH

export GOPATH=$HOME/work/go

unset USERNAME
export LANG=en_US.UTF8

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

tbk(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://t.bk.ru/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://t.bk.ru/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://t.bk.ru/$file_name"|tee /dev/null;fi;}

