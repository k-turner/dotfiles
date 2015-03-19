autoload -U compinit && compinit

# complement
function _ssh {
	if [ -f ~/.ssh/config ];then
		compadd `fgrep 'Host ' ~/.ssh/config | awk '{print $2}' | sort`;
  fi
	if [ -f ~/.ssh/known_hosts ];then
		compadd `cat ~/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1`;
	fi
}

# prompt
case ${UID} in
0)
    PROMPT="%B%{[31m%}[%/]#%{[m%}%b "
    PROMPT2="%B%{[31m%}[%_]#%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[32m%}[%/]%%%{[m%} "
    PROMPT2="%{[32m%}[%_]%%%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac

# RVM
[ -s ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm

# path
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export LANG=ja_JP.UTF-8

# aliases
alias ll='ls -lt'
alias lr='ls -ltra'
alias v='vim'

# RVM
[ -s ~/.rvm/scripts/rvm ] && source ~/.rvm/scripts/rvm

echo "Hello Master. How have you been?"
