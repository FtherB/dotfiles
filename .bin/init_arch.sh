#!/bin/bash

sudo pacman -Syyu --noconfirm

sudo echo "# Misc options\n#UseSyslog\n#UseDelta\n#TotalDownload\nCheckSpace\n#VerbosePkgLists\nILoveCandy" >> /etc/pacman.conf

sudo pacman -S tmux --noconfirm

sudo pacman -S zsh --noconfirm

sudo pacman -S cmake ninja gettext --noconfirm
sudo pacman -S gcc clang --noconfirm

sudo pacman -S node yarn --noconfirm

sudo pacman -S starship
