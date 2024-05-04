#!bin/sh

# Reference: https://qiita.com/uhooi/items/5bd6a3c58b2ff3eed959

CURRENT_DIR=`dirname $0`
NVIM_ROOT=${HOME}/vim/vim
NVIM_INSTALL_DIR=${HOME}/.local/vim

cd ${NVIM_ROOT}

git fetch --prune origin
git rebase origin/master

make distclean

./configure \
  --enable-cscope \
  --enable-fail-if-missing \
  --enable-luainterp=yes \
  --with-lua-prefix=/opt/homebrew/Cellar/lua/5.4.6 \
  --enable-python3interp=yes \
  --with-python3-command=python \
  --enable-rubyinterp=yes \
  --prefix=${HOME}/.local/vim \
  --with-compiledby=FtherB \
  --with-tlib=ncurses \
  CFLAGS='-I/opt/homebrew/include'

make

make install prefix=${HOME}/.local/vim

cd ${CURRENT_DIR}
