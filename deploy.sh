#!/bin/sh

#### vars ####
DOTFILES=("ZSH" "TMUX" "VIM")

## zsh
DIR_ZSH=zsh
DOT_ZSH=.zshrc
SRC_ZSH=${DIR_ZSH}/${DOT_ZSH}
DEST_ZSH=~/${DOT_ZSH}

## tmux
DIR_TMUX=tmux
DOT_TMUX=.tmux.conf
SRC_TMUX=${DIR_TMUX}/${DOT_TMUX}
DEST_TMUX=~/${DOT_TMUX}

## vim
DIR_VIM=vim
DOT_VIM=.vimrc
SRC_VIM=${DIR_VIM}/${DOT_VIM}
DEST_VIM=~/${DOT_VIM}

cd $(dirname $0)
CURRENT=`pwd`

echo "Deploy dotfiles on your environment."
for TGT in ${DOTFILES[@]};do
	LTGT=$(echo $TGT | tr [A-Z] [a-z])
	echo "deploy ${LTGT} dotfile...."
	SRC=$(eval 'echo $SRC_'${TGT})
	DEST=$(eval 'echo $DEST_'${TGT})
	cp ${SRC} ${DEST}
	if [ $? -eq 0 ];then
		 echo "Success to deploy ${LTGT} dotfile."
	else
		exit 1;
	fi
done
echo "Complete deployment!!"
