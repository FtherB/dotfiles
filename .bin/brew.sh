echo 'installing mac applications...'
brew update
brew upgrade
brew install cask
# brew install neovim --HEAD
brew install octave
brew install ffmpeg
brew install yt-dlp

# cask
brew install --cask warp
brew install --cask mactex-no-gui
brew install --cask iTerm2
brew install --cask google-chrome
brew install --cask raycast
brew install --cask slack
brew install --cask firefoxe
brew install --cask microsoft-office
brew install --cask zoom
brew install --cask atok

# python
brew install pyenv
pyenv install 3.11.4
pyenv install 3.9.6
pyenv global 3.11.4
pip install numpy
pip install matplotlib
pip install pandas
pip install scipy

# node
brew install node

#openjdk
brew install openjdk@21

# im-select
brew tap daipeihust/tap
brew install im-select

# zsh plugins
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
