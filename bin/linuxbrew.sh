#!/bin/bash

if ! command -v brew &> /dev/null 
then
    echo 'installing brew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo 'brew already installed'
fi

brew install zsh
sudo echo '/home/linuxbrew/.linuxbrew/bin/zsh' >> /etc/shells

brew tap Homebrew/bundle
brew bundle
