#!/bin/bash

if [ ! -d ${HOME}/dotfiles ]; then
    git clone https://github.com/FtherB/dotfiles.git
fi

cd ${HOME}/dotfiles/.bin

if [ `uname` = Darwin ]; then
    sh init_mac.sh
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
    sh init_linux.sh
fi
