#!/bin/bash

OS_TYPE=$(uname)

# --------- GPU Usage ----------
gpu_info=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)
if [ $? -ne 0 ] || [ -z "$gpu_info" ]; then
  gpu_status="No GPU"
else
  i=0
  gpu_status="GPU "
  while read -r line; do
    util=$(echo "$line" | tr -d ' %')
    gpu_status+=$(printf "%d:%3s%% " "$i" "$util")
    ((i++))
  done <<< "$gpu_info"
  gpu_status="${gpu_status%" "}"  # No space
fi

# --------- CPU Usage ----------
if [ "$OS_TYPE" = "Darwin" ]; then
    # for macOS
    cpu_idle=$(top -l 1 | grep "CPU usage" | \
        awk '{for(i=1;i<=NF;i++) if ($(i)=="idle") print $(i-1)}' | sed 's/%//')
    cpu_usage=$(echo "100-$cpu_idle" | bc)
else
    # for Linux
    cpu_idle=$(top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | cut -d. -f1)
    cpu_usage=$((100 - cpu_idle))
fi
cpu_status=$(printf "CPU:%6s%%" "$cpu_usage")

# --------- RAM Usage ----------
if [ "$OS_TYPE" = "Darwin" ]; then
    # for macOS
    page_size=$(sysctl -n hw.pagesize)

    pages_active=$(vm_stat | awk '/Pages active/ {gsub(/\./,""); print $3}')
    pages_wired=$(vm_stat | awk '/Pages wired down/ {gsub(/\./,""); print $4}')
    mem_used=$(( (pages_active + pages_wired) * page_size / 1024 / 1024 ))

    mem_total=$(($(sysctl -n hw.memsize) / 1024 / 1024))
else
    # for Linux
    read -r mem_total mem_used <<< $(free -m | awk '/^Mem:/ {print $2, $3}')
fi
# padding
mem_total_width=${#mem_total}
ram_used_fmt=$(printf "%*s" "$mem_total_width" "$mem_used")
ram_status="RAM:${ram_used_fmt}MB/${mem_total}MB"

# --------- output ----------
echo "${cpu_status} | ${ram_status} | ${gpu_status}"
