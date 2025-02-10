#!bin/sh

# reference: https://qiita.com/uhooi/items/95ffbfc1270df79f1fbd

CURRENT_DIR=`dirname $0`
NVIM_ROOT=${HOME}/neovim/neovim
NVIM_INSTALL_DIR=${HOME}/.local/nvim

cd ${NVIM_ROOT}

git fetch --prune origin
git rebase origin/master

make \
    CMAKE_BUILD_TYPE=Release \
    CMAKE_INSTALL_PREFIX=${NVIM_INSTALL_DIR}

make install

cd ${CURRENT_DIR}
