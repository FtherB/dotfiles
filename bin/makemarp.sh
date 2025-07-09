#!/bin/bash

TEMPLATE_DIR=${HOME}/templates/marp-templates


if [ -d $1 ]; then
    echo $1: already exists.
    exit 1
fi

mkdir $1
cd $1

cp -r ${TEMPLATE_DIR}/slide ./slide
cp -r ${TEMPLATE_DIR}/theme ./theme
cp ${TEMPLATE_DIR}/run.sh ./run.sh
cp ${TEMPLATE_DIR}/package.json ./package.json

echo 'Installing marp-cli...'
sh ./run.sh install
