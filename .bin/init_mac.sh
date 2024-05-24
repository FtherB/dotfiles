#!/bin/bash
# Note: root privileges will be required.

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

# zsh setup
brew install zsh
sudo echo '/opt/homebrew/bin/zsh' >> /etc/shells
rm -rf ${HOME}/.zshrc
ln -s ~/dotfiles/config/zsh/.zshrc ~/.zshrc
source ./.zshrc

# install packages
brew bundle

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

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sh ./link.sh

source ~/.zshrc

sh ./rb.sh
