#!/bin/bash

link_file()
{
    if [ -h $2 ]; then
        echo 'already linked: '$2
    else
        if [ -e $2 ]; then
            rm -rf $2
            echo 'removed: '$2
        fi
        ln -s $1 $2
        echo 'linked: '$1
    fi
}

link_directory()
{
    if [ -h $2 ]; then
        echo 'already linked: '$2
    else
        if [ -d $2 ]; then
            rm -rf $2
            echo 'removed: '$2
        fi
        ln -s $1 $2
        echo 'linked: '$1
    fi
}

# nvim
link_directory ~/dotfiles/nvim ~/.config/nvim

# .zshrc
link_file ~/dotfiles/config/zsh/.zshrc ~/.zshrc

# .gitconifg
link_file ~/dotfiles/config/git/.gitconfig ~/.gitconfig

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
link_file ~/dotfiles/config/terminal/alacritty.toml ~/.config/alacritty/alacritty.toml

# starship
link_file ~/dotfiles/config/zsh/starship.toml ~/.config/starship.toml

# wezterm config
link_file ~/dotfiles/config/terminal/wezterm.lua ~/.wezterm.lua

# hyper
link_file ~/dotfiles/config/terminal/hyper/hyper.js ~/.hyper.js
link_directory ~/dotfiles/config/terminal/hyper/hyper_plugins ~/.hyper_plugins
