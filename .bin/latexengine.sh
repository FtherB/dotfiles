#!/bin/bash

help() {
    echo 'Usage: latexengine [platex/lualatex]'
    return
}

platex() {
    unlink ${HOME}/.latexmkrc
    ln -s ~/dotfiles/config/latex/latexmkrc_platex ~/.latexmkrc
    return
}

lualatex() {
    unlink ${HOME}/.latexmkrc
    ln -s ~/dotfiles/config/latex/latexmkrc_lualatex ~/.latexmkrc
    return
}

uplatex() {
    unlink ${HOME}/.latexmkrc
    ln -s ~/dotfiles/config/latex/latexmkrc_uplatex ~/.latexmkrc
}

pdflatex() {
    unlink ${HOME}/.latexmkrc
    ln -s ~/dotfiles/config/latex/latexmkrc_pdflatex ~/.latexmkrc
}

showengine(){
    readlink ${HOME}/.latexmkrc
}

for engine in $*
do
    case $engine in
        help)
            help
            exit 0
            ;;
        platex)
            platex
            exit 0
            ;;
        lualatex)
            lualatex
            exit 0
            ;;
        uplatex)
            uplatex
            exit 0
            ;;
        pdflatex)
            pdflatex
            exit 0
            ;;
        *)
            echo $engine: unknown argument
            exit 1
            ;;
    esac
done
showengine
exit 0
