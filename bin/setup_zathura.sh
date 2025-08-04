#!/bin/bash

init() {
    mkdir -p $(brew --prefix zathura)/lib/zathura
    ln -s $(brew --prefix zathura-pdf-mupdf)/libpdf-mupdf.dylib $(brew --prefix zathura)/lib/zathura/libpdf-mupdf.dylib
    return 0
}

reinstall() {
    brew reinstall zegervdv/zathura/zathura-pdf-mupdf   
    return 0
}

case $1 in
    init)
        init
        exit 0
        ;;
    re)
        reinstall
        exit 0
        ;;
    *)
        echo 'invalid argument'
        exit 1
        ;;
esac
echo 'invalid argument'
return 1
