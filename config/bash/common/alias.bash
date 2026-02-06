alias vi="nvim"
alias view="nvim -R"
alias sudo="sudo "

alias python="python3"
alias pip="python3 -m pip"
alias py="python3"


if command -v lsd &> /dev/null; then
    alias ls="lsd"
    alias l="lsd -a"
    alias ll="lsd -al"
    alias llt="lsd -alt"
else
    alias ls="ls --color=auto"
    alias l="ls -a"
    alias ll="ls -al"
    alias llt="ls -alt"
fi
