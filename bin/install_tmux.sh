#!/bin/bash

cd ${HOME}
cd tmux_build

# git clone https://github.com/tmux/tmux.git
cd tmux

git fetch --prune origin
git rebase origin/master

sh ./autogen.sh

PKG_CONFIG_PATH=${HOME}/.local/libtool/lib/pkgconfig ./configure --prefix=${HOME}/.local/tmux --enable-sixel --enable-utf8proc LDFLAGS="-L${HOME}/.local/buildtools/lib" CFLAGS="-I${HOME}/.local/buildtools/include"

make
make install
