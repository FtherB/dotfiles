# # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

cowsay 'NIGHTMARE BEGINNING...'

# # oh my zsh
# export ZSH="$HOME/.oh-my-zsh"
# 
# ZSH_THEME="powerlevel10k/powerlevel10k"
# 
# plugins=(git)
# source $ZSH/oh-my-zsh.sh

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
# alias vim="nvim"
alias view="nvim -R"
alias sudo="sudo "

# neovim PATH
export NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
	export PATH="${NEOVIM_HOME}/bin:$PATH"
fi

# vim PATH
export VIM_HOME=$HOME/.local/vim
if [ -d "${VIM_HOME}" ]; then
    export PATH="${VIM_HOME}/bin:$PATH"
fi

export PATH="opt/homebrew/opt/ncurses/bin:$PATH"
alias wails="$HOME/go/bin/wails"

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
alias ls='lsd -a'
export LSCOLORS=gxfxcxdxbxGxDxabagaca

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

# setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
# \$ '

# show current github account
# export PROMPT="
# %F{green}[%~]%f <`git config user.name`> %F{cyan}$(__git_ps1 "(%s)")%f
# => %# "
# RPROMPT='%*'
# 
# export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/opt/curl/bin:$PATH"

if [ `uname` = "Darwin" -o -d /home/linuxbrew/.linuxbrew/bin ]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# python settings
if [ `uname` = "Darwin" ]; then
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
fi

alias globalip="curl ipecho.net/plain; echo"


alias tree='cmd="command tree -a -I .git -I .DS_Store"; echo $cmd; eval ${cmd}'

# curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
export PATH="/opt/homebrew/opt/git/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# starship
eval "$(starship init zsh)"

# latexmkrc
function latexengine() {
    help() {
        echo 'Usage: latexengine [platex/lualatex]'
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

    showengine(){
        readlink ${HOME}/.latexmkrc
    }

    for engine in $*
    do
        case $engine in
            help)
                help
                return
                ;;
            platex)
                platex
                return
                ;;
            lualatex)
                lualatex
                return
                ;;
            uplatex)
                uplatex
                return
                ;;
            *)
                echo unknown argument: $engine
                return 1
                ;;
        esac
    done
    showengine
    return
}
