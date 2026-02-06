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

OSSYM=`os_symbols`

if is_container; then
    CONT='(container)'
else
    CONT=''
fi

PS1_ARW=''
PS1_OS="\[\e[38;2;9;12;12;48;2;102;150;255m\] ${OSSYM} "
PS1_SP0="\[\e[38;2;102;150;255;48;2;173;199;255m\]${PS1_ARW}"
PS1_HST="\[\e[38;2;28;58;82;48;2;173;199;255m\] \h${CONT} "
PS1_SP1="\[\e[38;2;173;199;255;48;5;15m\]${PS1_ARW}"
PS1_USR="\[\e[38;2;28;58;82;48;5;15m\] \u "
PS1_SP2="\[\e[38;5;15;48;2;59;118;240m\]${PS1_ARW}"
PS1_DIR="\[\e[38;2;228;228;228;48;2;59;118;240m\] \w "
PS1_SP3="\[\e[38;2;59;118;240;49m\]${PS1_ARW}"
PS1_BREAK="\n"
PS1_CMD="\[\e[0;36;49m\]\$ "
PS1_RST="\[\e[0;39;49m\]"
export PS1=$PS1_BREAK$PS1_OS$PS1_SP0$PS1_HST$PS1_SP1$PS1_USR$PS1_SP2$PS1_DIR$PS1_SP3$PS1_BREAK$PS1_CMD$PS1_RST
