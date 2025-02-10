# set PIPENV behaviour to always place .venv inside the project
export PIPENV_VENV_IN_PROJECT=true

if [ `uname` = "Darwin" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # set op homebrew
  if [ -e /opt/homebrew ]; then
    HOMEBREW_ROOT=/opt/homebrew
  else
    HOMEBREW_ROOT=/usr/local
  fi
  export HOMEBREW_ROOT

  eval $(${HOMEBREW_ROOT}/bin/brew shellenv)

  # set up pyenv
  export PYENV_ROOT=${HOMEBREW_ROOT}/var/pyenv
  if command -v pyenv 1>/dev/null 2>&1; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
  fi

elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
    if [ -d /home/linuxbrew/.linuxbrew/bin ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        ulimit -n 65535
    fi
fi
