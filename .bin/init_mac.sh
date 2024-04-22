#!/bin/bash

# mac setup
echo 'mac'
BIN_DIR=${HOME}/dotfiles/.bin

cd ${BIN_DIR}

mkdir -p ${HOME}/.config/
if ! command -v brew &> /dev/null 
then
    echo 'installing brew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo 'brew already installed'
fi

# install packages
bash ./brew.sh

#neovim install
if ![ -d ${HOME}/neovim/neovim]; then
    cd ${HOME}
    mkdir neovim
    cd ${HOME}/neovim
    git clone https://github.com/neovim/neovim
    cd ${BIN_DIR}
fi

bash ./install_nvim.sh

# setup gitignore
git config --global core.excludesfile ${HOME}/dotfiles/config/git/.gitignore_global
