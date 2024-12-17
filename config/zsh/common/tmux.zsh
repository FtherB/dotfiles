export BLD_DIR=${HOME}/.local/buildtools
if [ -d "${BLD_DIR}" ]; then
	export PATH="${BLD_DIR}/bin:$PATH"
fi

export TMUX_DIR=${HOME}/.local/tmux
if [ -d "${TMUX_DIR}" ]; then
	export PATH="${TMUX_DIR}/bin:$PATH"
fi
