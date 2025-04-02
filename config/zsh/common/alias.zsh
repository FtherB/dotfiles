
# nvim
alias vi="nvim"
alias view="nvim -R"
alias sudo="sudo "

# wails
alias wails="$HOME/go/bin/wails"

# python
alias pytnon="python3"
alias pip="python3 -m pip"

# ls
alias ls="lsd"
export LSCOLORS=gxfxcxdxbxGxDxabagaca

alias l="lsd -a"

alias globalip="curl ipecho.net/plain; echo"

alias tree='cmd="command tree -a -I .git -I .DS_Store"; echo $cmd; eval ${cmd}'

if [ -d ${HOME}/.cargo ]; then
    . "$HOME/.cargo/env"
fi

export PATH="${HOME}/.local/apps:$PATH"

# vifm
function vf() {
    local dst="$(command vifm . --choose-dir -)"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

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
