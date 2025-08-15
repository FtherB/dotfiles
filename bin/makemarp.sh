#!/bin/bash

TEMPLATE_DIR=${HOME}/templates/marp-templates


if [ -d $1 ]; then
    echo $1: already exists.
    exit 1
fi

mkdir $1
cd $1

cp -r ${TEMPLATE_DIR}/slides ./slides
cp -r ${TEMPLATE_DIR}/themes ./themes
cp ${TEMPLATE_DIR}/run.sh ./run.sh
cp ${TEMPLATE_DIR}/.marprc.yml ./.marprc.yml
cp ${TEMPLATE_DIR}/engine.mjs ./engine.mjs
cp ${TEMPLATE_DIR}/package.json ./package.json

echo 'Installing marp-cli...'
sh ./run.sh install
