# latexmkrc
function latexengine() {
    sh ${HOME}/dotfiles/bin/latexengine.sh $1
}

function makereport() {
    help() {
        echo "Usage: makereport [directory_name]"
    }
    for dir in $*
    do
        case $dir in
            help)
                help
                return
                ;;
            *)
                sh ${HOME}/dotfiles/bin/makereport.sh $dir
                return
                ;;
        esac
    done
    help
    return 1
}

function makemarp() {
    help() {
        echo "Usage: makemarp [directory_name]"
    }
    for dir in $*
    do
        case $dir in
            help)
                help
                return
                ;;
            *)
                sh ${HOME}/dotfiles/bin/makemarp.sh $dir
                builtin cd $dir
                return
                ;;
        esac
    done
    help
    return 1
}

# mkdir and cd
function mkd() {
    {
        if [ "$#" -ne 1 ]; then
            echo 'invalid arguments'
            return 1
        else
            mkdir -p $1
            builtin cd $1
        fi
    }
}

# vifm
function vf() {
    local dst="$(command vifm . --choose-dir -)"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

# zathura
function zt() {
    if [ `uname` = "Darwin" ] && [ "$1" = "-r" ]; then
        echo "Reinstall zathura-pdf-mupdf"
        brew reinstall zegervdv/zathura/zathura-pdf-mupdf
        return 0
    elif [ -z "$1" ]; then
        echo "invalid argument"
        echo "Usage: zt filename"
        echo "for more details: zathura --help or man zathura"
        return 1
    elif [ ! -e $1 ]; then
        echo "cannot open: $1"
        return 1
    fi
    echo "open: $1"
    zathura $1 >/dev/null 2>&1 & disown
}
