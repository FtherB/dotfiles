#!/bin/bash

# linux setup
. /etc/os-release
case $ID in
    ubuntu)
        echo 'ubuntu'
        sudo apt-get install -y software-properties-common
        sudo add-apt-repository -y ppa:neovim-ppa/unstable
        sudo apt-get -y update
        sudo apt-get install -y neovim
        sudo apt-get -y upgrade

        cd ${HOME}/dotfiles/.bin
        sh ./reinstall_nvim.sh
        sh ./reinstall_vim.sh

        ;;
    arch)
        echo 'Arch'
        sh ./init_arch.sh
        ;;
esac

cd ${HOME}/dotfiles/.bin
sh ./link.sh
