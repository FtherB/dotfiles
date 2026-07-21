alias sudo="sudo "

# wails
alias wails="$HOME/go/bin/wails"

# python
alias pytnon="python3"
alias pip="python3 -m pip"
alias py="python3"

# ls
if command -v lsd &> /dev/null; then
    alias l="lsd -a"
    alias ls="lsd"
    alias ll="lsd -al"
    alias llt="lsd -alt"
else
    alias l="ls -a"
    alias ll="ls -al"
    alias llt="ls -alt"
fi

alias globalip="curl ipecho.net/plain; echo"

alias tree='cmd="command tree -a -I .git -I .DS_Store"; echo $cmd; eval ${cmd}'

if [ -d ${HOME}/.cargo ]; then
    . "$HOME/.cargo/env"
fi

alias pdf2txt='pdftotext -layout -nopgbrk'
