#!/bin/bash

help() {
    echo 'Usage: latexengine [engine_name]'
    echo 'Available: platex/uplatex/pdflatex/lualatex'
    echo 'If no argument is given, display the current engine'
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
    res=$(readlink ${HOME}/.latexmkrc)
    echo ${res##*latexmkrc_}
}

for engine in $*
do
    case $engine in
        help)
            help
            exit 0
            ;;
        platex | p)
            platex
            exit 0
            ;;
        lualatex | lua)
            lualatex
            exit 0
            ;;
        uplatex | up)
            uplatex
            exit 0
            ;;
        pdflatex | pdf)
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
