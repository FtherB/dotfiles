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
