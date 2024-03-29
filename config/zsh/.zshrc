
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

    ### End of Zinit's installer chunk
    #
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"

# neovim PATH
export NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
	export PATH="${NEOVIM_HOME}/bin:$PATH"
fi

# function updatenvim(){
#     reinstall() {
#         sh $HOME/dotfiles/.bin/reinstall_nvim.sh
#     }
# 
#     help() {
#         echo 'update neovim to the newest version.'
#         echo 'if updatenvim does not work, use -r option.'
#     }
# 
#     for arg in $*
#     do
#         case $arg in
#             -h|--help)
#                 help
#                 return
#                 ;;
# 
#             -r|--reinstall)
#                 reinstall
#                 return
#                 ;;
#             *)
#                 sh $HOME/dotfiles/.bin/install_nvim.sh
#         esac
#     done
# }

alias python="python3"
alias pip="python3 -m pip"

# ls command
alias ls='ls -a'
export LSCOLORS=gxfxcxdxbxGxDxabagaca

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

# setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
# \$ '

# show current github account
export PROMPT="
%F{green}[%~]%f <`git config user.name`> %F{cyan}$(__git_ps1 "(%s)")%f
=> %# "
RPROMPT='%*'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# python settings
if [ `uname` = "Darwin" ]; then
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
fi

alias globalip="curl ipecho.net/plain; echo"


alias tree='cmd="command tree -a -I .git"; echo $cmd; eval ${cmd}'

# curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"
