# language setting
export LANG=en_US.UTF-8

# starship
export PATH="${HOME}/.local/starship:$PATH"
eval "$(starship init zsh)"

# python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
