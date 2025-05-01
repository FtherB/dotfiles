#!/bin/bash


activate_venv() {
    if [ -e ".venv/bin/activate" ]; then
        source .venv/bin/activate
        echo "venv in $(pwd) activated"
    elif [[ $(ls -a -U1 .venv/ |wc -l) < 1 ]]; then
        echo ".venv directory is found in $(pwd), yet there is no venv."
    elif [[ $(ls -a -U1 .venv/ |wc -l) > 1 ]]; then
        echo "There are at least 2 venv directories in $(pwd)/.venv."
    else
        source .venv/$(ls .venv/)/bin/activate
    fi
}

find_venv() {
    CURRENT_DIR="`pwd`"
#        echo "$CURRENT_DIR"
#        echo "$HOME"
    while [[ $(pwd) != "$HOME" ]] && [[ $(pwd) == "$HOME"* ]];
    do
#             echo "$(pwd)"
#             echo "`pwd`"
        if [ -d .venv ]; then
            activate_venv
            break
        fi
        builtin cd ..
    done
    builtin cd "$CURRENT_DIR"
}


if [ -z "$VIRTUAL_ENV" ]; then
    find_venv
elif [[ $(pwd) != "${VIRTUAL_ENV%/.venv*}"* ]]; then
    deactivate
    echo 'venv deactivated'
    find_venv
fi
