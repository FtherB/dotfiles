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

    printf ' (%s v%s) ' "$name" "$ver"
}

function show_conda() {
    if [ -z "${CONDA_PROMPT_MODIFIER:-}" ]; then
        return
    fi

    if [ -z "${VIRTUAL_ENV}" ]; then
        printf ' (conda:%s)' "${CONDA_PROMPT_MODIFIER}"
    else
        printf ' (conda:%s) ' "${CONDA_PROMPT_MODIFIER}"
    fi
}


__CMD_START_NS=""
__LAST_ELAPSED_MS=0
__TIMER_ARMED=1
__IN_PROMPT=0

_now_ns() {
  if date +%s%N >/dev/null 2>&1; then
    date +%s%N
  else
    gdate +%s%N
  fi
}

timer_debug_trap() {
  (( __IN_PROMPT )) && return 0

  if (( __TIMER_ARMED )); then
    __CMD_START_NS="$(_now_ns)"
    __TIMER_ARMED=0
  fi
}

timer_prompt_hook() {
  __IN_PROMPT=1

  if [[ -n "${__CMD_START_NS:-}" ]]; then
    local end
    end="$(_now_ns)"
    __LAST_ELAPSED_MS=$(( (end - __CMD_START_NS) / 1000000 ))
  else
    __LAST_ELAPSED_MS=0
  fi

  __CMD_START_NS=""
  __TIMER_ARMED=1
  __IN_PROMPT=0
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

timer_ps1() {
  local ms="${__LAST_ELAPSED_MS:-0}"
  printf ' %s ' "$(format_duration "$ms")"
}

trap 'timer_debug_trap' DEBUG

if [[ -n "${PROMPT_COMMAND:-}" ]]; then
  PROMPT_COMMAND="timer_prompt_hook; ${PROMPT_COMMAND}"
else
  PROMPT_COMMAND="timer_prompt_hook"
fi

OSSYM=`os_symbols`
export VIRTUAL_ENV_DISABLE_PROMPT=1

if is_container; then
    CONT='(container)'
else
    CONT=''
fi

# --- PS1 appearance ---
PS1_ARW=''
PS1_OS="\[\e[38;2;9;12;12;48;2;102;150;255m\] ${OSSYM} "
PS1_SP0="\[\e[38;2;102;150;255;48;2;173;199;255m\]${PS1_ARW}"

PS1_HST="\[\e[38;2;28;58;82;48;2;173;199;255m\] \h${CONT} "
PS1_SP1="\[\e[38;2;173;199;255;48;5;15m\]${PS1_ARW}"

PS1_USR="\[\e[38;2;28;58;82;48;5;15m\] \u "
PS1_SP2="\[\e[38;5;15;48;2;59;118;240m\]${PS1_ARW}"

PS1_DIR="\[\e[38;2;228;228;228;48;2;59;118;240m\] \w "
PS1_SP3="\[\e[38;2;59;118;240;48;2;0;79;122m\]${PS1_ARW}"

PS1_PY="\[\e[38;2;228;228;228;48;2;0;79;122m\]"
PS1_SP4="\[\e[38;2;0;79;122;48;2;28;58;94m\]${PS1_ARW}"

PS1_DUR="\[\e[38;2;141;251;210;48;2;28;58;94m\]"
PS1_SP5="\[\e[38;2;28;58;94;49m\]${PS1_ARW}"

PS1_BREAK="\n"
PS1_CMD="\[\e[0;36;49m\]\$ "
PS1_RST="\[\e[0;39;49m\]"

export PS1="$PS1_BREAK$PS1_OS$PS1_SP0$PS1_HST$PS1_SP1$PS1_USR$PS1_SP2$PS1_DIR$PS1_SP3\
$PS1_PY\$(show_conda)\$(show_venv)\
$PS1_SP4$PS1_DUR\$(timer_ps1)\
$PS1_SP5$PS1_BREAK$PS1_CMD$PS1_RST"
