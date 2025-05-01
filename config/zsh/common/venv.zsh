# initial setup if venv exists
if [ -n "$VIRTUAL_ENV" ]; then
    deactivate
fi
source ${HOME}/dotfiles/bin/find_venv.sh

cd() {
    builtin cd "$@"
    source ${HOME}/dotfiles/bin/find_venv.sh
}
