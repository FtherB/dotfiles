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

# nvim alias

if builtin command -v nvim > /dev/null; then
    alias vi="nvim"
    alias view="nvim -R"
elif builtin commanc -v vim > /dev/null; then
    alias vi="vim"
fi
