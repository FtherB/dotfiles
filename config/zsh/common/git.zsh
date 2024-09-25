# git account
function gitftherb(){
    git config --global user.name "FtherB"
    git config --global user.email "aliclahso29103@gmail.com"
    source ~/.zshrc
}

function gits255(){
    git config --global user.name "S-255"
    git config --global user.email "threeair7@outlook.jp"
    source ~/.zshrc
}


source ~/dotfiles/config/zsh/git-prompt.sh

fpath=(~/dotfiles/config/zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/dotfiles/config/zsh/git-completion.bash
autoload _Uz compinit && compinit

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
