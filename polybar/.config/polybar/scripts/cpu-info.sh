#!/bin/sh

case "$1" in
    --popup)
        # Use htop-like output for top CPU-consuming processes
        notify-send "CPU Usage (%)" "$(ps axch -o cmd:10,pcpu k -pcpu | head | awk '{printf "%s %s%%\n", $1, $2}')"
        ;;
    *)
        read -r cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat

        # Calculate total and idle times
        total=$((user + nice + system + idle + iowait + irq + softirq + steal))
        idle_time=$((idle + iowait))

        # Sleep for a short interval
        sleep 2

        # Read the line again
        read -r cpu2 user2 nice2 system2 idle2 iowait2 irq2 softirq2 steal2 guest2 guest_nice2 < /proc/stat

        # Calculate new total and idle times
        total2=$((user2 + nice2 + system2 + idle2 + iowait2 + irq2 + softirq2 + steal2))
        idle_time2=$((idle2 + iowait2))

        # Calculate deltas
        total_diff=$((total2 - total))
        idle_diff=$((idle_time2 - idle_time))

        # Calculate CPU usage percentage
        usage=$((100 * (total_diff - idle_diff) / total_diff))
        echo "$usage%"
        ;;
esac
