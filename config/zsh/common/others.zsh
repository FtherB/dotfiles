# starship
eval "$(starship init zsh)"

# python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
