#!/bin/bash

cd ${HOME}
mkdir buildtools
cd ${HOME}/buildtools

BIN_DIR=${HOME}/.local/buildtools

# build m4
curl -O -L https://ftp.gnu.org/gnu/m4/m4-latest.tar.gz
tar -xzf m4-*
cd m4-*/

./configure --prefix=${BIN_DIR}
make
make install

source ~/.zshrc
cd ..

# build autoconf
curl -O -L https://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.gz
tar -xzf autoconf-*
cd autoconf-*/

./configure --prefix=${BIN_DIR}
make
make install

source ~/.zshrc
cd ..

git clone https://github.com/pkgconf/pkgconf.git
cd pkgconf

sh autogen.sh
./configure --prefix=${BIN_DIR}
make
make install

source ~/.zshrc
cd ..

# build automake
curl -O -L https://ftp.gnu.org/gnu/automake/automake-1.17.tar.gz
tar -xzf automake-*
cd automake-*/

./configure --prefix=${BIN_DIR}
make
make install

source ~/.zshrc
cd ..

curl -O -L https://repo.jing.rocks/gnu/libtool/libtool-2.5.3.tar.gz
tar -xzf libtool-*
cd libtool-*/

./configure --prefix=${BIN_DIR}
make
make install

source ~/.zshrc
cd ..

# build ncurses
curl -O -L https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz
tar -xzf ncurses-*
cd ncurses-*/

./configure --enable-pc-files --prefix=${HOME}/.local/buildtools --with-pkg-config-libdir=${HOME}/.local/buildtools/lib/pkgconfig --with-termlib
make
make install
