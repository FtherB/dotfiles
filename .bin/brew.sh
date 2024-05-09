#!/bin/bash

echo 'installing mac applications...'
brew update
brew upgrade
brew install cask
# brew install neovim --HEAD
brew install octave
brew install ffmpeg
brew install yt-dlp
brew install ninja cmake gettext # nvim dependencies
brew install curl
brew install iproute2mac
brew install tree
brew install node
brew install yarn --ignore-dependencies
brew install tmux
brew install neofetch
brew install rbenv
brew install libsodium lua ncurses perl # vim dependencies
brew install zsh
brew install git
brew install starship
brew install lsd

# cask
brew install --cask warp
# brew install --cask mactex-no-gui
brew install --cask iTerm2
brew install --cask google-chrome
brew install --cask raycast
brew install --cask slack
brew install --cask firefox
brew install --cask microsoft-office
brew install --cask zoom
brew install --cask atok
brew install --cask inkscape
brew install --cask thunderbird
brew install --cask hhkb
brew install --cask xnviewmp
brew install --cask discord
# brew install --cask astah-professional

# python
brew install pyenv

# node
brew install node

#openjdk
# brew install openjdk@21
brew install jenv

# im-select
brew tap daipeihust/tap
brew install im-select

# zsh plugins
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
