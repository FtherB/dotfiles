#!/bin/bash

pane_pid="$1"

case "$pane_pid" in
    ''|*[!0-9]*)
        exit 1
        ;;
esac

tpgid="$(
    ps -p "$pane_pid" -o tpgid= 2>/dev/null |
        awk '{ print $1 }'
)"

case "$tpgid" in
    ''|*[!0-9]*)
        exit 1
        ;;
esac

pid="$(
    ps -ax -o pid=,pgid= 2>/dev/null |
        awk -v pgid="$tpgid" '
            $2 == pgid && $1 == pgid {
                print $1
                exit
            }

            $2 == pgid && first == "" {
                first = $1
            }

            END {
                if (first != "") {
                    print first
                }
            }
        '
)"

[ -n "$pid" ] && printf '%s\n' "$pid"
