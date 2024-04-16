#!/bin/bash

# nvim config (directory)
if [ -h ${HOME}/.config/nvim]; then
    echo 'already linked: nvim'
else
    if [ -d ${HOME}/.config/nvim ]; then
        rm -rf ${HOME}/.config/nvim
    fi
    ln -s ~/dotfiles/nvim ~/.config/nvim
fi

# .zshrc
if [ -h ${HOME}/.zshrc ]; then
    echo 'already linked: .zshrc'
else
    if [ -e ${HOME}/.zshrc]; then
        rm -rf ${HOME}/.zshrc
    fi
    ln -s ~/dotfiles/config/zsh/.zshrc ~/.zshrc
fi

# .gitconfig
if [ -h ${HOME}/.gitconfig ]; then
    echo 'already linked: .gitconfig'
else
    if [ -e ${HOME}/.gitconifg ]; then
        rm -rf ${HOME}/.gitconifg
    fi
    ln -s ~/dotfiles/config/git/.gitconfig ~/.gitconfig
fi

# .zpofile
if [ -h ${HOME}/.zprofile ]; then
    echo 'already linked: .zprofile'
else
    if [ -e ${HOME}/.zprofile ]; then
        rm -rf ${HOME}/.zprofile
    fi
    ln -s ~/dotfiles/config/zsh/.zprofile ~/.zprofile
fi

# .latexmkrc
if [ -h ${HOME}/.latexmkrc ]; then
    echo 'already linked: .latexmkrc'
else
    if [ -e ${HOME}/.latexmkrc ]; then
        rm -rf ${HOME}/.latexmkrc
    fi
    ln -s ~/dotfiles/config/.latexmkrc ~/.latexmkrc
fi

# warp themes (directory)
if [ -h ${HOME}/.warp ]; then
    echo 'already linked: .warp'
else
    if [ -d ${HOME}/.warp ]; then
        rm -rf ${HOME}/.warp
    fi
    ln -s ~/dotfiles/config/.warp ~/.warp
fi
