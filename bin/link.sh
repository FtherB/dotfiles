#!/bin/bash

link_file()
{
    if [ -h $2 ]; then
        unlink $2
        echo 'link removed: '$2
    elif [ -e $2 ]; then
        rm -rf $2
        echo 'removed: '$2
    fi
    ln -s $1 $2
    echo 'linked: '$1
}

link_directory()
{
    if [ -h $2 ]; then
        unlink $2
        echo 'link removed: '$2
    elif [ -d $2 ]; then
        rm -rf $2
        echo 'removed: '$2
    fi
    ln -s $1 $2
    echo 'linked: '$1
}


mkdir -p ${HOME}/.config

# nvim
link_directory ~/dotfiles/nvim ~/.config/nvim

# .zshrc
link_file ~/dotfiles/config/zsh/.zshrc ~/.zshrc

# .gitconifg
link_file ~/dotfiles/config/git_config/.gitconfig ~/.gitconfig

# .zprofile
link_file ~/dotfiles/config/zsh/.zprofile ~/.zprofile

# .latexmkrc
link_file ~/dotfiles/config/.latexmkrc ~/.latexmkrc

# warp themes (directory)
link_directory ~/dotfiles/config/terminal/warp ~/.warp

# tmux config
link_file ~/dotfiles/config/tmux/tmux.conf ~/.tmux.conf

# powerline10k
# link_file ~/dotfiles/config/zsh/.p10k.zsh ~/.p10k.zsh

# .vimrc
link_file ~/dotfiles/config/.vimrc ~/.vimrc

# alacritty
mkdir -p ${HOME}/.config/alacritty
link_file ~/dotfiles/config/terminal/alacritty.toml ~/.config/alacritty/alacritty.toml

# starship
link_file ~/dotfiles/config/zsh/starship.toml ~/.config/starship.toml

# wezterm config
link_directory ~/dotfiles/config/terminal/wezterm ~/.config/wezterm

# hyper
link_file ~/dotfiles/config/terminal/hyper/hyper.js ~/.hyper.js
link_directory ~/dotfiles/config/terminal/hyper/hyper_plugins ~/.hyper_plugins

# zathura
mkdir -p ${HOME}/.config/zathura
link_file ~/dotfiles/config/zathurarc ~/.config/zathura/zathurarc

# vifm
link_directory ~/dotfiles/config/vifm ~/.config/vifm

# cmus
mkdir -p ${HOME}/.config/cmus
link_file ~/dotfiles/config/cmus/rc ~/.config/cmus/rc

# karabiner
mkdir -p ~/.config/karabiner/assets
link_directory ~/dotfiles/config/karabiner ~/.config/karabiner/assets/complex_modifications
