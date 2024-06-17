#!/bin/bash

# linux setup
. /etc/os-release
case $ID in
    ubuntu)
        echo 'ubuntu'
        sudo apt update -y
        sudo apt install -y software-properties-common
        sudo apt -y update
        sudo apt -y upgrade

        ;;
    arch)
        echo 'Arch'
        sh ./init_arch.sh
        ;;
esac

# common setup
cd ${HOME}/dotfiles/.bin
mkdir ${HOME}/neovim
mkdir ${HOME}/neovim/neovim
sh ./reinstall_nvim.sh
mkdir ${HOME}/vim
mkdir ${HOME}/vim/vim
sh ./reinstall_vim.sh

sh ./link.sh
