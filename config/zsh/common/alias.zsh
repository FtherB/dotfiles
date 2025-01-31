
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

alias globalip="curl ipecho.net/plain; echo"

alias tree='cmd="command tree -a -I .git -I .DS_Store"; echo $cmd; eval ${cmd}'

if [ -d ${HOME}/.cargo ]; then
    . "$HOME/.cargo/env"
fi

export PATH="${HOME}/.local/apps:$PATH"
