#!/bin/bash

cd ${HOME}/dotfiles/.bin

echo 'initializing mac'
sh init_mac.sh

echo 'symbolic links'
sh link_mac.sh
