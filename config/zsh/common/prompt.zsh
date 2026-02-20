setopt PROMPT_SUBST
export VIRTUAL_ENV_DISABLE_PROMPT=1

SEPARATOR=''
LINE_BREAK=$'\n'

function os_symbols() {
    if [ `uname` = Darwin ]; then
        echo ""
    elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
        . /etc/os-release
        case $ID in
            ubuntu)
                echo ""
                ;;
            arch)
                echo ""
                ;;
            centos)
                echo ""
                ;;
            fedora)
                echo ""
                ;;
            debian)
                echo ""
                ;;
            *)
                echo ""
                ;;
        esac
    else
        echo '？'
    fi
}

function is_container() {
  [[ -f /.dockerenv ]] && return 0
  [[ -n "${APPTAINER_NAME:-}${SINGULARITY_NAME:-}" ]] && return 0
  grep -qaE '(docker|containerd|kubepods)' /proc/1/cgroup 2>/dev/null && return 0
  return 1
}

function show_venv() {
    [[ -n "${VIRTUAL_ENV:-}" ]] || return 0

    local name py ver
    name="$(basename "$(dirname "$VIRTUAL_ENV")")"

    py="$VIRTUAL_ENV/bin/python"
    [[ -x "$py" ]] || return 0
    ver="$("$py" -V 2>&1 | awk '{print $2}')"

    printf '(%s v%s)' "$name" "$ver"
}

function show_conda() {
    if [ -z "${CONDA_PROMPT_MODIFIER:-}" ]; then
        return
    fi

    printf '(conda:%s)' "${CONDA_PROMPT_MODIFIER}"
}

ESC_STR=$'\033'

PS1_SP3_R="${ESC_STR}[38;2;59;118;240;48;2;0;79;122m${SEPARATOR}"
PS1_SP4_R="${ESC_STR}[38;2;0;79;122;48;2;28;58;94m${SEPARATOR}"
SKIP_PY_R="${ESC_STR}[38;2;59;118;240;48;2;28;58;94m${SEPARATOR}"
PY_STY_R="${ESC_STR}[38;2;228;228;228;48;2;0;79;122m"

# zsh: ANSI escape をプロンプト安全にするラッパ
__pesc() { print -nr -- "%{$1%}"; }

show_python() {
  local conda venv

  conda="$(show_conda)"
  venv="$(show_venv)"

  if [[ -n "$conda" && -n "$venv" ]]; then
    __pesc "${PS1_SP3_R}"
    print -nr -- " "
    __pesc "${PY_STY_R}"
    print -nr -- "${conda}${venv}"
    print -nr -- " "
    __pesc "${PS1_SP4_R}"
  elif [[ -n "$conda" ]]; then
    __pesc "${PS1_SP3_R}"
    print -nr -- " "
    __pesc "${PY_STY_R}"
    print -nr -- "${conda}"
    print -nr -- " "
    __pesc "${PS1_SP4_R}"
  elif [[ -n "$venv" ]]; then
    __pesc "${PS1_SP3_R}"
    print -nr -- " "
    __pesc "${PY_STY_R}"
    print -nr -- "${venv}"
    print -nr -- " "
    __pesc "${PS1_SP4_R}"
  else
    __pesc "${SKIP_PY_R}"
  fi
}

# ====== timer (integer microseconds) ======
zmodload zsh/datetime 2>/dev/null
typeset -g __CMD_START_SEC=""
typeset -g __CMD_START_USEC=""
typeset -g __LAST_ELAPSED_MS=0
typeset -g __HAVE_LAST=0

__epoch_usec() {
  local frac="${EPOCHREALTIME#*.}"
  frac="${frac}000000"
  print -r -- "${frac[1,6]}"
}

timer_preexec() {
  __CMD_START_SEC=$EPOCHSECONDS
  __CMD_START_USEC=$(__epoch_usec)
  __HAVE_LAST=0
}

format_duration() {
  local ms d h m s out=""
  ms=$1
  d=$(( ms / 86400000 )); ms=$(( ms % 86400000 ))
  h=$(( ms / 3600000 ));  ms=$(( ms % 3600000 ))
  m=$(( ms / 60000 ));    ms=$(( ms % 60000 ))
  s=$(( ms / 1000 ));     ms=$(( ms % 1000 ))

  (( d > 0 )) && out+="${d}d"
  (( h > 0 )) && out+=$(printf "%dh" "$h")
  (( m > 0 )) && out+=$(printf "%dm" "$m")
  (( s > 0 )) && out+=$(printf "%ds" "$s")
  out+=$(printf "%dms" "$ms")
  printf '%s' "$out"
}

timer_prompt() {
    if (( __HAVE_LAST )); then
        printf ' %s ' "$(format_duration "${__LAST_ELAPSED_MS:-0}")"
    else
        printf ' - '
    fi
}

timer_precmd() {
  if [[ -n "$__CMD_START_SEC" && -n "$__CMD_START_USEC" ]]; then
    local end_sec end_usec sec_diff usec_diff total_usec
    end_sec=$EPOCHSECONDS
    end_usec=$(__epoch_usec)

    sec_diff=$(( end_sec - __CMD_START_SEC ))
    usec_diff=$(( 10#$end_usec - 10#$__CMD_START_USEC ))
    total_usec=$(( sec_diff * 1000000 + usec_diff ))
    (( total_usec < 0 )) && total_usec=0

    __LAST_ELAPSED_MS=$(( total_usec / 1000 ))
    __HAVE_LAST=1
  else
    __LAST_ELAPSED_MS=0
    __HAVE_LAST=0
  fi

  __CMD_START_SEC=""
  __CMD_START_USEC=""

  # ★ ここで毎回PROMPTを作り直す（これが決定打）
  local cont os
  if is_container; then cont='(container)'; else cont=''; fi
  os="$(os_symbols)"

  PROMPT="${LINE_BREAK}\
%F{#090c0c}%K{#6696ff} ${os} \
%F{#6696ff}%K{#ffffff}${SEPARATOR}%F{#1c3a5e}%K{#ffffff} %n${cont} \
%F{#ffffff}%K{#3b76f0}${SEPARATOR}%F{#e4e4e4}%K{#3b76f0} %~ \
$(show_python)\
%F{#8dfbd2}%K{#1c3a52}$(timer_prompt)\
%F{#1c3a52}%k${SEPARATOR}%f%k${LINE_BREAK}❯ "
}

# フック登録（重複回避）
(( ${preexec_functions[(Ie)timer_preexec]} )) || preexec_functions+=(timer_preexec)
(( ${precmd_functions[(Ie)timer_precmd]} )) || precmd_functions+=(timer_precmd)
# ==========================================
