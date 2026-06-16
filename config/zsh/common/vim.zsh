# neovim PATH
export NEOVIM_HOME=$HOME/.local/nvim
if [ -d "${NEOVIM_HOME}" ]; then
	export PATH="${NEOVIM_HOME}/bin:$PATH"
fi

export NVIM_APPNAME=nvim

# vim PATH
export VIM_HOME=$HOME/.local/vim
if [ -d "${VIM_HOME}" ]; then
    export PATH="${VIM_HOME}/bin:$PATH"
fi

# nvim alias

if builtin command -v nvim > /dev/null; then
    alias vi="nvim"
    alias view="nvim -R"
elif builtin commanc -v vim > /dev/null; then
    alias vi="vim"
fi

nvimapp() {
    case $# in
        0)
            echo $NVIM_APPNAME
            return 0
            ;;
        1)
            if [ $1 -eq 0 ]; then
                export NVIM_APPNAME=nvim
            elif [ $1 -eq 1 ]; then
                export NVIM_APPNAME=nvim_tiny
            else
                export NVIM_APPNAME=$1
            fi
            ;;
        *)
            echo 'invalid arguments'
            return 1
            ;;
    esac
}
