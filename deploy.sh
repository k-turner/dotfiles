#!/bin/sh

#### vars ####
DOTFILES=("ZSH" "TMUX" "VIM")

## zsh
DIR_ZSH=zsh
DOT_ZSH=${DIR_ZSH}/.zshrc
DIST_ZSH=~/${ZSHDOT}

## tmux
DIR_TMUX=tmux
DOT_TMUX=${DIR_TMUX}/.tmux.conf
DIST_TMUX=~/${TMUXDOT}

## vim
DIR_VIM=vim
DOT_VIM=${DIR_VIM}/.vimrc
DIST_VIM=~/${VIMDOT}

cd $(dirname $0)
CURRENT=`pwd`

echo "Deploy dotfiles on your environment."
for TGT in ${DOTFILES[@]};do
	LTGT=$(echo $TGT | tr [A-Z] [a-z])
	echo "deploy ${LTGT} dotfile...."
	SRC=$(eval 'echo $DOT_'${TGT})
	DIST=$(eval 'echo $DIST_'${TGT})
	cp ${SRC} ${DIST}
	if [ $? -eq 0];then
		 echo "Success to deploy ${LTGT} dotfile."
	else
		exit 1;
	fi
done
echo "Complete deployment!!"
