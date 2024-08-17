#!/bin/bash

TEMPLATE_DIR=${HOME}/tex/templates_private/report


if [ -d $1 ]; then
    echo $1: already exists.
    exit 1
fi

mkdir $1
cd $1

cp ${TEMPLATE_DIR}/main.tex ./main.tex
cp ${TEMPLATE_DIR}/references.bib ./references.bib
cp -r ${TEMPLATE_DIR}/content ./content
cp ${TEMPLATE_DIR}/reportpre.sty ./reportpre.sty

mkdir figures
